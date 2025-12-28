using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CLIPSNET;
using System.Text.Json;              
using System.Text.Json.Serialization;

namespace ClipsFormsExample
{
    public partial class ClipsFormsExample : Form
    {
        private readonly CLIPSNET.Environment clips = new CLIPSNET.Environment();
        private readonly List<string> loadedFiles = new List<string>();

        // Было: статический словарь FactNames руками.
        // Стало: словарь подгружаем из facts.json
        private readonly Dictionary<string, (string Name, string Category)> factDetails =
    new Dictionary<string, (string, string)>(StringComparer.OrdinalIgnoreCase);

        private const string FactsJsonFileName = "D:\\is_4curs\\prod model\\facts.json";

        public ClipsFormsExample()
        {
            InitializeComponent();
            voicesBox.Items.Clear();

            // Подгружаем названия фактов при старте (если файла нет — просто будет fallback на id)
            TryLoadFactNamesFromJson();
        }

        // ===== JSON модели =====
        private sealed class FactsRoot
        {
            public List<FactItem> facts { get; set; } = new List<FactItem>();
        }

        private sealed class FactItem
        {
            public string id { get; set; } = "";
            public string name { get; set; } = "";
            public string category { get; set; } = ""; // Новое поле
        }

        private void TryLoadFactNamesFromJson()
        {
            var candidates = new[]
            {
                Path.Combine(AppDomain.CurrentDomain.BaseDirectory, FactsJsonFileName),
                Path.Combine(System.Environment.CurrentDirectory, FactsJsonFileName)
            };

            string jsonPath = candidates.FirstOrDefault(File.Exists);

            if (jsonPath == null)
            {
                outputBox.AppendText(
                    $"[!] facts.json не найден (ожидался: {string.Join(" или ", candidates)}){System.Environment.NewLine}");
                return;
            }

            try
            {
                string json = File.ReadAllText(jsonPath, Encoding.UTF8);

                var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
                var root = JsonSerializer.Deserialize<FactsRoot>(json, options) ?? new FactsRoot();

                factDetails.Clear(); // Очищаем новый словарь

                foreach (var f in root.facts.Where(x => !string.IsNullOrWhiteSpace(x.id)))
                {
                    string id = f.id.Trim();
                    string name = string.IsNullOrWhiteSpace(f.name) ? id : f.name.Trim();
                    string category = string.IsNullOrWhiteSpace(f.category) ? "unknown" : f.category.Trim();
                    factDetails[id] = (name, category); // Сохраняем и имя, и категорию
                }

                outputBox.AppendText(
                    $"[OK] Загружены детали фактов из: {Path.GetFileName(jsonPath)} ({factDetails.Count} шт.){System.Environment.NewLine}");
            }
            catch (Exception ex)
            {
                outputBox.AppendText($"[!] Ошибка чтения facts.json: {ex.Message}{System.Environment.NewLine}");
            }
        }

        // ===== Утилиты =====

        private static double ParseClipsCf(object cfValue)
        {
            if (cfValue == null) return 0.0;

            if (cfValue is FloatValue floatVal) return (double)floatVal;
            if (cfValue is IntegerValue intVal) return (double)(long)intVal;

            try
            {
                return Convert.ToDouble(cfValue, CultureInfo.InvariantCulture);
            }
            catch
            {
                string str = cfValue.ToString();
                if (double.TryParse(str, NumberStyles.Float, CultureInfo.InvariantCulture, out double result))
                    return result;
            }

            return 0.0;
        }

        private string FactNameOrId(string id)
        {
            if (string.IsNullOrWhiteSpace(id)) return id ?? "";
            return factDetails.TryGetValue(id, out var details) ? details.Name : id;
        }

        private string FactCategoryOrEmpty(string id)
        {
            if (string.IsNullOrWhiteSpace(id)) return string.Empty;
            return factDetails.TryGetValue(id, out var details) ? details.Category : string.Empty;
        }

