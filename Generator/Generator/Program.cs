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
            var cars = 2000;
            var stores = 500;
            var couriers = 1500;
            var parcels = 1000000;
            var clients = 2000;

            TimeAux.Generate();
            DateAux.Generate(1);
           

            Location.Generate(1 - 1.8 / (stores + clients), 5, 1 - 0.9 / (stores + clients), 10); //typowy mój kod xd
            
            CarsExcel.Generate(cars);
            StoreExcel.Generate(stores);
            CourierExcel.Generate(couriers);
            
            KurierzyDB.Generate(); //change region
            MagazynyDB.Generate();
            PrzesylkiDB.Generate(parcels, clients, stores);
            KlienciDB.Generate(clients);
            KursyDB.Generate(couriers, parcels);
            
            var newParcels = 100;
            var newStores = 10;
            StoreExcel.AppendNew(newStores);
            PrzyrostPaczek.Generate(parcels, newParcels, clients, stores);
            NoweKursyDB.Generate(couriers, newParcels);
            //UpdateSurnamesDB.Generate(couriers);
            InsertPackageStatus.Generate();
        }
    }
}
