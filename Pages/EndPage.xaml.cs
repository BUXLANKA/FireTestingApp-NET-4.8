using FireTestingApp.Classes;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FireTestingApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для EndPage.xaml
    /// </summary>
    public partial class EndPage : Page
    {
        public EndPage()
        {
            InitializeComponent();

            ResultLB.Text = $"{Session.UserFirstname} {Session.UserLastname} вы набрали {Session.UserScore}/10";
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new LoginPage());
        }

        private void FeedBackFormButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new FeedBackPage());
        }
    }
}
