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

// ===== Генерация простых правил (без CF) =====
function buildSingleRule(rule) {
  const conds = rule.conditions || [];
  if (!rule.id || !rule.resultFactId || conds.length === 0) {
    return "";
  }

  const lines = [];
  lines.push(`(defrule ${rule.id}`);

  // Добавляем комментарий с именем правила для удобства отладки
  if (rule.name) {
    lines.push(`   ; ${rule.name}`);
  }

  // Защита от повторного срабатывания
  lines.push(`   (not (rule-fired (id ${rule.id})))`);

  // Условия (LHS): просто проверяем наличие факта known с нужным id
  conds.forEach((factId) => {
    lines.push(`   (known (id ${factId}))`);
  });

  lines.push(` =>`);

  // Действия (RHS):
  // 1. Утверждаем результат
  lines.push(`   (assert (known (id ${rule.resultFactId})))`);
  // 2. Запоминаем, что правило сработало
  lines.push(`   (assert (rule-fired (id ${rule.id})))`);
  lines.push(`)`);

  return lines.join("\n");
}

// ===== Формируем файл =====
let output = "";
output += "; =====================================================\n";
output += "; kb_rules.clp - Логические правила вывода\n";
output += "; Версия без коэффициентов уверенности\n";
output += "; =====================================================\n\n";

for (const rule of rules) {
  if (!rule || !rule.id) continue;
  const body = buildSingleRule(rule);
  output += body + "\n\n";
}

if (outPath) {
  fs.writeFileSync(outPath, output, "utf8");
  console.log("Done:", outPath);
} else {
  process.stdout.write(output);
}
