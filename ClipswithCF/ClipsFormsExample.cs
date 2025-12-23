using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Globalization;
using CLIPSNET;

namespace ClipsFormsExample
{
    public partial class ClipsFormsExample : Form
    {
        private readonly CLIPSNET.Environment clips = new CLIPSNET.Environment();
        private readonly List<string> loadedFiles = new List<string>();

        // Словарь имён фактов
        private static readonly Dictionary<string, string> FactNames = new Dictionary<string, string>
        {
            // Интересы f1-f15
            {"f1", "интерес к программированию"}, {"f2", "интерес к данным"}, {"f3", "интерес к администрированию"},
            {"f4", "интерес к дизайну"}, {"f5", "интерес к бизнесу"}, {"f6", "интерес к помощи людям"},
            {"f7", "интерес к обучению"}, {"f8", "интерес к маркетингу"}, {"f9", "интерес к кибербезопасности"},
            {"f10", "интерес к науке"}, {"f11", "интерес к автоматизации"}, {"f12", "интерес к мобильным"},
            {"f13", "интерес к вебу"}, {"f14", "интерес к геймдеву"}, {"f15", "интерес к AI"},
            // Качества f16-f30
            {"f16", "логическое мышление"}, {"f17", "креативность"}, {"f18", "усидчивость"},
            {"f19", "коммуникабельность"}, {"f20", "организаторские способности"}, {"f21", "командная работа"},
            {"f22", "самодисциплина"}, {"f23", "стрессоустойчивость"}, {"f24", "владение компьютером"},
            {"f25", "английский язык"}, {"f26", "математика"}, {"f27", "аналитический ум"},
            {"f28", "самообучение"}, {"f29", "терпеливость"}, {"f30", "перфекционизм"},
            // Склонности f31-f38
            {"f31", "техническая склонность"}, {"f32", "аналитическая склонность"}, {"f33", "творческая склонность"},
            {"f34", "управленческая склонность"}, {"f35", "коммуникативная склонность"}, {"f36", "исследовательская склонность"},
            {"f37", "предпринимательская склонность"}, {"f38", "педагогическая склонность"},
            // Навыки f39-f48
            {"f39", "навыки программирования"}, {"f40", "навыки работы с данными"}, {"f41", "навыки администрирования"},
            {"f42", "навыки дизайна"}, {"f43", "навыки управления"}, {"f44", "навыки коммуникации"},
            {"f45", "навыки анализа"}, {"f46", "навыки безопасности"}, {"f47", "навыки веб-разработки"},
            {"f48", "навыки мобильной разработки"},
            // Специализации f49-f60
            {"f49", "специализация Backend"}, {"f50", "специализация Frontend"}, {"f51", "специализация Fullstack"},
            {"f52", "специализация Data Science"}, {"f53", "специализация DevOps"}, {"f54", "специализация InfoSec"},
            {"f55", "специализация UI/UX"}, {"f56", "специализация PM"}, {"f57", "специализация QA"},
            {"f58", "специализация ML"}, {"f59", "специализация Mobile"}, {"f60", "специализация GameDev"},
            // Профили f61-f72
            {"f61", "профиль Backend-разработчик"}, {"f62", "профиль Frontend-разработчик"}, {"f63", "профиль Data Analyst"},
            {"f64", "профиль DevOps-инженер"}, {"f65", "профиль Security-специалист"}, {"f66", "профиль UI/UX-дизайнер"},
            {"f67", "профиль Project Manager"}, {"f68", "профиль QA-инженер"}, {"f69", "профиль ML-инженер"},
            {"f70", "профиль Mobile-разработчик"}, {"f71", "профиль Game-разработчик"}, {"f72", "профиль Fullstack-разработчик"},
            // Направления f73-f80
            {"f73", "РАЗРАБОТКА ПО"}, {"f74", "DATA SCIENCE"}, {"f75", "DEVOPS И ИНФРАСТРУКТУРА"},
            {"f76", "ИНФОРМАЦИОННАЯ БЕЗОПАСНОСТЬ"}, {"f77", "ДИЗАЙН И UX"}, {"f78", "УПРАВЛЕНИЕ ПРОЕКТАМИ"},
            {"f79", "ИГРОВАЯ ИНДУСТРИЯ"}, {"f80", "ИСКУССТВЕННЫЙ ИНТЕЛЛЕКТ"}
        };

