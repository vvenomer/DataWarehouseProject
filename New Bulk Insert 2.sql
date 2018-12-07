/* Packages */
BULK INSERT dbo.Packages
FROM 'C:\data-generation\Generator\Generator\bin\Debug\data\wyniki\NowePrzesylkiDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/*   PackageStatuses */
BULK INSERT dbo.PackageStatuses
FROM 'C:\data-generation\Generator\Generator\bin\Debug\data\wyniki\NoweStatusyPrzesylekDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);

/* Courses */
BULK INSERT dbo.Courses
FROM 'C:\data-generation\Generator\Generator\bin\Debug\data\wyniki\NoweKursyDB.csv'
WITH
(
  FIELDTERMINATOR = ';'
);