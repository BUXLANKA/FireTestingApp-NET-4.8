using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity;
using FireTestingApp.Classes;
using System.Data.Entity.Migrations;
using System.Linq.Expressions;  // Добавь это пространство имен

namespace FireTestingApp.Pages
{
    public partial class MainTestPage : Page
    {
        private int currentQuestionIndex = 0;
        private int score = 0;
        private List<Question> questions;

        private Result CurrentResults = new Result();
        private UserAnswer CurrentUserAnswer = new UserAnswer();

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

            CurrentUserAnswer.UserID = Session.UserID;
            CurrentUserAnswer.QuestionID = question.QuestionID;
            CurrentUserAnswer.AnswerID = selectedAnswer?.AnswerID;

            // ***Теперь сравниваем именно ID!***
            if (selectedAnswer != null && selectedAnswer.AnswerID == correctAnswer.AnswerID)
            {
                score++;
                CurrentUserAnswer.IsCorrect = true;
            }
            else
            {
                CurrentUserAnswer.IsCorrect = false;
            }

            ConnectObject.GetConnect().UserAnswers.Add(CurrentUserAnswer);

            try
            {
                ConnectObject.GetConnect().SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            CheckIsCorrect();

            if (currentQuestionIndex < questions.Count - 1)
            {
                currentQuestionIndex++;
                LoadQuestion();
            }
            else
            {
                MessageBox.Show("Тест завершён!");

                Session.UserScore = score;

                CurrentResults.UserID = Session.UserID;
                CurrentResults.TestDate = DateTime.Now;
                CurrentResults.UserScore = Session.UserScore;

                if(score >= 8)
                {
                    CurrentResults.StatusID = 1;
                }
                else
                {
                    CurrentResults.StatusID = 2;
                }

                ConnectObject.GetConnect().Results.Add(CurrentResults);

                try
                {
                    ConnectObject.GetConnect().SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    throw;
                }





                NavigationService.Navigate(new EndPage());
            }
        }
    }
}
