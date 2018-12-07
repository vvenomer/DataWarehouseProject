namespace Generator
{
    using System;

    public class RandomAddressCode
    {
        public Random Rand { get; set; }

        public RandomAddressCode()
        {
            Rand = new Random();
        }

        public string Next()
        {
            string code = "";
            char sep = '-';

            for (int i = 0; i < 5; i++)
            {
                int n = Rand.Next(9);
                code += n.ToString();
                if(i == 2)
                {
                    code += sep;
                }
            }

            return code;
        }

        public string NextHouseAddress()
        {
            var letter = "ABCDEFGHIJKLMNOPRSTUWZ";
            var n = Rand.Next(1, 3);
            string address = "";
            for(int i = 0; i < n; i++)
            {
                var num = Rand.Next(1, 9);
                address += num;
            }
            address += letter[Rand.Next(letter.Length)];

            return address;
        }
    }
}
