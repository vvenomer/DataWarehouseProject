using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Generator
{
    class DateAux
    {
        public static void Generate(int howManyYearsForward)
        {
            string sep = ";";
            using (var dateWriter = new StreamWriter(Generator.Path + "wyniki/Date.csv", false, Encoding.Unicode))
            {
                var date = new DateTime(2010, 1, 1);

                dateWriter.WriteLine("date;day;month;year");
                while (date <= DateTime.Today.AddYears(howManyYearsForward))
                {
                    var dateId = date.ToString("yyyy-MM-dd");
                    dateWriter.WriteLine(dateId + sep + date.Day + sep + date.Month + sep + date.Year);
                    date = date.AddDays(1.0);
                }

            }
        }
    }
}
