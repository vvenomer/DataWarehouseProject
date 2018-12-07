namespace Generator
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Text;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;

    public class Car
    {
        public string Brand { get; set; }
        public List<string> Models { get; set; }
    }

    public static class CarsExcel
    {
        public static void Generate(int howMany)
        {
            var header = "Marka samochodu;Model samochodu;Numer rejestracyjny samochodu;Przebieg samochodu [km];Ładowność samochodu [kg];Średnie spalanie samochodu [l/100km];Data do przeglądu;Data do wygaśnięcia ubezpieczenia;Data zakupu;Data zakończenia używania";
            var name = "wyniki/CarsExcel.csv";
            var sep = ';';

            JArray jcars = JArray.Parse(File.ReadAllText(Generator.Path + "jcars.json"));
            var cars = jcars.ToObject<List<Car>>();

            string[] prefixes = File.ReadAllText(Generator.Path + "prefixes.txt").Split(',');
            string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

            using (var writer = new StreamWriter(Generator.Path + name, false, Encoding.Unicode))
            {
                writer.WriteLine(header);
                var r = new Random();
                var date = new RandomDateTime();

                for (int i = 0; i < howMany; i++)
                {
                    var r1 = r.Next(0, cars.Count);
                    var r2 = r.Next(0, cars[r1].Models.Count);
                    var l = chars.Length - 1;

                    writer.WriteLine(
                        cars[r1].Brand + sep + cars[r1].Models[r2] + sep + prefixes[r.Next(prefixes.Length - 1)] + ' '
                        + chars[r.Next(l)] + chars[r.Next(l)] + chars[r.Next(l)] + chars[r.Next(l)] + sep
                        + r.Next(10000, 100000) + sep + r.Next(1000, 2000) + sep + Math.Round(r.NextDouble() * 12, 2)
                        + sep + date.Days() + sep + date.Days() + sep + date.Days() + sep + "BRAK" + sep
                        );
                }

            }

        }
    }
}
