const fs = require("fs");

const file = process.argv[2];
if (!file) {
  console.error(
    "❌ Укажите путь к файлу. Пример: node format-kv.js npc_units_custom.txt"
  );
  process.exit(1);
}

const lines = fs.readFileSync(file, "utf8").split(/\r?\n/);

let indentLevel = 0;
const indentUnit = "    "; // 4 пробела
let maxKeyLength = 0;
let maxValueLength = 0;

// 1. Вычисляем максимальные длины ключей и значений
for (const line of lines) {
  const trimmed = line.trim();
  const match = trimmed.match(/^"([^"]+)"\s*"([^"]*)"/);
  if (match) {
    maxKeyLength = Math.max(maxKeyLength, match[1].length);
    maxValueLength = Math.max(maxValueLength, match[2].length);
  }
}

// 2. Форматируем с учётом вложенности
const formatted = [];

for (let i = 0; i < lines.length; i++) {
  const trimmed = lines[i].trim();

  if (trimmed === "}") {
    indentLevel = Math.max(0, indentLevel - 1);
  }

  const indent = indentUnit.repeat(indentLevel);

  // Скобки
  if (trimmed === "{" || trimmed === "}") {
    formatted.push(indent + trimmed);
    if (trimmed === "{") indentLevel++;
    continue;
  }

  // Пустые или комментарии
  if (trimmed === "" || trimmed.startsWith("//")) {
    formatted.push(indent + trimmed);
    continue;
  }

  // "ключ" {  — блок со вложенностью
  const matchBlock = trimmed.match(/^"([^"]+)"\s*\{$/);
  if (matchBlock) {
    const key = matchBlock[1];
    const keyPad = " ".repeat(maxKeyLength - key.length + 1);
    formatted.push(`${indent}"${key}"${keyPad}{`);
    indentLevel++;
    continue;
  }

  // "ключ" "значение" // комментарий
  const matchKV = trimmed.match(/^"([^"]+)"\s*"([^"]*)"(.*)$/);
  if (matchKV) {
    const [, key, value, commentRaw] = matchKV;
    const keyPad = " ".repeat(maxKeyLength - key.length + 1);
    const valuePad = " ".repeat(maxValueLength - value.length + 1);
    const comment = commentRaw.trim();
    const commentOut = comment ? `\t\t${comment}` : "";
    formatted.push(`${indent}"${key}"${keyPad}"${value}"${commentOut}`);
    continue;
  }

  // Остальное
  formatted.push(indent + trimmed);
}

fs.writeFileSync(file, formatted.join("\n"), "utf8");
console.log("✅ Форматирование завершено:", file);
