using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using VizsgaWpfStarter.Data;
using BetterBinding;

namespace VizsgaWpfStarter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private AppContext context = Database.GetAppContext();
        public List<Model1> ListOfModel1 { get; set; } = new();
        public List<Model2> ListOfModel2 { get; set; } = new();


        public MainWindow()
        {
           InitializeComponent();

           Loaded += (sender, e) => {
               ListOfModel1 = context.Set<Model1>().ToList();
               ListOfModel2 = context.Set<Model2>().ToList();

               listBox.ItemsSource = ListOfModel1;
               listBox.DisplayMemberPath = "Name";
           };

        }
        
        public event PropertyChangedEventHandler PropertyChanged;
        
        static MainWindow(){
            AutoBinder.PatchAll();
        }
    }
}