        private bool IsDialogDone()
        {
            try
            {
                var eval = clips.Eval("(any-factp ((?f stage)) (eq (nth$ 1 ?f:implied) done))");
                string s = eval?.ToString()?.Trim();
                return string.Equals(s, "TRUE", StringComparison.OrdinalIgnoreCase);
            }
            catch
            {
                var factsStr = clips.Eval("(facts)");
                string allFacts = factsStr?.ToString() ?? "";
                return allFacts.Contains("(stage done)");
            }
        }

        private void RunAll()
        {
            clips.Run();
        }

        // ===== Отправка ответа (оставьте вашу логику как была) =====
        // Если вы уже перешли на (answer (value да|нет|не-знаю)), оставьте это.
        // Если вы ещё на (answer (cf ...)), оставьте старое.
        // Ниже пример для value-версии:

        private static string NormalizeAnswerToClipsSymbol(string answer)
        {
            string v = (answer ?? "").Trim().ToLowerInvariant();

            if (v == "yes") return "yes";
            if (v == "no") return "no";
            if (v == "dont-know") return "dont-know";

            return v;
        }

        private void SendAnswer(string answer)
        {
            if (string.IsNullOrWhiteSpace(answer))
            {
                MessageBox.Show("Введите или выберите вариант ответа.", "Ответ",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            string value = NormalizeAnswerToClipsSymbol(answer);

            string clipsCommand = $"(assert (answer (value {value})))";

            try
            {
                clips.Eval(clipsCommand);
                outputBox.AppendText($"Ваш ответ: {value}{System.Environment.NewLine}");


                RunAll();
                HandleResponse();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка CLIPS:\r\n" + ex.Message, "Ошибка",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void btnYes_Click(object sender, EventArgs e) => SendAnswer("yes");
        private void btnNo_Click(object sender, EventArgs e) => SendAnswer("no");
        private void btnDontKnow_Click(object sender, EventArgs e) => SendAnswer("dont-know");

        private void nextBtn_Click(object sender, EventArgs e)
        {
            RunAll();
            HandleResponse();
        }

        // ===== Показ фактов =====

        private double GetCfFromFact(FactAddressValue fact)
        {
            // Этот метод - наш "щит" от странных типов данных
            object cfValue = fact.GetSlotValue("cf");
            if (cfValue is FloatValue floatVal)
            {
                return (double)floatVal.Value;
            }
            if (cfValue is IntegerValue intVal)
            {
                return (double)intVal.Value;
            }
            // Если это что-то другое, пытаемся спарсить как строку, но это маловероятно
            return double.Parse(cfValue.ToString(), CultureInfo.InvariantCulture);
        }


        // ===== Показ фактов =====
        private void showFactsButton_Click(object sender, EventArgs e)
        {
            outputBox.AppendText("=== Текущие факты базы знаний ===" + System.Environment.NewLine);

            List<FactAddressValue> knownFacts = clips.FindAllFacts("known");

            if (knownFacts.Count == 0)
            {
                outputBox.AppendText("(пусто)" + System.Environment.NewLine);
            }
            else
            {
                var factsList = new List<(string id, string name, double cf, string category)>();
                try
                {
                    foreach (var fact in knownFacts)
                    {
                        string id = fact.GetSlotValue("id").ToString();
                        double cf = GetCfFromFact(fact); // Используем новую надежную функцию
                        string name = FactNameOrId(id);
                        string category = FactCategoryOrEmpty(id);
                        factsList.Add((id, name, cf, category));
                    }

                    factsList.Sort((a, b) => b.cf.CompareTo(a.cf));

                    foreach (var group in factsList.GroupBy(f => f.category).OrderBy(g => g.Key))
                    {
                        outputBox.AppendText(System.Environment.NewLine + $"--- {group.Key.ToUpper()} ---" + System.Environment.NewLine);
                        foreach (var f in group)
                        {
                            string cfStr = f.cf.ToString("F2", CultureInfo.InvariantCulture);
                            outputBox.AppendText($"  {f.id}: {f.name} [CF={cfStr}]{System.Environment.NewLine}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    outputBox.AppendText($"\n!!! ОШИБКА ПРИ ОБРАБОТКЕ ФАКТОВ В C#: {ex.Message} !!!\n");
                }
            }
            outputBox.AppendText(System.Environment.NewLine);
        }


        // ===== Диалог: вывод вопросов/вариантов =====

        private void HandleResponse()
        {
            try
            {
                if (IsDialogDone())
                {
                    ShowFinalResults();
                    return;
                }

                var result = (MultifieldValue)clips.Eval("(find-fact ((?f ioproxy)) TRUE)");

                if (result.Count == 0)
                {
                    outputBox.AppendText("Диалог завершён." + System.Environment.NewLine);
                    return;
                }

                FactAddressValue fv = (FactAddressValue)result[0];

                var messages = (MultifieldValue)fv["messages"];
                var answers = (MultifieldValue)fv["answers"];

                for (int i = 0; i < messages.Count; i++)
                {
                    var msg = (LexemeValue)messages[i];
                    outputBox.AppendText(msg.Value + System.Environment.NewLine);
                }

                if (answers.Count > 0)
                {
                    outputBox.AppendText("Варианты: ");
                    for (int i = 0; i < answers.Count; i++)
                    {
                        var ans = (LexemeValue)answers[i];
                        if (i > 0) outputBox.AppendText(", ");
                        outputBox.AppendText(ans.Value);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                outputBox.AppendText(System.Environment.NewLine);
            }
            catch
            {
                // игнорируем ошибки если ioproxy не найден
            }
        }

        // ===== ВАЖНО: здесь оставьте ваш оригинальный ShowFinalResults() =====
        // Единственная правка, которую нужно сделать внутри вашего ShowFinalResults:
        // заменить FactNames[...] на FactNameOrId(id)
        //
        // Пример:
        //   string name = FactNames.ContainsKey(id) ? FactNames[id] : id;
        // => string name = FactNameOrId(id);
        private void ShowFinalResults()
        {
            outputBox.AppendText(System.Environment.NewLine);
            outputBox.AppendText("╔════════════════════════════════════════════════════════════╗" + System.Environment.NewLine);
            outputBox.AppendText("║       РЕЗУЛЬТАТЫ ПРОФОРИЕНТАЦИИ В IT                       ║" + System.Environment.NewLine);
            outputBox.AppendText("╚════════════════════════════════════════════════════════════╝" + System.Environment.NewLine);
            outputBox.AppendText(System.Environment.NewLine);

            List<FactAddressValue> knownFacts = clips.FindAllFacts("known");

            if (knownFacts.Count == 0)
            {
                outputBox.AppendText("Факты не выведены." + System.Environment.NewLine);
                return;
            }

            try
            {
                var factLists = new Dictionary<string, List<(string id, string name, double cf)>>();
                var allAxioms = new List<(string id, string name, double cf)>();

                foreach (var fact in knownFacts)
                {
                    string id = fact.GetSlotValue("id").ToString();
                    double cf = GetCfFromFact(fact); // Используем новую надежную функцию
                    string name = FactNameOrId(id);
                    string category = FactCategoryOrEmpty(id);

                    if (!factLists.ContainsKey(category))
                    {
                        factLists[category] = new List<(string id, string name, double cf)>();
                    }
                    factLists[category].Add((id, name, cf));

                    if (category == "axiom")
                    {
                        allAxioms.Add((id, name, cf));
                    }
                }

                foreach (var list in factLists.Values)
                {
                    list.Sort((a, b) => b.cf.CompareTo(a.cf));
                }

                List<(string id, string name, double cf)> goals;
                if (!factLists.TryGetValue("goal", out goals))
                    goals = new List<(string, string, double)>();

                List<(string id, string name, double cf)> specs;
                if (!factLists.TryGetValue("specialization", out specs))
                    specs = new List<(string, string, double)>();

                List<(string id, string name, double cf)> tendencies;
                if (!factLists.TryGetValue("tendency", out tendencies))
                    tendencies = new List<(string, string, double)>();

                // ... (остальная часть метода ShowFinalResults без изменений) ...
                // ... она должна корректно работать, если в нее придут правильные числа

                outputBox.AppendText("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" + System.Environment.NewLine);
                outputBox.AppendText("           РЕКОМЕНДАЦИЯ СИСТЕМЫ" + System.Environment.NewLine);
                outputBox.AppendText("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" + System.Environment.NewLine);

                var bestGoals = goals.Where(g => g.cf > 0.5).ToList();
                var bestSpecs = specs.Where(s => s.cf > 0.5).ToList();

                if (bestGoals.Any())
                {
                    var top = bestGoals.First();
                    outputBox.AppendText(System.Environment.NewLine);
                    outputBox.AppendText($"  ★ Вам подходит направление: {top.name}" + System.Environment.NewLine);
                    outputBox.AppendText($"    Уверенность: {(top.cf * 100):F0}%" + System.Environment.NewLine);
                }
                else if (bestSpecs.Any())
                {
                    var top = bestSpecs.First();
                    outputBox.AppendText(System.Environment.NewLine);
                    outputBox.AppendText($"  ★ Вам подходит: {top.name}" + System.Environment.NewLine);
                    outputBox.AppendText($"    Уверенность: {(top.cf * 100):F0}%" + System.Environment.NewLine);
                }
                else
                {
                    outputBox.AppendText(System.Environment.NewLine);
                    outputBox.AppendText("  Недостаточно данных для чёткой рекомендации." + System.Environment.NewLine);
                }

                outputBox.AppendText(System.Environment.NewLine);

                var strongTendencies = tendencies.Where(t => t.cf > 0.5).ToList();
                if (strongTendencies.Any())
                {
                    outputBox.AppendText("ВАШИ СИЛЬНЫЕ СТОРОНЫ:" + System.Environment.NewLine);
                    foreach (var t in strongTendencies.Take(5))
                    {
                        int barLength = (int)Math.Max(0, Math.Min(10, t.cf * 10));
                        string bar = new string('█', barLength);
                        string empty = new string('░', 10 - bar.Length);
                        outputBox.AppendText($"   {t.name}: [{bar}{empty}] {(t.cf * 100):F0}%" + System.Environment.NewLine);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                outputBox.AppendText("─────────────────────────────────────────" + System.Environment.NewLine);
                int derived = knownFacts.Count - allAxioms.Count;
                outputBox.AppendText($"Проанализировано: {allAxioms.Count} ответов → выведено {derived} фактов" + System.Environment.NewLine);
                outputBox.AppendText(System.Environment.NewLine);
            }
            catch (Exception ex)
            {
                outputBox.AppendText($"\n!!! ОШИБКА ПРИ ВЫВОДЕ РЕЗУЛЬТАТОВ В C#: {ex.Message} !!!\n");
            }
        }

        // ===== Рестарт/загрузка =====

        private void resetBtn_Click(object sender, EventArgs e)
        {
            outputBox.Clear();
            outputBox.AppendText("=== Перезапуск системы ===" + System.Environment.NewLine);

            // Перечитываем facts.json на случай, если его поменяли
            TryLoadFactNamesFromJson();

            clips.Clear();

            var filesToLoad = loadedFiles.Distinct().ToList();

            if (filesToLoad.Count == 0)
            {
                outputBox.AppendText("Нет загруженных файлов. Откройте .clp файлы." + System.Environment.NewLine);
                return;
            }

            foreach (var file in filesToLoad)
            {
                if (!File.Exists(file))
                {
                    outputBox.AppendText("Файл не найден: " + file + System.Environment.NewLine);
                    continue;
                }

                try
                {
                    clips.Load(file);
                    outputBox.AppendText("Загружен: " + Path.GetFileName(file) + System.Environment.NewLine);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка загрузки:\r\n" + file + "\r\n" + ex.Message, "Ошибка",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            clips.Reset();
            outputBox.AppendText("=== Система готова ===" + System.Environment.NewLine + System.Environment.NewLine);

            RunAll();
            HandleResponse();
        }

        private void openFile_Click(object sender, EventArgs e)
        {
            clipsOpenFileDialog.Multiselect = true;

            if (clipsOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                foreach (var file in clipsOpenFileDialog.FileNames)
                {
                    if (!loadedFiles.Contains(file))
                    {
                        loadedFiles.Add(file);
                        voicesBox.Items.Add(Path.GetFileName(file));
                    }
                }

                string lastFile = clipsOpenFileDialog.FileNames.Last();
                codeBox.Text = File.ReadAllText(lastFile, Encoding.UTF8);
                Text = "Экспертная система – " + Path.GetFileName(lastFile);

                outputBox.AppendText($"Добавлено файлов: {clipsOpenFileDialog.FileNames.Length}{System.Environment.NewLine}");
                outputBox.AppendText("Нажмите 'Рестарт' для загрузки файлов в CLIPS." + System.Environment.NewLine);
            }
        }

        private void fontSelect_Click(object sender, EventArgs e)
        {
            if (fontDialog1.ShowDialog() == DialogResult.OK)
            {
                codeBox.Font = fontDialog1.Font;
                outputBox.Font = fontDialog1.Font;
            }
        }

        private void saveAsButton_Click(object sender, EventArgs e)
        {
            clipsSaveFileDialog.FileName = clipsOpenFileDialog.FileName;
            if (clipsSaveFileDialog.ShowDialog() == DialogResult.OK)
            {
                File.WriteAllText(clipsSaveFileDialog.FileName, codeBox.Text, Encoding.UTF8);
            }
        }

        private void voicesBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idx = voicesBox.SelectedIndex;
            if (idx >= 0 && idx < loadedFiles.Count)
            {
                string file = loadedFiles[idx];
                if (File.Exists(file))
                {
                    codeBox.Text = File.ReadAllText(file, Encoding.UTF8);
                    Text = "Экспертная система – " + Path.GetFileName(file);
                }
            }
        }

        private void TestClipsLibraryStability()
        {
            outputBox.Clear();
            outputBox.AppendText("--- ЗАПУСК ТЕСТА СТАБИЛЬНОСТИ CLIPSNET ---" + System.Environment.NewLine);

            try
            {
                // Создаем ЧИСТУЮ, изолированную среду CLIPS
                var testClips = new CLIPSNET.Environment();
                outputBox.AppendText("[1] Новая среда CLIPS создана." + System.Environment.NewLine);

                // 2. Пробуем записать простой факт. Эта операция обычно стабильна.
                testClips.Eval("(assert (hello world))");
                outputBox.AppendText("[2] Факт (hello world) отправлен в CLIPS." + System.Environment.NewLine);

                // 3. Пробуем ПРОЧИТАТЬ факты. ЭТО САМЫЙ ВАЖНЫЙ МОМЕНТ.
                // Если программа упадет здесь, значит проблема в чтении.
                outputBox.AppendText("[3] Сейчас будет попытка чтения фактов..." + System.Environment.NewLine);
                var factsResult = testClips.Eval("(facts)");

                // Если мы дошли до сюда, значит чтение не вызвало сбоя.
                outputBox.AppendText("[4] Чтение прошло без сбоя!" + System.Environment.NewLine);
                outputBox.AppendText("    Результат от (facts): " + (factsResult?.ToString() ?? "NULL") + System.Environment.NewLine);

                outputBox.AppendText(System.Environment.NewLine + "--- ТЕСТ УСПЕШНО ЗАВЕРШЕН ---" + System.Environment.NewLine);
            }
            catch (Exception ex)
            {
                outputBox.AppendText(System.Environment.NewLine + $"--- ТЕСТ ПРОВАЛЕН С ОШИБКОЙ ---{System.Environment.NewLine}{ex.ToString()}");
            }
        }
    }
}