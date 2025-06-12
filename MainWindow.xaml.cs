using System.Windows;

namespace FireTestingApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            this.MinHeight = 640;
            this.MinWidth = 960;
        }
    }
}