        public ClipsFormsExample()
        {
            InitializeComponent();
            voicesBox.Items.Clear();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        private static string EscapeForClips(string s)
        {
            if (s == null) return "";
            return s.Replace("\\", "\\\\").Replace("\"", "\\\"");
        }

        /// <summary>
        /// Извлекает число CF из значения CLIPS (может быть FloatValue, IntegerValue и т.д.)
        /// </summary>
        private static double ParseClipsCf(object cfValue)
        {
            if (cfValue == null) return 0.0;

            // Пробуем привести к FloatValue напрямую
            if (cfValue is FloatValue floatVal)
            {
                // Используем неявное преобразование FloatValue -> double
                return (double)floatVal;
            }

            // Пробуем привести к IntegerValue
            if (cfValue is IntegerValue intVal)
            {
                return (double)(long)intVal;
            }

            // Fallback: пробуем Convert
            try
            {
                return Convert.ToDouble(cfValue, CultureInfo.InvariantCulture);
            }
            catch
            {
                // Последняя попытка - парсим строку
                string str = cfValue.ToString();
                if (double.TryParse(str, NumberStyles.Float, CultureInfo.InvariantCulture, out double result))
                {
                    return result;
                }
            }

            return 0.0;
        }

        private bool IsDialogDone()
        {
            try
            {
                // stage — ordered fact (implied deftemplate). Значение хранится в multislot 'implied'.
                // Проверяем наличие факта (stage done).
                var eval = clips.Eval("(any-factp ((?f stage)) (eq (nth$ 1 ?f:implied) done))");
                string s = eval?.ToString()?.Trim();
                return string.Equals(s, "TRUE", StringComparison.OrdinalIgnoreCase);
            }
            catch
            {
                // Fallback на старую проверку (на случай несовместимости окружения).
                var factsStr = clips.Eval("(facts)");
                string allFacts = factsStr?.ToString() ?? "";
                return allFacts.Contains("(stage done)");
            }
        }

        private void RunAll()
        {
            // Выполняем все правила
            clips.Run();
        }

        /// <summary>
        /// Отправка ответа пользователя в CLIPS
        /// </summary>
        private void SendAnswer(string answer)
        {
            if (string.IsNullOrEmpty(answer))
            {
                MessageBox.Show("Введите или выберите вариант ответа.", "Ответ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            // Получаем коэффициент уверенности
            double cf = 1.0;
            var cfRaw = cfTextBox.Text.Trim().Replace(',', '.');

            if (!string.IsNullOrEmpty(cfRaw))
            {
                if (double.TryParse(cfRaw, NumberStyles.Float, CultureInfo.InvariantCulture, out double parsed))
                {
                    cf = Math.Max(0.0, Math.Min(1.0, parsed));
                }
            }

            // Преобразуем ответ в числовой код для CLIPS
            // да = 1.0, нет = -1.0, не знаю = 0.0
            string answerCf;
            string answerLower = answer.ToLower().Trim();

            if (answerLower == "da")
                answerCf = "1.0";
            else if (answerLower == "net")
                answerCf = "-1.0";
            else // "не знаю" или любой другой
                answerCf = "0.0";

            // Формируем assert: (answer (cf 1.0))
            string clipsCommand = $"(assert (answer (cf {answerCf})))";

            try
            {
                clips.Eval(clipsCommand);
                outputBox.AppendText($"Ваш ответ: {answer}{System.Environment.NewLine}");

                answerTextBox.Clear();

                // Запускаем правила и обновляем диалог
                RunAll();
                HandleResponse();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка CLIPS:\r\n" + ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void sendAnswerButton_Click(object sender, EventArgs e)
        {
            SendAnswer(answerTextBox.Text.Trim());
        }

        private void showFactsButton_Click(object sender, EventArgs e)
        {
            try
            {
                // Получаем known факты (CF)
                var knownResult = (MultifieldValue)clips.Eval("(find-all-facts ((?f known)) TRUE)");

                outputBox.AppendText("=== Текущие факты базы знаний ===" + System.Environment.NewLine);

                if (knownResult.Count == 0)
                {
                    outputBox.AppendText("(пусто)" + System.Environment.NewLine);
                }
                else
                {
                    // Собираем факты в список для сортировки
                    var factsList = new List<(string id, string name, double cf)>();

                    foreach (var item in knownResult)
                    {
                        var fact = (FactAddressValue)item;
                        // Извлечение значений из CLIPS
                        string id = ((LexemeValue)fact["id"]).Value;
                        double cf = ParseClipsCf(fact["cf"]);
                        string name = FactNames.ContainsKey(id) ? FactNames[id] : id;

                        factsList.Add((id, name, cf));
                    }

                    // Сортируем по убыванию CF
                    factsList.Sort((a, b) => b.cf.CompareTo(a.cf));

                    // Выводим: сначала выводные факты (f31+), потом аксиомы (f1-f30)
                    outputBox.AppendText(System.Environment.NewLine + "--- Выводные факты ---" + System.Environment.NewLine);
                    foreach (var f in factsList.Where(x => int.Parse(x.id.Substring(1)) >= 31))
                    {
                        string cfStr = f.cf.ToString("F2", CultureInfo.InvariantCulture);
                        outputBox.AppendText($"  {f.id}: {f.name} [CF={cfStr}]{System.Environment.NewLine}");
                    }

                    outputBox.AppendText(System.Environment.NewLine + "--- Аксиомы (ответы пользователя) ---" + System.Environment.NewLine);
                    foreach (var f in factsList.Where(x => int.Parse(x.id.Substring(1)) <= 30))
                    {
                        string cfStr = f.cf.ToString("F2", CultureInfo.InvariantCulture);
                        outputBox.AppendText($"  {f.id}: {f.name} [CF={cfStr}]{System.Environment.NewLine}");
                    }
                }
                outputBox.AppendText(System.Environment.NewLine);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при получении фактов:\r\n" + ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void HandleResponse()
        {
            try
            {
                // Проверяем, завершён ли опрос
                if (IsDialogDone())
                {
                    // Опрос завершён - показываем результаты
                    ShowFinalResults();
                    return;
                }

                // Получаем факт ioproxy
                string evalStr = "(find-fact ((?f ioproxy)) TRUE)";
                var result = (MultifieldValue)clips.Eval(evalStr);

                if (result.Count == 0)
                {
                    outputBox.AppendText("Диалог завершён." + System.Environment.NewLine);
                    return;
                }

                FactAddressValue fv = (FactAddressValue)result[0];

                var messages = (MultifieldValue)fv["messages"];
                var answers = (MultifieldValue)fv["answers"];

                // Выводим сообщения
                for (int i = 0; i < messages.Count; i++)
                {
                    var msg = (LexemeValue)messages[i];
                    outputBox.AppendText(msg.Value + System.Environment.NewLine);
                }

                // Выводим варианты ответов
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
            catch (Exception ex)
            {
                // Игнорируем ошибки если ioproxy не найден
            }
        }

        /// <summary>
        /// Показывает итоговые результаты вывода после завершения опроса
        /// </summary>
        private void ShowFinalResults()
        {
            outputBox.AppendText(System.Environment.NewLine);
            outputBox.AppendText("╔════════════════════════════════════════════════════════════╗" + System.Environment.NewLine);
            outputBox.AppendText("║       РЕЗУЛЬТАТЫ ПРОФОРИЕНТАЦИИ В IT                       ║" + System.Environment.NewLine);
            outputBox.AppendText("╚════════════════════════════════════════════════════════════╝" + System.Environment.NewLine);
            outputBox.AppendText(System.Environment.NewLine);

            try
            {
                // Получаем known факты
                var knownResult = (MultifieldValue)clips.Eval("(find-all-facts ((?f known)) TRUE)");

                if (knownResult.Count == 0)
                {
                    outputBox.AppendText("Факты не выведены." + System.Environment.NewLine);
                    return;
                }

                // Собираем факты по уровням
                var goals = new List<(string id, string name, double cf)>();      // f73-f80 направления
                var profiles = new List<(string id, string name, double cf)>();   // f61-f72 профили
                var specs = new List<(string id, string name, double cf)>();      // f49-f60 специализации
                var skills = new List<(string id, string name, double cf)>();     // f39-f48 навыки
                var tendencies = new List<(string id, string name, double cf)>(); // f31-f38 склонности
                var axioms = new List<(string id, string name, double cf)>();     // f1-f30 аксиомы

                foreach (var item in knownResult)
                {
                    var fact = (FactAddressValue)item;
                    string id = ((LexemeValue)fact["id"]).Value;
                    double cf = ParseClipsCf(fact["cf"]);
                    string name = FactNames.ContainsKey(id) ? FactNames[id] : id;

                    int num = int.Parse(id.Substring(1));
                    var tuple = (id, name, cf);

                    if (num >= 73) goals.Add(tuple);
                    else if (num >= 61) profiles.Add(tuple);
                    else if (num >= 49) specs.Add(tuple);
                    else if (num >= 39) skills.Add(tuple);
                    else if (num >= 31) tendencies.Add(tuple);
                    else axioms.Add(tuple);
                }

                // Сортируем по убыванию CF
                goals.Sort((a, b) => b.cf.CompareTo(a.cf));
                profiles.Sort((a, b) => b.cf.CompareTo(a.cf));
                specs.Sort((a, b) => b.cf.CompareTo(a.cf));
                skills.Sort((a, b) => b.cf.CompareTo(a.cf));
                tendencies.Sort((a, b) => b.cf.CompareTo(a.cf));

                // ===== ГЛАВНАЯ РЕКОМЕНДАЦИЯ =====
                outputBox.AppendText("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" + System.Environment.NewLine);
                outputBox.AppendText("           РЕКОМЕНДАЦИЯ СИСТЕМЫ" + System.Environment.NewLine);
                outputBox.AppendText("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" + System.Environment.NewLine);

                // Находим лучшее направление (с положительным CF)
                var bestGoals = goals.Where(g => g.cf > 0).ToList();
                var bestSpecs = specs.Where(s => s.cf > 0).ToList();

                if (bestGoals.Count > 0)
                {
                    var top = bestGoals.First();
                    outputBox.AppendText(System.Environment.NewLine);
                    outputBox.AppendText($"  ★ Вам подходит направление: {top.name}" + System.Environment.NewLine);
                    outputBox.AppendText($"    Уверенность: {(top.cf * 100):F0}%" + System.Environment.NewLine);
                }
                else if (bestSpecs.Count > 0)
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
                    outputBox.AppendText("  Попробуйте ответить на больше вопросов положительно." + System.Environment.NewLine);
                }
                outputBox.AppendText(System.Environment.NewLine);

                // ===== ВАШИ СИЛЬНЫЕ СТОРОНЫ =====
                var strongTendencies = tendencies.Where(t => t.cf > 0.5).ToList();
                if (strongTendencies.Count > 0)
                {
                    outputBox.AppendText("ВАШИ СИЛЬНЫЕ СТОРОНЫ:" + System.Environment.NewLine);
                    foreach (var t in strongTendencies.Take(5))
                    {
                        string bar = new string('█', (int)(t.cf * 10));
                        string empty = new string('░', 10 - (int)(t.cf * 10));
                        outputBox.AppendText($"   {t.name}: [{bar}{empty}] {(t.cf * 100):F0}%" + System.Environment.NewLine);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                // ===== ПОДХОДЯЩИЕ СПЕЦИАЛИЗАЦИИ =====
                if (bestSpecs.Count > 0)
                {
                    outputBox.AppendText("ПОДХОДЯЩИЕ СПЕЦИАЛИЗАЦИИ:" + System.Environment.NewLine);
                    foreach (var s in bestSpecs.Take(3))
                    {
                        outputBox.AppendText($"   ✓ {s.name} ({(s.cf * 100):F0}%)" + System.Environment.NewLine);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                // ===== РАЗВИТЫЕ НАВЫКИ =====
                var strongSkills = skills.Where(s => s.cf > 0.5).ToList();
                if (strongSkills.Count > 0)
                {
                    outputBox.AppendText("РАЗВИТЫЕ НАВЫКИ:" + System.Environment.NewLine);
                    foreach (var s in strongSkills.Take(5))
                    {
                        outputBox.AppendText($"   • {s.name} ({(s.cf * 100):F0}%)" + System.Environment.NewLine);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                // ===== НЕ РЕКОМЕНДУЕТСЯ =====
                var worstGoals = goals.Where(g => g.cf < -0.5).OrderBy(g => g.cf).ToList();
                if (worstGoals.Count > 0)
                {
                    outputBox.AppendText("НАПРАВЛЕНИЯ, КОТОРЫЕ ВАМ МЕНЕЕ ПОДХОДЯТ:" + System.Environment.NewLine);
                    foreach (var g in worstGoals.Take(3))
                    {
                        outputBox.AppendText($"   ✗ {g.name}" + System.Environment.NewLine);
                    }
                    outputBox.AppendText(System.Environment.NewLine);
                }

                // ===== СТАТИСТИКА =====
                outputBox.AppendText("─────────────────────────────────────────" + System.Environment.NewLine);
                int derived = knownResult.Count - axioms.Count;
                outputBox.AppendText($"Проанализировано: {axioms.Count} ответов → выведено {derived} фактов" + System.Environment.NewLine);
                outputBox.AppendText("Глубина анализа: 6 уровней (интересы → склонности → навыки → специализации → профили → направления)" + System.Environment.NewLine);
                outputBox.AppendText(System.Environment.NewLine);
                outputBox.AppendText("Подсказка: нажмите 'Показать факты' для детального списка." + System.Environment.NewLine);
            }
            catch (Exception ex)
            {
                outputBox.AppendText("Ошибка при получении результатов: " + ex.Message + System.Environment.NewLine);
            }
        }

        private void nextBtn_Click(object sender, EventArgs e)
        {
            RunAll();
            HandleResponse();
        }

        private void resetBtn_Click(object sender, EventArgs e)
        {
            outputBox.Clear();
            outputBox.AppendText("=== Перезапуск системы ===" + System.Environment.NewLine);

            clips.Clear();

            // Загружаем все файлы из списка
            var filesToLoad = loadedFiles.Distinct().ToList();

            if (filesToLoad.Count == 0)
            {
                outputBox.AppendText("Нет загруженных файлов. Откройте .clp файлы." + System.Environment.NewLine);
                return;
            }

            foreach (var file in filesToLoad)
            {
                if (!System.IO.File.Exists(file))
                {
                    outputBox.AppendText("Файл не найден: " + file + System.Environment.NewLine);
                    continue;
                }

                try
                {
                    clips.Load(file);
                    outputBox.AppendText("Загружен: " + System.IO.Path.GetFileName(file) + System.Environment.NewLine);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка загрузки:\r\n" + file + "\r\n" + ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            clips.Reset();
            outputBox.AppendText("=== Система готова ===" + System.Environment.NewLine + System.Environment.NewLine);

            // Запускаем и показываем первый вопрос
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
                    // Добавляем только если файла ещё нет в списке
                    if (!loadedFiles.Contains(file))
                    {
                        loadedFiles.Add(file);
                        voicesBox.Items.Add(System.IO.Path.GetFileName(file));
                    }
                }

                // Показываем содержимое последнего файла в редакторе
                string lastFile = clipsOpenFileDialog.FileNames.Last();
                codeBox.Text = System.IO.File.ReadAllText(lastFile, Encoding.UTF8);
                Text = "Экспертная система – " + System.IO.Path.GetFileName(lastFile);

                outputBox.AppendText($"Добавлено файлов: {clipsOpenFileDialog.FileNames.Length}" + System.Environment.NewLine);
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
                System.IO.File.WriteAllText(clipsSaveFileDialog.FileName, codeBox.Text, Encoding.UTF8);
            }
        }

        // Обработчики для кнопок быстрых ответов
        private void btnYes_Click(object sender, EventArgs e)
        {
            SendAnswer("da");
        }

        private void btnNo_Click(object sender, EventArgs e)
        {
            SendAnswer("net");
        }

        private void btnDontKnow_Click(object sender, EventArgs e)
        {
            SendAnswer("ne znau");
        }

        private void voicesBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            // При выборе файла из списка показываем его содержимое
            int idx = voicesBox.SelectedIndex;
            if (idx >= 0 && idx < loadedFiles.Count)
            {
                string file = loadedFiles[idx];
                if (System.IO.File.Exists(file))
                {
                    codeBox.Text = System.IO.File.ReadAllText(file, Encoding.UTF8);
                    Text = "Экспертная система – " + System.IO.Path.GetFileName(file);
                }
            }
        }
    }
}
