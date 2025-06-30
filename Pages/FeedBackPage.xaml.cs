using FireTestingApp.Classes;
using FireTestingApp.DataApp;
using System;
using System.Data.Entity.Migrations;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FireTestingApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для FeedBackPage.xaml
    /// </summary>
    public partial class FeedBackPage : Page
    {
        public FeedBackPage()
        {
            InitializeComponent();
        }

        private void FBCancelButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void FBSendButton_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(FeedBackMessageTB.Text))
            {
                Ticket TicketTable = new Ticket();

                TicketTable.FromUserID = Session.UserID;
                TicketTable.TicketDate = DateTime.Now;
                TicketTable.TicketText = FeedBackMessageTB.Text;

                try
                {
                    ConnectObject.GetConnect().Tickets.AddOrUpdate(TicketTable);
                    ConnectObject.connect.SaveChanges();
                    MessageBox.Show(
                        "Отзыв успешно отправлен!",
                        "Спасибо",
                        MessageBoxButton.OK,
                        MessageBoxImage.Information);
                }
                catch (Exception)
                {
                    MessageBox.Show(
                        "Произошла ошибка при отправке отзыва. Обратитесь к администратору",
                        "Внутряя ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                    throw;
                }
            }
            else
            {
                MessageBox.Show(
                    "Нельзя отправить пустое сообщение",
                    "А что исправлять то?",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }
        }
    }
}
