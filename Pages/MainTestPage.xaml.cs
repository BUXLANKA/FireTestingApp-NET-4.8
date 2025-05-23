using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.Entity;
using FireTestingApp.Classes;

namespace FireTestingApp.Pages
{
    public partial class MainTestPage : Page
    {
        Timer Timer = new Timer();

        // Номер текущего вопроса
        private int currentQuestionIndex = 0;

        // Количество баллов
        private int score = 0;

        // Список случайно выбранных вопросов
        private List<Question> questions;

        // Объект для хранения итогового результата конкретного пользователя
        private Result CurrentResults = new Result();

        // Объект для хранения ответа пользователя на текущий вопрос
        private UserAnswer CurrentUserAnswer = new UserAnswer();

        public MainTestPage()
        {
            InitializeComponent();

            //Timer Timer = new Timer();

            Timer.SetMinutes(1);
            Timer.TimeUpdated += Timer_TimeUpdated;
            TimerLabel.Content = Timer.GetTimeLeft().ToString(@"mm\:ss");
            Timer.Start();

            



            // Подключаемся к базе данных и загружаем вопросы с ответами
            using (var context = new FireSafetyDBEntities())
            {
                // Загружаем все вопросы с их ответами в память
                var questionsFromDb = context.Questions
                    .Include(q => q.Answers)
                    .ToList(); // Загружаем в память перед сортировкой

                // Выбираем 10 случайных вопросов
                Random rand = new Random();
                questions = questionsFromDb
                    .OrderBy(x => rand.Next()) // Случайная сортировка на стороне клиента
                    .Take(5) // Берем только 5 вопросов
                    .ToList();
            }

            // Загружаем первый вопрос
            LoadQuestion();
        }

        private void Timer_TimeUpdated(object sender, EventArgs e)
        {
            Dispatcher.Invoke(UpdateTimerLabel);
        }

        private void UpdateTimerLabel()
        {
            TimerLabel.Content = Timer.GetTimeLeft().ToString(@"mm\:ss");

            if (Timer.GetTimeLeft().TotalSeconds == 0)
            {
                Timer.Stop();
                MessageBox.Show("timer down");
            }
        }

        //private void Timer_TimeUpdated(object sender, EventArgs e)
        //{
        //    // Обновление UI должно быть в главном потоке
        //    Dispatcher.Invoke(() =>
        //    {
        //        TimerLabel.Content = Timer.GetTimeLeft().ToString(@"mm\:ss");
        //    });
        //}

        private void LoadQuestion()
        {
            // Получаем текущий вопрос
            var question = questions[currentQuestionIndex];

            QuestionIndexTB.Text = $"Вопрос №{(currentQuestionIndex + 1).ToString()}";

            // Отображаем текст вопроса
            QuestionTB.Text = question.QuestionText;

            // Очищаем все элементы управления
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

            // Добавляем ответы в RadioButton
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

            // Сравниваем ID правильного ответа
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
                MessageBox.Show($"Ошибка при сохранении ответа: {ex.Message}");
                throw;
            }
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            // Проверяем, выбран ли ответ
            if (Option1.IsChecked != true && Option2.IsChecked != true &&
                Option3.IsChecked != true && Option4.IsChecked != true &&
                Option5.IsChecked != true)
            {
                MessageBox.Show("Пожалуйста, выберите один из вариантов ответа!");
                return;
            }

            CheckIsCorrect();

            if (currentQuestionIndex < questions.Count - 1)
            {
                currentQuestionIndex++;
                LoadQuestion();
            }
            else
            {
                Session.UserScore = score;

                CurrentResults.UserID = Session.UserID;
                CurrentResults.TestDate = DateTime.Now;
                CurrentResults.UserScore = Session.UserScore;

                if (score >= 8)
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
                    MessageBox.Show($"Ошибка при сохранении результата: {ex.Message}");
                    throw;
                }
                NavigationService.Navigate(new EndPage());
            }
        }
    }
}