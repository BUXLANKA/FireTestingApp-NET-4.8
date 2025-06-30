using System;
using System.Windows.Threading;

namespace FireTestingApp.Classes
{
    internal class Timer
    {
        public event EventHandler TimeUpdated;

        private DispatcherTimer timer;
        private TimeSpan timeLeft;

        public Timer()
        {
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
        }

        public void SetMinutes(int minutes)
        {
            timeLeft = TimeSpan.FromMinutes(minutes);
        }

        public void Start()
        {
            timer.Start();
        }

        public void Stop()
        {
            timer.Stop();
        }

        public TimeSpan GetTimeLeft()
        {
            return timeLeft;
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            if (timeLeft.TotalSeconds > 0)
            {
                timeLeft = timeLeft - TimeSpan.FromSeconds(1);
                TimeUpdated?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                timer.Stop();
            }
        }
    }
}