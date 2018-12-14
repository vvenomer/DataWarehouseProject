using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Generator
{
    static class Zero
    {
        public static string AddZero(this int nr)
        {
            if (nr < 10)
                return "0" + nr.ToString();
            return nr.ToString();
        }
    }
    class TimeAux
    {
        public static void Generate()
        {
            string separator = ";";
            using (var timeWriter = new StreamWriter(Generator.Path + "wyniki/Time.csv", false, Encoding.Unicode))
            {
                for(int h = 0; h < 24; h++)
                {
                    for (int m = 0; m < 60; m++)
                    {
                        for (int s = 0; s < 60; s++)
                        {
                            string id = h.AddZero() + ":" + m.AddZero() + ":" + s.AddZero();
                            string currTime = h + separator + m + separator + s;
                            timeWriter.WriteLine(id + separator + currTime);
                        }
                    }
                }
            }
        }
    }
}
