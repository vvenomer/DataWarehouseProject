namespace Generator
{
    using System;
    using System.IO;
    using System.Text;

    public static class KlienciDB
    {
        public static void Generate(int howMany)
        {
            var sep = ';';
            string[] mNames = File.ReadAllLines(Generator.Path + "maleNames.txt");
            string[] fNames = File.ReadAllLines(Generator.Path + "femaleNames.txt");
            string[] mSurnames = File.ReadAllLines(Generator.Path + "maleSurnames.txt");
            string[] fSurnames = File.ReadAllLines(Generator.Path + "femaleSurnames.txt");
            string[] locations = File.ReadAllLines(Generator.Path + "wyniki/Adress.csv");
            //string[] cities = File.ReadAllLines(Generator.Path + "cities.txt");

            var r = new Random();
            var postalCodes = new RandomAddressCode();
            using (var writer = new StreamWriter(Generator.Path + "wyniki/KlienciDB.csv", false, Encoding.Unicode))
            {
                for (int id = 0; id < howMany; id++)
                {
                    string name, surname;
                    var mName = r.Next(mNames.Length);
                    var fName = r.Next(fNames.Length);
                    var mSurname = r.Next(mSurnames.Length);
                    var fSurname = r.Next(fSurnames.Length);
                    var location = r.Next(locations.Length);
                    //var city = r.Next(cities.Length);

                    if (r.NextDouble() < 0.5)
                    {
                        name = mNames[mName];
                        surname = mSurnames[mSurname];
                    }
                    else
                    {
                        name = fNames[fName];
                        surname = fSurnames[fSurname];
                    }
                    

                    writer.WriteLine(id.ToString() + sep + name + sep + surname + sep + locations[location]);
                }
            }
        }
    }
}
