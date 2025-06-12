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
    /// Логика взаимодействия для TestResultsEditPage.xaml
    /// </summary>
    public partial class TestResultsEditPage : Page
    {
        private Result TempUser = new Result();

        public TestResultsEditPage(Result SelectUser)
        {
            InitializeComponent();

            if (SelectUser != null)
            {
                TempUser = SelectUser;
            }

            TBFirstname.IsEnabled = false;
            TBLastname.IsEnabled = false;
            TBSurname.IsEnabled = false;

            DataContext = TempUser;
            CBExamStatus.ItemsSource = ConnectObject.GetConnect().TestStatuses.ToList();

            // вывод айди выбранного пользователя
            CBExamStatus.SelectedValue = TempUser.StatusID;


        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void SaveDataButton_Click(Object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TBUserScore.Text) && CBExamStatus.SelectedValue != null)
            {
                TempUser.UserScore = Convert.ToInt32(TBUserScore.Text);
                TempUser.StatusID = Convert.ToInt32(CBExamStatus.SelectedValue.ToString());

                try
                {
                    ConnectObject.GetConnect().SaveChanges();
                    MessageBox.Show(
                        "Данные успешно изменены!",
                        "Редактор результатов",
                        MessageBoxButton.OK,
                        MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    throw;
                }
                NavigationService.GoBack();
            }
            else
            {
                MessageBox.Show(
                    "Указаны неверные данные!",
                    "Ошибка редактирования",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }
        }
    }
}
