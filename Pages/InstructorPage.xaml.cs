using FireTestingApp.Classes;
using FireTestingApp.DataApp;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FireTestingApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для InstructorPage.xaml
    /// </summary>
    public partial class InstructorPage : Page
    {
        public InstructorPage()
        {
            InitializeComponent();

            HelloTB.Text = $"Добро пожаловать, {Session.UserLastname} {Session.UserFirstname}!";

            DGUsersResults.ItemsSource = ConnectObject.GetConnect().Results.ToList();
            DGUserAnswers.ItemsSource = ConnectObject.GetConnect().UserAnswers.ToList();
            DGUserTickets.ItemsSource = ConnectObject.GetConnect().Tickets.ToList();

            if (Session.RoleID != 4)
            {
                DGTickets.IsEnabled = false;
            }
            else
            {
                DGTickets.IsEnabled = true;
            }
        }

        private void EditUsersButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TestResultsEditPage((sender as Button).DataContext as Result));
        }

        private void ExitButton_Click(Object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new LoginPage());
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                DGUsersResults.ItemsSource = ConnectObject.GetConnect().Results.ToList();
            }
        }
    }
}
