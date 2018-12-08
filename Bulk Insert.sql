/* Clients  */
BULK INSERT dbo.Clients
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\KlienciDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* PackageTypes */
BULK INSERT dbo.PackageTypes
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\TypyPrzesylekDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* Magazines */
BULK INSERT dbo.Magazines
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\MagazynyDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* Packages */
BULK INSERT dbo.Packages
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\PrzesylkiDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/*   PackageStatuses    */
BULK INSERT dbo.PackageStatuses
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\StatusyPrzesylekDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* Courses */
BULK INSERT dbo.Courses
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\KursyDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/*  Couriers  */
BULK INSERT dbo.Couriers
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\KurierzyDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);