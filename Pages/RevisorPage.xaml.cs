using FireTestingApp.Classes;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FireTestingApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для RevisorPage.xaml
    /// </summary>
    public partial class RevisorPage : Page
    {
        public RevisorPage()
        {
            InitializeComponent();

            HelloTB.Text = $"Добро пожаловать {Session.UserFirstname} {Session.UserLastname}!";
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
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
