using FireTestingApp.Classes;
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

        }
    }
}
