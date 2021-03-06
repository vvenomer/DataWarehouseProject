/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Worker_Id]
      ,[Name]
      ,[Surname]
  FROM [Transportex].[dbo].[Couriers]
  WHERE [Surname] LIKE '%ska%';

/* Przyrost paczek, kursow i statusow */

select count(*) from dbo.Packages;
select count(*) from dbo.Courses;
select count(*) from dbo.PackageStatuses;

/* New Bulk Insert 2 */

select count(*) from dbo.Packages;
select count(*) from dbo.Courses;
select count(*) from dbo.PackageStatuses;

select PS.PackageId from dbo.Packages
join dbo.PackageStatuses AS PS ON PS.PackageId = Packages.Id
GROUP BY PS.PackageId
HAVING count(PS.PackageId) = 1

select S.Name, count(*) as 'Liczba'
from dbo.Packages
join dbo.PackageStatuses as S on S.PackageId = Packages.CourseId
group by S.Name

select S.Name, count(*) as 'Liczba'
from dbo.Packages
join dbo.PackageStatuses as S on S.PackageId = Packages.CourseId
Where S.Name = 'W drodze'
group by S.Name



-- TESTOWANIE
/* Pokazanie, ze liczba paczek w kursie zgadza sie z paczkami */
Select CourseId, count(CourseId), C.Id, C.NrOfPackages from (
SELECT TOP(100) * from Packages
order by Id DESC
) AS G
join Courses AS C ON C.Id = CourseId
Group By G.CourseId, C.NrOfPackages, C.Id