using FireTestingApp.Classes;
using FireTestingApp.DataApp;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

// scatfold-db-context Scaffold-DbContext "Host=localhost;Database=mydb;Username=myuser;Password=mypass" Npgsql.EntityFrameworkCore.PostgreSQL -OutputDir Models -Context AppDbContext -Schema fire_safety_system -DataAnnotations

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
            if (!string.IsNullOrWhiteSpace(TB_Login.Text) || !string.IsNullOrWhiteSpace(TB_Password.Password))
            {
                try
                {
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
                            case 4:
                                NavigationService.Navigate(new InstructorPage());
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
                catch (Exception)
                {
                    MessageBox.Show(
                        "Не удаётся создать соединение с базой данный. Обратитесь к администратору.",
                        "Ошибка сервера",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                    return;
                    throw;
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
