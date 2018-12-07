using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    class RandomPhoneNumber
    {
        public Random r;

        public RandomPhoneNumber()
        {
            r = new Random();
        }

        public string Next()
        {
            string number = r.Next(1, 10).ToString();
            for(int i = 0; i < 8; i++)
            {
                number += r.Next(10);
            }

            return number;
        }
    }
}
