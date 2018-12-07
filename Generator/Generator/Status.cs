using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    public class Status
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public TimeSpan Time { get; set; }

        public static int MinRange = 4;

        public static List<Status> Statuses = new List<Status>();

        public static RandomDateTime RandTime = new RandomDateTime();

        public static Random Rand = new Random();

        

        public Status(string name, string description)
        {
            Name = name;
            Description = description;
            Time = RandTime.TimeSpan(MinRange);
        }

        static Status()
        {
            Statuses.Add(new Status("W magazynie", "Przesyłka znajduje się w magazynie i czeka na odbiór przez kuriera"));
            Statuses.Add(new Status("W drodze", "Przesyłka jest w drodze do odbiorcy"));
            Statuses.Add(new Status("Dostarczona", "Przesyłka została odebrana przez odbiorcę"));
            Statuses.Add(new Status("Powrót do magazynu", "Przesyłka nie została odebrana przez odbiorcę i wraca do oddziału"));
            Statuses.Add(new Status("Powrót do nadawcy", "Przesyłka nie została odebrana przez odbiorcę i wraca do nadawcy"));
        }

        public static int NextIndex()
        {
            var index = Rand.Next(Statuses.Count);

            return index;
        }

        private static void UpdateRandomTimeSpans()
        {
            foreach(var stat in Statuses)
            {
                stat.Time = RandTime.TimeSpan(MinRange);
            }
        }

        public static Status GetStatusWDrodze()
        {
            UpdateRandomTimeSpans();
            return Statuses[1];
        }

        public static List<Status> Next()
        {
            UpdateRandomTimeSpans();
            var probability = 0.02;
            var type = Rand.Next(-1, 3);
            if (Rand.NextDouble() < probability)
            {
                type = Rand.NextDouble() < 0.5 ? 3 : 4;
            }
            var list = new List<Status>();

            switch (type)
            {
                case -1:
                    break;
                case 0:
                    list.Add(Statuses[0]);
                    break;
                case 1:
                    list.Add(Statuses[0]);
                    list.Add(Statuses[1]);
                    break;
                case 2:
                    list.Add(Statuses[0]);
                    list.Add(Statuses[1]);
                    list.Add(Statuses[2]);
                    break;
                case 3:
                    list.Add(Statuses[0]);
                    list.Add(Statuses[1]);
                    list.Add(Statuses[3]);
                    break;
                case 4:
                    list.Add(Statuses[0]);
                    list.Add(Statuses[1]);
                    list.Add(Statuses[3]);
                    list.Add(Statuses[4]);
                    break;
            }

            return list;
        }
    }
}
