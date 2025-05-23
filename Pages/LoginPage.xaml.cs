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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();

            TB_Login.Focus();
        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            if(!string.IsNullOrWhiteSpace(TB_Login.Text) || !string.IsNullOrWhiteSpace(TB_Password.Password))
            {
                // Обработка исключения ошибки подключения к БД
                try
                {
                    ConnectObject.GetConnect().Database.Connection.Open();
                }
                catch
                {
                    MessageBox.Show(
                       $"Программа не может найти активного подключения с сервером! Обратитесь к администратору.",
                       "Ошибка соединения с сервером",
                       MessageBoxButton.OK,
                       MessageBoxImage.Error);
                    return;
                    throw;
                }


                // Основная логика авторизации
                var User = ConnectObject.GetConnect().Users.AsNoTracking()
                    .FirstOrDefault(u => u.UserLogin == TB_Login.Text);

                if (User != null && User.UserLogin == TB_Login.Text && User.UserPassword == TB_Password.Password)
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
                            var ExamDateRestrict = ConnectObject.GetConnect().Results.AsNoTracking()
                                .FirstOrDefault(t => t.UserID == Session.UserID);

                            if (ExamDateRestrict?.TestDate != null && (DateTime.Now - ExamDateRestrict.TestDate).TotalDays <= 31)
                            {
                                MessageBox.Show(
                                    "Повторная сдача будет доступна после 31 дня с момента последней сдачи.\nЗа подробностями обратитесь к инструктору.",
                                    "Информация",
                                    MessageBoxButton.OK,
                                    MessageBoxImage.Information);
                                return;
                            }
                            else
                            {
                                NavigationService.Navigate(new UserPage());
                            }
                            break;
                    }
                }
                else
                {
                   MessageBox.Show(
                       "Неправильный логин или пароль",
                       "Ошибка авторизации",
                       MessageBoxButton.OK,
                       MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show(
                    "Введите логин и пароль",
                    "Пусто? Пусто!",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
                TB_Login.Focus();
            }
        }
    }
}
