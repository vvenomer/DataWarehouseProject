using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    public static class KursyDB
    {
        public static void Generate(int howManyCouriers, int howManyParcels)
        {
            var sep = ';';
            var rnd = new Random();

            using (var writer = new StreamWriter(Generator.Path + "wyniki/KursyDB.csv", false, Encoding.Unicode))
            {
                var packages = File.ReadAllLines(Generator.Path + "wyniki/PrzesylkiDB.csv");
                int parcelId = 0;
                {
                    int courseId = 0;
                    while (howManyParcels > 0)
                    {
                        var parcels = rnd.Next(1, 6);
                        var courierId = rnd.Next(howManyCouriers);

                        if (howManyParcels - parcels >= 0)
                            howManyParcels -= parcels;
                        else
                        {
                            parcels = howManyParcels;
                            howManyParcels = 0;
                        }

                        writer.WriteLine(
                            courseId.ToString() + sep + parcels.ToString() + sep + courierId.ToString()
                            );

                        while (parcels-- > 0)
                        {
                            packages[parcelId] = packages[parcelId].Replace("COURSE_ID", courseId.ToString());
                            parcelId++;
                        }

                        courseId++;
                    }
                }

                File.WriteAllLines(Generator.Path + "wyniki/PrzesylkiDB.csv", packages, Encoding.Unicode);
            }
        }
    }
}
