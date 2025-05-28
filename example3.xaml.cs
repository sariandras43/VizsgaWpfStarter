using System.ComponentModel;
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
using Eszaki_kozephegyseg_kilatoi_GUI.Data;

namespace Eszaki_kozephegyseg_kilatoi_GUI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window, INotifyPropertyChanged
    {

        NcmviewpointsContext context = Database.GetAppContext();
        public List<Location> Locations { get; set; }
        public List<Viewpoint> Viewpoints { get; set; }
        private List<Viewpoint> _viewpoints = new List<Viewpoint>();

        public List<Viewpoint> Filtered
        {
            get { return _viewpoints;  }
            set { _viewpoints = value; OnPropertyChanged("Filtered"); }
        }

        private Viewpoint _selected;

        public Viewpoint SelectedViewpoint
        {
            get { return _selected; }
            set { _selected = value; OnPropertyChanged("SelectedViewpoint"); }
        }




        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string tulajdonsagNev)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(tulajdonsagNev));
        }

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = this;
            Locations = context.Set<Location>().ToList();
            Viewpoints = context.Set<Viewpoint>().ToList();
            listBox.ItemsSource = Locations;
            listBox.DisplayMemberPath = "Location1";

        }

        private void listBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Location l = listBox.SelectedItem as Location;
            Filtered = Viewpoints.Where(v => v.Location == l.Id).ToList();


        }
    }
}
