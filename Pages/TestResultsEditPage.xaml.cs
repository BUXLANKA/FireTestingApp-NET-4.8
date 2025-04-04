using FireTestingApp.Classes;
using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.Remoting.Contexts;
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
            if (!string.IsNullOrWhiteSpace(TBUserScore.Text))
            {
                TempUser.UserScore = Convert.ToInt32(TBUserScore.Text);
                TempUser.StatusID = Convert.ToInt32(CBExamStatus.SelectedValue.ToString());

                try
                {
                    ConnectObject.GetConnect().SaveChanges();
                    MessageBox.Show($"done!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message );
                    throw;
                }
                NavigationService.GoBack();
            }
        }
    }
}
