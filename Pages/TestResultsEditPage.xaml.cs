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
        private UserAnswer TempUserAnswer = new UserAnswer();
        private Result EditedResult = new Result();
        public TestResultsEditPage(UserAnswer SelectUserAnswer)
        {
            InitializeComponent();

            DataContext = TempUserAnswer;

            //ExamStatusCB.ItemsSource = ConnectObject.GetConnect().TestStatuses.ToList();

            var User = ConnectObject.GetConnect().Users.AsNoTracking()
                .FirstOrDefault(u => u.UserID == Session.UserID);

            //FirstnameTB.Text = User.UserID.ToString();  
        }
    }
}
