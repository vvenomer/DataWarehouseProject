using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Generator
{
    class Location
    {
        public static void Generate(double postalChance, int postalBias, double addressChance, int addressBias)
        {
            var postal = new RandomAddressCode();
            var r = new Random();
            string[] locations = File.ReadAllLines(Generator.Path + "locations.txt");
            string[] voivodeship = File.ReadAllLines(Generator.Path + "regions.txt");

            using (var cityWriter = new StreamWriter(Generator.Path + "wyniki/City.csv", false, Encoding.Unicode))
            {
                using (var addressWriter = new StreamWriter(Generator.Path + "wyniki/Adress.csv", false, Encoding.Unicode))
                {
                    for (int i = 0; i < postalBias || r.NextDouble() < postalChance; i++)
                    {
                        string postalCode = postal.Next();
                        string chosenVoivodeship = voivodeship[r.Next(voivodeship.Length)];
                        string[] cities = File.ReadAllLines(Generator.Path + "../dane2/" + chosenVoivodeship + ".txt");
                        string chosenCity = cities[r.Next(cities.Length)];

                        cityWriter.WriteLine(postalCode + ";" + chosenCity + ";" + chosenVoivodeship);
                        for (int j = 0; j < addressBias || r.NextDouble() < addressChance; j++)
                        {
                            string street = locations[r.Next(locations.Length)];
                            string number = postal.NextHouseAddress();
                            addressWriter.WriteLine("ul. " + street + " " + number + ";" + postalCode);
                        }
                    }
                }
            }
        }
    }
}
