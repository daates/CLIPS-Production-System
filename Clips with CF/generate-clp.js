// Использование:
//   node generate-clp.js facts.json rules.json kb_rules.clp

const fs = require("fs");
const path = require("path");

const [, , factsPathArg, rulesPathArg, outPathArg] = process.argv;

if (!factsPathArg || !rulesPathArg) {
  console.error(
    "Использование: node generate-clp.js facts.json rules.json [kb_rules.clp]"
  );
  process.exit(1);
}

const rulesPath = path.resolve(rulesPathArg);
const outPath = outPathArg ? path.resolve(outPathArg) : null;

function readJson(p) {
  return JSON.parse(fs.readFileSync(p, "utf8"));
}

const rulesJson = readJson(rulesPath);
const rules = rulesJson.rules || [];

// ===== Новая, простая и надежная генерация =====
function buildSingleRule(rule) {
  const conds = rule.conditions || [];
  if (!rule.id || !rule.resultFactId || conds.length === 0) {
    return "";
  }

  const ruleCf = rule.confidence ?? 1.0;

  const lines = [];
  lines.push(`(defrule ${rule.id}`);
  lines.push(`   (not (rule-fired (id ${rule.id})))`);

  // Условия (LHS)
  conds.forEach((factId, idx) => {
    lines.push(`   (known (id ${factId}) (cf ?c${idx}&:(neq ?c${idx} 0.0)))`);
  });

  lines.push(` =>`);

  // Действия (RHS)
  const cfVars = conds.map((_, idx) => `?c${idx}`);
  const minPart = cfVars.length === 1 ? cfVars[0] : `(min ${cfVars.join(" ")})`;

  lines.push(`   (bind ?premise-cf ${minPart})`);
  lines.push(`   (bind ?new-cf (* ?premise-cf ${ruleCf}))`);
  lines.push(`   (update-known ${rule.resultFactId} ?new-cf)`);
  lines.push(`   (assert (rule-fired (id ${rule.id})))`);
  lines.push(`)`);

  return lines.join("\n");
}

// ===== Формируем файл =====
let output = "";
output += "; =====================================================\n";
output += "; kb_rules.clp - Правила вывода (auto-generated)\n";
output += "; LOAD THIRD after kb_domain.clp and dialog.clp\n";
output += "; =====================================================\n\n";

for (const rule of rules) {
  if (!rule || !rule.id) continue;

  if (rule.name) {
    output += `; ${rule.id}: ${rule.name}\n`;
  }
  const body = buildSingleRule(rule);
  output += body + "\n\n";
}

if (outPath) {
  fs.writeFileSync(outPath, output, "utf8");
  console.log("Done:", outPath);
} else {
  process.stdout.write(output);
}
