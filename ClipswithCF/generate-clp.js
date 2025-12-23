// generate-clp.js
// Генерирует ТОЛЬКО правила (kb_rules.clp) из facts.json и rules.json
// Простой подход: напрямую assert (known ...)
//
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

const factsPath = path.resolve(factsPathArg);
const rulesPath = path.resolve(rulesPathArg);
const outPath = outPathArg ? path.resolve(outPathArg) : null;

function readJson(p) {
  return JSON.parse(fs.readFileSync(p, "utf8"));
}

const factsJson = readJson(factsPath);
const rulesJson = readJson(rulesPath);

const facts = factsJson.facts || [];
const rules = rulesJson.rules || [];

// Генерация правила - простой подход без функций
function buildRule(rule) {
  const conds = rule.conditions || [];
  if (!rule.resultFactId || conds.length === 0) {
    return "";
  }

  const lines = [];
  lines.push(`(defrule ${rule.id}`);

  // Правило ещё не сработало
  lines.push(`   (not (rule-fired (id ${rule.id})))`);

  // Условия: каждый факт известен (CF != 0)
  conds.forEach((factId, idx) => {
    lines.push(`   (known (id ${factId}) (cf ?c${idx}&:(neq ?c${idx} 0.0)))`);
  });

  // Результат ещё не установлен
  lines.push(`   (not (known (id ${rule.resultFactId})))`);

  lines.push(` =>`);

  // Вычисляем минимальный CF условий
  const ruleCf = rule.confidence || 1.0;
  const cfVars = conds.map((_, idx) => `?c${idx}`);

  if (cfVars.length === 1) {
    lines.push(`   (bind ?cf-result (* ${cfVars[0]} ${ruleCf}))`);
  } else {
    lines.push(`   (bind ?cf-result (* (min ${cfVars.join(" ")}) ${ruleCf}))`);
  }

  // Создаём результат напрямую
  lines.push(`   (assert (known (id ${rule.resultFactId}) (cf ?cf-result)))`);

  // Отмечаем что правило сработало
  lines.push(`   (assert (rule-fired (id ${rule.id})))`);
  lines.push(`)`);

  return lines.join("\n");
}

// ===== Формируем файл только с правилами =====

let output = "";
output += "; =====================================================\n";
output += "; kb_rules.clp - Pravila vyvoda (auto-generated)\n";
output += "; LOAD THIRD after kb_domain.clp and dialog.clp\n";
output += "; =====================================================\n\n";

// Все правила из rules.json
for (const rule of rules) {
  if (!rule || !rule.id) continue;

  if (rule.name) {
    output += `; ${rule.id}: ${rule.name}\n`;
  }

  const body = buildRule(rule);
  if (body.trim().length > 0) {
    output += body + "\n\n";
  }
}

if (outPath) {
  fs.writeFileSync(outPath, output, "utf8");
  console.log("Done:", outPath);
} else {
  process.stdout.write(output);
}
