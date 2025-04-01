using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VizsgaWpfStarter
{
    public static class Database
    {
        private static AppContext context = null!;

        public static AppContext GetAppContext()
        {
           if (context!=null)
           {
               return context;
           }
           context = new AppContext();
           return context;
        }
    }
}
