namespace Generator
{
    using System;
    using System.Globalization;
    using System.IO;
    using System.Text;

    public static class PrzesylkiDB
    {

        public static void Generate(int howManyParcels, int howManyClients, int howManyStores)
        {
            var randDate = new RandomDateTime();
            var rnd = new Random();
            var sep = ';';
            int sender = 0;
            int receiver = 0;

            string[] parcelTypes = File.ReadAllLines(Generator.Path + "wyniki/TypyPrzesylekDB.csv");

            using (var packagesWriter = new StreamWriter(Generator.Path + "wyniki/PrzesylkiDB.csv", false, Encoding.Unicode))
            {
                using (var statusesWriter = new StreamWriter(Generator.Path + "wyniki/StatusyPrzesylekDB.csv", false, Encoding.Unicode))
                {
                    int packageStatusId = 0;

                    for (var packageId = 0; packageId < howManyParcels; packageId++)
                    {
                        do
                        {
                            sender = rnd.Next(howManyClients);
                            receiver = rnd.Next(howManyClients);
                        } while (sender == receiver);

                        var weight = Math.Round(rnd.NextDouble() * 15.0, 2).ToString().Replace(',', '.');
                        var comment = "Brak uwag.";
                        var parcelType = rnd.Next(parcelTypes.Length);
                        var store = rnd.Next(howManyStores);
                        var date = randDate.DaysHoursMinutes();

                        if (rnd.NextDouble() < 0.01)
                        {
                            var chance = rnd.NextDouble();
                            if (chance < 0.2)
                                comment = "Uwaga szkło!";
                            if (chance > 0.2 && chance < 0.4)
                                comment = "Nie piętrować!";
                            if (chance > 0.4 && chance < 0.6)
                                comment = "Materiał łatwopalny!";
                            if (chance > 0.6 && chance < 0.8)
                                comment = "Proszę zostawić na recepcji.";
                            if (chance > 0.8 && chance > 1.0)
                                comment = "Proszę zostawić awizo.";
                        }

                        packagesWriter.WriteLine(packageId.ToString() + sep + date.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss") + sep
                             + weight + sep + comment +
                            sep + sender + sep + receiver + sep + parcelType + sep + "COURSE_ID" + sep + store
                            );

                        //generate random package statuses for each individual package.
                        var listOfStatuses = Status.Next();
                        DateTime statTime = date;
                        foreach (var stat in listOfStatuses)
                        {
                            statTime = statTime.Add(stat.Time);
                            statusesWriter.WriteLine(packageStatusId.ToString() + sep + stat.Name + sep
                                + stat.Description + sep + statTime.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss") + sep + packageId);
                            packageStatusId++;
                        }

                    }
                }
            }
        }
    }
}