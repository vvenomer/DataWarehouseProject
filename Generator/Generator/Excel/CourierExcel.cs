namespace Generator
{
    using System;
    using System.IO;
    using System.Text;

    public static class CourierExcel
    {
        public static void Generate(int howMany)
        {
            var header = "Numer pracownika;Imię;Nazwisko;Numer PESEL kuriera;Numer telefoniczny;Adres e-mail;Data zatrudnienia;Region dostaw";
            var name = "wyniki/CourierExcel.csv";
            var sep = ';';

            string[] regions = File.ReadAllLines(Generator.Path + "regions.txt");
            string[] pesels = File.ReadAllLines(Generator.Path + "pesele.txt");
            string[] mNames = File.ReadAllLines(Generator.Path + "maleNames.txt");
            string[] fNames = File.ReadAllLines(Generator.Path + "femaleNames.txt");
            string[] mSurnames = File.ReadAllLines(Generator.Path + "maleSurnames.txt");
            string[] fSurnames = File.ReadAllLines(Generator.Path + "femaleSurnames.txt");

            using (var writer = new StreamWriter(Generator.Path + name, false, Encoding.Unicode))
            {
                writer.WriteLine(header);

                var r = new Random();
                var number = new RandomPhoneNumber();
                var date = new RandomDateTime();

                for (int id = 0; id < howMany; id++)
                {
                    var region = r.Next(regions.Length);
                    var pesel = r.Next(pesels.Length);
                    var mName = r.Next(mNames.Length);
                    var fName = r.Next(fNames.Length);
                    var mSurname = r.Next(mSurnames.Length);
                    var fSurname = r.Next(fSurnames.Length);

                    string nameSurname;
                    if (id % 2 == 0)
                    {
                        nameSurname = mNames[fName] + ";" + mSurnames[fSurname];
                    }
                    else
                    {
                        nameSurname = fNames[fName] + ";" + fSurnames[fSurname];
                    }

                    writer.WriteLine(
                            id.ToString() + sep + nameSurname + sep + pesels[pesel] + sep + number.Next() + sep
                            + nameSurname.Replace(';', '.') + "@transportex.com" + sep + date.Days() + sep + regions[region]
                    );
                }

            }
        }
    }
}