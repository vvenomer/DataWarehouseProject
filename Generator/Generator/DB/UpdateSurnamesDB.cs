using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    public static class UpdateSurnamesDB
    {
        public static void Generate(int howManyCouriers)
        {
            var rand = new Random();

            for(int i = 0; i < howManyCouriers; i++)
            {
                var couriers = File.ReadAllLines(Generator.Path + "wyniki/KurierzyDB.csv");
                string[] fSurnames = File.ReadAllLines(Generator.Path + "femaleSurnames.txt");

                using (var writer = new StreamWriter(Generator.Path + "wyniki/NowiKurierzyDB.sql"))
                {
                    foreach (var courier in couriers)
                    {
                        var text = courier.Split(';');
                        if(rand.NextDouble() < 0.2 && text[2].EndsWith("ska"))
                        {
                            var r = rand.Next(fSurnames.Length);
                            var oldName = text[1];
                            var oldSurname = text[2];
                            var NewSurname = fSurnames[r];
                            var sql = String.Format("UPDATE dbo.Couriers SET Surname='{0}' WHERE Name='{1}' AND Surname='{2}';",
                                NewSurname, oldName, oldSurname);

                            writer.WriteLine(sql);
                        }
                    
                    }
                }
            }
        }
    }
}
