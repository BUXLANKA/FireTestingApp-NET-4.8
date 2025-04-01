using FireTestingApp.DataApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FireTestingApp.Classes
{
    internal class ConnectObject
    {
        public static FireSafetyDBEntities connect;

        public static FireSafetyDBEntities GetConnect()
        {
            if(connect == null)
            {
                connect = new FireSafetyDBEntities();
            }
            return connect;
        }
    }
}
