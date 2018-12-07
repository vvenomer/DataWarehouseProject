using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    public static class MagazynyDB
    {
        public static void Generate()
        {
            var sep = ';';
            string[] data = File.ReadAllLines(Generator.Path + "wyniki/StoreExcel.csv");

            using (var writer = new StreamWriter(Generator.Path + "wyniki/MagazynyDB.csv", false, Encoding.Unicode))
            {
                var postalCodes = new RandomAddressCode();

                int id = 0;
                foreach (var row in data)
                {
                    if (data[0] == row)
                        continue;
                    var text = row.Split(';');
                    writer.WriteLine(id.ToString() + sep + text[0] + sep + text[1]);
                    id++;
                }
            }
        }
    }
}
