using FireTestingApp.Classes;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FireTestingApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();

            HelloLabel.Text = $"Добро пожаловать, {Session.UserFirstname} {Session.UserLastname}!";

            StartTestButton.IsEnabled = false;
        }

        private void StartTestButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MainTestPage());
        }

        private void TestAllowCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            StartTestButton.IsEnabled = true;
        }

        private void TestAllowCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            StartTestButton.IsEnabled = false;
        }
    }
}
