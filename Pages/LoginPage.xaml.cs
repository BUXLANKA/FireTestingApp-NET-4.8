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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            if(!string.IsNullOrWhiteSpace(TB_Login.Text) || !string.IsNullOrWhiteSpace(TB_Password.Password))
            {
                var User = ConnectObject.GetConnect().Users.AsNoTracking()
                    .FirstOrDefault(u => u.UserLogin == TB_Login.Text && u.UserPassword == TB_Password.Password);

                if (User != null)
                {
                    Session.UserID = User.UserID;
                    Session.RoleID = User.RoleID;
                    Session.UserFirstname = User.Firstname;
                    Session.UserLastname = User.Lastname;

                    switch (Session.RoleID)
                    {
                        case 1:
                            NavigationService.Navigate(new InstructorPage());
                            break;
                        case 2:
                            NavigationService.Navigate(new RevisorPage());
                            break;
                        case 3:
                            NavigationService.Navigate(new UserPage());
                            break;
                    }
                }
            }
        }
    }
}
