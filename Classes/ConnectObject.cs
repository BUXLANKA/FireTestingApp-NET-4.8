using FireTestingApp.DataApp;

namespace FireTestingApp.Classes
{
    internal class ConnectObject
    {
        public static FireSafetyDBEntities connect;

        public static FireSafetyDBEntities GetConnect()
        {
            if (connect == null)
            {
                connect = new FireSafetyDBEntities();
            }
            return connect;
        }
    }
}
