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
using System.ComponentModel;

namespace VizsgaWpfStarter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>

    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        AppContext context = Database.GetAppContext();
        public ObservableCollection<Pilot> Pilots { get; set; }
        public Pilot SelectedPilot { get; set; }
        private Pilot newPilot = new Pilot();

        public Pilot NewPilot
        {
            get { return newPilot; }
            set { newPilot = value; OnPropertyChanged(nameof(NewPilot)); }
        }

        public List<string> Genders { get; set; } = new List<string>() { "M", "F" };

        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(string tulajdonsagNev)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(tulajdonsagNev));
        }

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = this;
            context.Pilots.Load();
            Pilots = context.Pilots.Local.ToObservableCollection();
        }
        static MainWindow(){
            AutoBinder.PatchAll<MainWindow>();
        }

        private void del_BTN_Click(object sender, RoutedEventArgs e)
        {
            if(SelectedPilot != null)
            {
                MessageBoxResult result = MessageBox.Show($"Biztosan törölni kívánja a(z) {SelectedPilot.Name} nevű pilótát?", "Megerősítés", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if(result == MessageBoxResult.Yes)
                {
                    Pilots.Remove(SelectedPilot);
                    context.SaveChanges();
                }
            }
        }

        private void save_BTN_Click(object sender, RoutedEventArgs e)
        {
            if (InputCheck())
            {
                Pilots.Add(NewPilot);
                context.SaveChanges();
                NewPilot = new Pilot();
            }
        }

        private bool InputCheck()
        {
            if (String.IsNullOrWhiteSpace(NewPilot.Name))
            {
                MessageBox.Show("A név mező kitöltése kötelező", "Hiba!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            if (String.IsNullOrWhiteSpace(NewPilot.Gender))
            {
                MessageBox.Show("A nem mező kitöltése kötelező", "Hiba!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            if(NewPilot.Birthdate == null || NewPilot.Birthdate >= DateTime.Now)
            {
                MessageBox.Show("A születési dátum mező kitöltése kötelező", "Hiba!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            if (String.IsNullOrWhiteSpace(NewPilot.Nation))
            {
                MessageBox.Show("A nemzet mező kitöltése kötelező", "Hiba!", MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
            return true;
        }

    }
}