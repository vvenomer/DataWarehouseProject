namespace Generator
{
    using System;

    public class RandomDateTime
    {
        public DateTime start;
        public Random gen;
        public int range;

        public RandomDateTime()
        {
            start = new DateTime(2017, 1, 1);
            gen = new Random();
            range = (DateTime.Today - start).Days;
        }

        public RandomDateTime(DateTime start, DateTime stop)
        {
            this.start = start;
            gen = new Random();
            range = (stop - start).Days;
        }

        public string Days()
        {
            return start.AddDays(gen.Next(range)).ToShortDateString();
        }

        public DateTime DaysHoursMinutes()
        {
            return start.AddDays(gen.Next(range)).AddHours(gen.Next(0, 24)).AddMinutes(gen.Next(0, 60));
        }


        public DateTime HoursMinutesSeconds()
        {
            return start.AddHours(gen.Next(0, 24)).AddMinutes(gen.Next(0, 60)).AddSeconds(gen.Next(0, 60));
        }

        public DateTime SpecifiedDate(int howManyDaysAgo)
        {
            var date = new TimeSpan(howManyDaysAgo, 0, 0, 0);
            return DateTime.Now.Subtract(date);
        }

        public TimeSpan TimeSpan(int minRange)
        {
            var days = gen.Next(0, 2);
            var hours = gen.Next(minRange, 24);
            var minutes = gen.Next(0, 60);
            var seconds = gen.Next(0, 60);

            return new TimeSpan(days, hours, minutes, seconds);
        }
    }
}
