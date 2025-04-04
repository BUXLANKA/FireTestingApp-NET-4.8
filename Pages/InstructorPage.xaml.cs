using FireTestingApp.Classes;
using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

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
            //DGUsersResults.ItemsSource = ConnectObject.connect.Results;

            HelloTB.Text = $"Добро пожаловать, {Session.UserLastname} {Session.UserFirstname}!";

            //DGUsersResults.ItemsSource = ConnectObject.GetConnect().Results.ToList();
            DGUserAnswers.ItemsSource = ConnectObject.GetConnect().UserAnswers.ToList();
        }

        //private void Button_Click(object sender, RoutedEventArgs e)
        //{
        //    NavigationService.Navigate(new TestResultsEditPage());
        //}

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
                //ConnectObject.GetConnect().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGUsersResults.ItemsSource = ConnectObject.GetConnect().Results.ToList();
            }
        }
    }
}
