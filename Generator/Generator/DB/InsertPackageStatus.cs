using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    public class InsertPackageStatus
    {
        public static void Generate()
        {
            var sep = ';';
            var statuses = File.ReadAllLines(Generator.Path + "wyniki/StatusyPrzesylekDB.csv").Select(x => x.Split(';')).ToArray();
            using (var writer = new StreamWriter(Generator.Path + "wyniki/NoweStatusyPrzesylekDB.csv"))
            {
                var id = statuses.Length;

                for (int i = 0; i < statuses.Length-1; i++)
                {
                    if (statuses[i + 1][4] != statuses[i][4] && statuses[i][1].Equals("W magazynie"))
                    {
                        var status = Status.GetStatusWDrodze();
                        var date = statuses[i][3];
                        var gowno = DateTime.ParseExact(date, "yyyy'-'MM'-'dd'T'HH':'mm':'ss", System.Globalization.CultureInfo.InvariantCulture);
                        var statTime = gowno.Add(status.Time).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss");

                        writer.WriteLine(id.ToString() + sep + status.Name + sep + status.Description + sep + statTime + sep + statuses[i][4]);
                        id++;
                    }
                }
            }
        }
    }
}