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

            HelloTB.Text = $"Добро пожаловать, {Session.UserLastname} {Session.UserFirstname}!";

            DGUsersResults.ItemsSource = ConnectObject.GetConnect().Results.ToList();
            DGUserAnswers.ItemsSource = ConnectObject.GetConnect().UserAnswers.ToList();
        }
    }
}
