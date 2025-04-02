using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows;

namespace FireTestingApp.Classes
{
    internal class QuestionObject
    {
        private void LoadQuestion(int questionId)
        {
            using (var context = new FireSafetyDBEntities())
            {
                // Загружаем вопрос
                var question = context.Questions.FirstOrDefault(q => q.QuestionID == questionId);
                if (question == null) return;

                QuestionTextBlock.Text = question.Text; // Устанавливаем текст вопроса

                // Загружаем ответы
                var answers = context.Answers.Where(a => a.QuestionID == questionId).ToList();

                AnswersPanel.Children.Clear(); // Очищаем прошлые ответы

                foreach (var answer in answers)
                {
                    RadioButton radioButton = new RadioButton
                    {
                        Content = answer.Text, // Текст ответа
                        Tag = answer.AnswerID, // ID ответа (для сохранения)
                        FontSize = 14,
                        Margin = new Thickness(5)
                    };

                    // Добавляем обработчик выбора ответа
                    radioButton.Checked += AnswerSelected;

                    AnswersPanel.Children.Add(radioButton);
                }
            }
        }

        // Сохранение выбора
        private void AnswerSelected(object sender, RoutedEventArgs e)
        {
            RadioButton selectedRadio = sender as RadioButton;
            if (selectedRadio != null)
            {
                int selectedAnswerId = (int)selectedRadio.Tag;
                int questionId = currentQuestionId; // ID текущего вопроса

                // Добавляем ответ в список
                UserAnswers.RemoveAll(a => a.QuestionId == questionId);
                UserAnswers.Add(new UserAnswer { QuestionId = questionId, SelectedAnswerId = selectedAnswerId });
            }
        }

    }
}
