namespace Generator
{
    using System.IO;
    using System.Text;

    public static class KurierzyDB
    {
        public static void Generate()
        {
            var sep = ';';
            var data = File.ReadAllLines(Generator.Path + "wyniki/CourierExcel.csv");
            
            using (var writer = new StreamWriter(Generator.Path + "wyniki/KurierzyDB.csv", false, Encoding.Unicode))
            {
                foreach (var row in data)
                {
                    if (data[0] == row)
                        continue;
                    var text = row.Split(';');
                    writer.WriteLine(text[0] + sep + text[1] + sep + text[2]);
                }
            }
        }
    }
}
