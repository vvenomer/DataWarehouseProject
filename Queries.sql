select count(*) from dbo.PackageStatuses
select count(*) from dbo.Couriers

select * from dbo.PackageTypes

select T.Name, T.Description, count(*) as 'Liczba przesylek', 
round(sum(T.Price),2) as 'Kwota'
from dbo.Packages
join dbo.PackageStatuses as S on S.PackageId = Packages.Id
join dbo.PackageTypes as T on T.Id = TypeId
join dbo.Courses as CS on CS.Id = CourseId
join dbo.Couriers as CR on CR.Worker_Id = CS.CourierId
group by T.name, T.Description

select count(*)
from dbo.Packages
join dbo.PackageStatuses as S on S.PackageId = Packages.Id
group by S.Name

select Name, count(*) from dbo.PackageStatuses
group by PackageStatuses.Name

SELECT COUNT(*)   
FROM dbo.Packages;  

select Name, Surname, count(*) from dbo.Packages
join Courses as C on C.Id = CourseId
join Couriers as CR on C.CourierId = CR.Worker_Id
where Mass > '5.00' AND Mass < '15.00'
group by Name, Surname

select * from dbo.Magazines