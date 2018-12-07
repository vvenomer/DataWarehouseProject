namespace Generator
{
    using System;
    using System.IO;
    using System.Text;

    public static class StoreExcel
    {
        public static void Generate(int howMany)
        {
            var header = "Lokalizacja;Pojemność [m^3];Godzina otwarcia;Godzina zamknięcia;Data rozpoczęcia działalności;Data zakończenia działalności";
            var name = "wyniki/StoreExcel.csv";
            var sep = ';';

            string[] address = File.ReadAllLines(Generator.Path + "wyniki/Adress.csv");

            using (var writer = new StreamWriter(Generator.Path + name, false, Encoding.Unicode))
            {
                writer.WriteLine(header);

                string[] openTime = new string[] { "6:00", "7:00", "8:00", "9:00" };
                string[] closeTime = new string[] { "17:00", "18:00", "19:00", "20:00" };

                var r = new Random();
                var date = new RandomDateTime();

                for (int i = 0; i < howMany; i++)
                {
                    var openRand = r.Next(openTime.Length);
                    var closeRand = r.Next(closeTime.Length);
                    var r1 = r.Next(0, address.Length);
                    var capacity = r.Next(2, 10) * 100;

                    var startDate = date.Days();
                    var closeDate = "Czynny";

                    writer.WriteLine(
                        address[r1] + sep + capacity + sep + openTime[openRand] + sep + closeTime[closeRand] + sep
                        + date.Days() + sep + closeDate
                        );
                }

            }

        }
    }
}
