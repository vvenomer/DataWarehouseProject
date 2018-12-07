using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generator
{
    class Program
    {
        static void Main(string[] args)
        {
            var cars = 10;
            var stores = 5;
            var couriers = 10;
            var parcels = 50;
            var clients = 20;

            CarsExcel.Generate(cars);
            StoreExcel.Generate(stores);
            CourierExcel.Generate(couriers);

            KurierzyDB.Generate();
            MagazynyDB.Generate();
            PrzesylkiDB.Generate(parcels, clients, stores);
            KlienciDB.Generate(clients);
            KursyDB.Generate(couriers, parcels);

            var newParcels = 100;
            PrzyrostPaczek.Generate(parcels, newParcels, clients, stores);
            NoweKursyDB.Generate(couriers, newParcels);
            UpdateSurnamesDB.Generate(couriers);
            InsertPackageStatus.Generate();
        }
    }
}
