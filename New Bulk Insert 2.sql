/* Packages */
BULK INSERT dbo.Packages
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\NowePrzesylkiDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/*   PackageStatuses */
BULK INSERT dbo.PackageStatuses
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\NoweStatusyPrzesylekDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* Courses */
BULK INSERT dbo.Courses
FROM 'C:\Users\Pawelb\Desktop\Programowanie\db\HD_Transportex\Generator\Generator\data\wyniki\NoweKursyDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);