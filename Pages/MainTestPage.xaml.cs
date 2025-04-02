using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity;
using FireTestingApp.Classes;  // Добавь это пространство имен

namespace FireTestingApp.Pages
{
    public partial class MainTestPage : Page
    {
        private int currentQuestionIndex = 0;
        private int score = 0;
        private List<Question> questions;

        public MainTestPage()
        {
            InitializeComponent();

            // Подключаемся к базе данных и загружаем вопросы с ответами
            using (var context = new FireSafetyDBEntities())
            {
                // Загружаем все вопросы с их ответами с использованием Include для жадной загрузки
                var questionsFromDb = context.Questions.Include(q => q.Answers).ToList();

                // Собираем всё в список
                questions = questionsFromDb.Select(q => new Question
                {
                    QuestionID = q.QuestionID,
                    QuestionText = q.QuestionText,
                    Answers = q.Answers.ToList()  // Преобразуем ICollection<Answer> в List<Answer>
                }).ToList();
            }

            // Проверяем, что есть вопросы
            if (questions.Count == 0)
            {
                MessageBox.Show("Нет доступных вопросов.");
                return;
            }

            // Загружаем первый вопрос
            LoadQuestion();
        }

        private void LoadQuestion()
        {
            //MessageBox.Show(currentQuestionIndex.ToString());
            // Получаем текущий вопрос
            var question = questions[currentQuestionIndex];

            // Отображаем текст вопроса
            QuestionTB.Text = question.QuestionText;

            // Очищаем все элементы управления (если они есть)
            Option1.IsChecked = false;
            Option2.IsChecked = false;
            Option3.IsChecked = false;
            Option4.IsChecked = false;
            Option5.IsChecked = false;

            Option1.Content = null;
            Option2.Content = null;
            Option3.Content = null;
            Option4.Content = null;
            Option5.Content = null;

            // Добавляем ответы в RadioButton (если их меньше 5)
            var answers = question.Answers.ToList();
            Option1.Content = answers[0].AnswerText;
            Option2.Content = answers[1].AnswerText;
            Option3.Content = answers[2].AnswerText;
            Option4.Content = answers[3].AnswerText;
            Option5.Content = answers[4].AnswerText;
        }
        //private void CheckIsCorrect()
        //{
        //    var IsCorrectAnswer = ConnectObject.GetConnect().Answers.ToString();
        //    var question = questions[currentQuestionIndex];
        //    var answers = question.Answers.ToList();
        //    var SelectedOf = string.Empty;

        //    if (Option1.IsChecked == true) SelectedOf = answers[0].AnswerText;
        //    if (Option2.IsChecked == true) SelectedOf = answers[1].AnswerText;
        //    if (Option3.IsChecked == true) SelectedOf = answers[2].AnswerText;
        //    if (Option4.IsChecked == true) SelectedOf = answers[3].AnswerText;
        //    if (Option5.IsChecked == true) SelectedOf = answers[4].AnswerText;

        //    if(SelectedOf != null && IsCorrectAnswer == "true")
        //    {
        //        score++;
        //    }
        //}\

        // Пример перехода к следующему вопросу
        //private void CheckIsCorrect()
        //{
        //    // Получаем текущий вопрос
        //    var question = questions[currentQuestionIndex];

        //    // Преобразуем коллекцию ответов в список для удобства
        //    var answers = question.Answers.ToList();

        //    // Получаем правильный ответ из БД
        //    var correctAnswer = answers.FirstOrDefault(a => a.IsCorrectAnswer)?.AnswerText;

        //    // Определяем, какой ответ выбрал пользователь
        //    string selectedAnswer = null;

        //    if (Option1.IsChecked == true && answers.Count > 0) selectedAnswer = answers[0].AnswerText;
        //    if (Option2.IsChecked == true && answers.Count > 1) selectedAnswer = answers[1].AnswerText;
        //    if (Option3.IsChecked == true && answers.Count > 2) selectedAnswer = answers[2].AnswerText;
        //    if (Option4.IsChecked == true && answers.Count > 3) selectedAnswer = answers[3].AnswerText;
        //    if (Option5.IsChecked == true && answers.Count > 4) selectedAnswer = answers[4].AnswerText;

        //    // Проверяем, был ли вообще выбран вариант ответа
        //    if (string.IsNullOrEmpty(selectedAnswer))
        //    {
        //        MessageBox.Show("Выберите один из вариантов ответа!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
        //        return;  // Если ответа нет, дальше не идём
        //    }

        //    // Проверяем, правильный ли ответ
        //    if (selectedAnswer == correctAnswer)
        //    {
        //        score++;  // Начисляем очки
        //    }

        //    debuggg.Content = score.ToString();
        //    // Переход к следующему вопросу
        //    currentQuestionIndex++;
        //    LoadQuestion();
        //}

        private void CheckIsCorrect()
        {
            var question = questions[currentQuestionIndex];
            var answers = question.Answers.OrderBy(a => a.AnswerID);
            var correctAnswer = answers.FirstOrDefault(a => a.IsCorrectAnswer);

            Answer selectedAnswer = null;

            if (Option1.IsChecked == true) selectedAnswer = answers.ElementAtOrDefault(0);
            if (Option2.IsChecked == true) selectedAnswer = answers.ElementAtOrDefault(1);
            if (Option3.IsChecked == true) selectedAnswer = answers.ElementAtOrDefault(2);
            if (Option4.IsChecked == true) selectedAnswer = answers.ElementAtOrDefault(3);
            if (Option5.IsChecked == true) selectedAnswer = answers.ElementAtOrDefault(4);

            if (selectedAnswer == null)
            {
                MessageBox.Show("Выберите один из вариантов ответа!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // ***Теперь сравниваем именно ID!***
            if (selectedAnswer.AnswerID == correctAnswer.AnswerID)
            {
                score++;
                debuggg.Content = score;
            }

            //currentQuestionIndex++;
            //LoadQuestion();
        }






        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            if (currentQuestionIndex < questions.Count - 1)
            {
                CheckIsCorrect();

                currentQuestionIndex++;
                LoadQuestion();
            }
            else
            {
                MessageBox.Show("Тест завершён!");
            }
        }
    }
}
