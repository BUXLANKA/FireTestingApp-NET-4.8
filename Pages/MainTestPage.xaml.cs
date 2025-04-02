using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity;  // Добавь это пространство имен

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
            // Получаем текущий вопрос
            var question = questions[currentQuestionIndex];

            // Отображаем текст вопроса
            QuestionTB.Text = question.QuestionText;

            // Очищаем все элементы управления (если они есть)
            Option1.Content = null;
            Option2.Content = null;
            Option3.Content = null;
            Option4.Content = null;
            Option5.Content = null;

            // Добавляем ответы в RadioButton (если их меньше 5)
            var answers = question.Answers.ToList();
            if (answers.Count > 0) Option1.Content = answers[0].AnswerText;
            if (answers.Count > 1) Option2.Content = answers[1].AnswerText;
            if (answers.Count > 2) Option3.Content = answers[2].AnswerText;
            if (answers.Count > 3) Option4.Content = answers[3].AnswerText;
            if (answers.Count > 4) Option5.Content = answers[4].AnswerText;
        }

        // Пример перехода к следующему вопросу
        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            if (currentQuestionIndex < questions.Count - 1)
            {
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
