namespace Generator
{
    using System;
    using System.IO;
    using System.Text;

    public static class StoreExcel
    {
        public static void Generate(int howMany)
        {
            var header = "Adres;Kod Pocztowy;Pojemność [m^3];Godzina otwarcia;Godzina zamknięcia";
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

                    writer.WriteLine(
                        address[r1] + sep + capacity + sep + openTime[openRand] + sep + closeTime[closeRand]);
                }
            }
        }

        public static void AppendNew(int howMany)
        {
            var header = "Adres;Kod Pocztowy;Pojemność [m^3];Godzina otwarcia;Godzina zamknięcia";
            var oldName = "wyniki/StoreExcel.csv";
            var name = "wyniki/StoreExcelNew.csv";
            var sep = ';';

            string[] address = File.ReadAllLines(Generator.Path + "wyniki/Adress.csv");
            string[] oldStores = File.ReadAllLines(Generator.Path + oldName);

            using (var writer = new StreamWriter(Generator.Path + name, false, Encoding.Unicode))
            {
                writer.WriteLine(header);

                string[] openTime = new string[] { "6:00", "7:00", "8:00", "9:00" };
                string[] closeTime = new string[] { "17:00", "18:00", "19:00", "20:00" };

                var r = new Random();
                var date = new RandomDateTime();

                for(int i = 0; i < oldStores.Length; i++)
                {
                    if (i == 0)
                        continue;

                    var oldStore = oldStores[i].Split(';');

                    var capacity = r.Next(2, 10) * 100;
                    var openRand = r.Next(openTime.Length);
                    var closeRand = r.Next(closeTime.Length);
                    writer.WriteLine(oldStore[0] + sep + oldStore[1] + sep + capacity + sep +
                        openTime[openRand] + sep + closeTime[closeRand]);
                }

                for (int i = 0; i < howMany; i++)
                {
                    var openRand = r.Next(openTime.Length);
                    var closeRand = r.Next(closeTime.Length);
                    var r1 = r.Next(0, address.Length);
                    var capacity = r.Next(2, 10) * 100;

                    writer.WriteLine(
                        address[r1] + sep + capacity + sep + openTime[openRand] + sep + closeTime[closeRand]);
                }
            }
        }
    }
}
