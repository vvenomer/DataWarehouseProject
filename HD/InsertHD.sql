--SPECIAL_VALUES
	INSERT INTO MyDate VALUES ('', 0, 0, 0);
	INSERT INTO MyDate VALUES ('Narodowy dzieñ projektowania hurtowni danych', 13, 01, 2018);
	INSERT INTO MyTime values(0, 0, 24);
--packageTypes
	INSERT INTO MyDate VALUES ('', 5, 1, 2008);
	INSERT INTO PackageTypes VALUES (
		'zwyk³a op³acona',
		'Zwyk³a przesy³ka op³acona z góry',
		6.99,
		ident_current('MyDate'),
		1);
--packageTypes2
	INSERT INTO MyDate VALUES ('', 6, 1, 2008);
	INSERT INTO PackageTypes VALUES (
		'zwyk³a pobraniowa',
		'Zwyk³a przesy³ka za pobraniem',
		10.99,
		ident_current('MyDate'),
		1);
--Courier
	INSERT INTO Couriers VALUES(1,'Nieznany',0,0,'brak',1,'brak');
	INSERT INTO MyDate VALUES ('', 15, 6, 2010);
	INSERT INTO Couriers VALUES (
		546,
		'D¹brówka Firl¹g',
		78230902584,
		785666912,
		'dabrowka.firlag@mymail.com',
		IDENT_CURRENT('MyDate'),
		'Region A');
--Courier
	INSERT INTO MyDate VALUES ('', 24, 8, 2005);
	INSERT INTO Couriers VALUES (
		694,
		'Jef Gombrowicz',
		82131012376,
		784673592,
		'jef.gombrowicz@mymail.com',
		IDENT_CURRENT('MyDate'),
		'Region B');
--Magazine
	INSERT INTO dbo.Addresses values (0, 'Nieznana', 'Nieznane', 'Nieznane', 'Nieznane', '------');
	INSERT INTO dbo.Magazines values ('Nieznany',1,'Nieznana',1,1,1,1);

	INSERT INTO dbo.MyTime values(0, 0, 8);
	INSERT INTO dbo.MyDate values('', 1, 1, 2018);
	INSERT INTO dbo.Addresses values ('10', 'Fio³kowa', 'Gdansk', 'Pomorskie', 'Polska', '88-248');
	INSERT INTO dbo.Magazines values ('MagazynA', IDENT_CURRENT('Addresses'), 'maly', IDENT_CURRENT('MyTime'), null, IDENT_CURRENT('MyDate'), 1);

	INSERT INTO dbo.MyDate values('', 25, 5, 2018);
	INSERT INTO dbo.Addresses values ('2', 'S³onecznikowa', 'Wroc³aw', 'Dolnoœl¹skie', 'Polska', '50-001');
	INSERT INTO dbo.Magazines values ('MagazynB', IDENT_CURRENT('Addresses'), 'duzy', IDENT_CURRENT('MyTime'), null, IDENT_CURRENT('MyDate'), 1);

	INSERT INTO dbo.MyDate values('', 31, 9, 2018);
	INSERT INTO dbo.Addresses values ('33', 'Lawendowa', 'Warszawa', 'Mazowieckie', 'Polska', '00-006');
	INSERT INTO dbo.Magazines values ('MagazynC', IDENT_CURRENT('Addresses'), 'sredni', IDENT_CURRENT('MyTime'), null, IDENT_CURRENT('MyDate'), 1);

	INSERT INTO dbo.MyTime values(0, 0, 18);
	update dbo.Magazines set ClosingHours=IDENT_CURRENT('MyTime') where Id=IDENT_CURRENT('Magazines');
	update dbo.Magazines set ClosingHours=IDENT_CURRENT('MyTime') where Id=IDENT_CURRENT('Magazines')-1;
	update dbo.Magazines set ClosingHours=IDENT_CURRENT('MyTime') where Id=IDENT_CURRENT('Magazines')-2;
--Clients
	INSERT INTO dbo.Addresses values (100, 'Pomorska', 'Gdansk', 'Pomorskie', 'Polska', '88-242');
	INSERT INTO dbo.Clients values ('Jacek Ardanowski', IDENT_CURRENT('Addresses'));

	INSERT INTO dbo.Addresses values (200, 'Wiœlana', 'Kraków', 'Ma³opolskie', 'Polska', '04-218');
	INSERT INTO dbo.Clients values ('Pawe³ Blajer', IDENT_CURRENT('Addresses'));

	INSERT INTO dbo.Addresses values (300, 'Leœna', 'Warszawa', 'Mazowieckie', 'Polska', '00-007');
	INSERT INTO dbo.Clients values ('Grzegorz Choiñski', IDENT_CURRENT('Addresses'));

	INSERT INTO dbo.Addresses values (400, 'Górska', 'Poznañ', 'Wielkopolskie', 'Polska', '31-062');
	INSERT INTO dbo.Clients values ('Piotr Dulski', IDENT_CURRENT('Addresses'));
--Courses
	--INSERT INTO Courses SELECT Worker_Id FROM Couriers WHERE NameSurname='D¹brówka Firl¹g';
	--INSERT INTO Courses SELECT Worker_Id FROM Couriers WHERE NameSurname='Jef Gombrowicz';
	INSERT INTO Courses VALUES (1);
--Packages
	--Package that has not yet been put in magazine
	INSERT INTO MyDate VALUES ('Œwiêty dzieñ spaghetti', 18, 11, 2018);
	INSERT INTO MyTime VALUES (37,52,15);
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'), 
		10, 
		6.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Jacek Ardanowski'),
		(SELECT Id FROM Clients WHERE NameSurname='Pawe³ Blajer'),
		(SELECT Id FROM PackageTypes WHERE Name='zwyk³a op³acona'),
		1,
		1,
		1, --AtMagazineDate
		1, --AtMagazineTime
		1, --EnRouteDate
		1, --EnRouteTime
		NULL, --InMagazine
		1, --DeliveredDate
		1, --DeliveredTime
		NULL, --DeliveringTime
		1, --BackToDepartmentDate
		1, --BackToDepartmentTime
		NULL, --BackToDepartment
		1, --BackToSenderDate
		1, --BackToSenderTime
		NULL --BackToSender
		);
		
	--Package that has just been put in magazine
	INSERT INTO MyDate VALUES ('', 20, 11, 2018);
	INSERT INTO MyTime VALUES (56,37,17);
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'), 
		15, 
		10.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Piotr Dulski'),
		(SELECT Id FROM Clients WHERE NameSurname='Jacek Ardanowski'),
		(SELECT Id FROM PackageTypes WHERE Name='zwyk³a pobraniowa'),
		1,
		1,
		1, --AtMagazineDate
		1, --AtMagazineTime
		1, --EnRouteDate
		1, --EnRouteTime
		NULL, --InMagazine
		1, --DeliveredDate
		1, --DeliveredTime
		NULL, --DeliveringTime
		1, --BackToDepartmentDate
		1, --BackToDepartmentTime
		NULL, --BackToDepartment
		1, --BackToSenderDate
		1, --BackToSenderTime
		NULL --BackToSender
		);
		
	INSERT INTO MyTime VALUES (30,35,18); --
	UPDATE Packages SET
		AtMagazineDate=IDENT_CURRENT('MyDate'),
		AtMagazineTime=IDENT_CURRENT('MyTime'),
		MagazineId=(SELECT Id FROM Magazines WHERE Name='MagazynA')
		WHERE
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=11 and Days=20) and
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=17 and Minutes=37 and Seconds=56)	
	
	--Package that has just left magazine
	INSERT INTO MyDate VALUES ('', 22, 11, 2018);
	INSERT INTO MyTime VALUES (25,01,10);
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'), 
		25, 
		10.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Grzegorz Choiñski'),
		(SELECT Id FROM Clients WHERE NameSurname='Jacek Ardanowski'),
		(SELECT Id FROM PackageTypes WHERE Name='zwyk³a pobraniowa'),
		1,
		1,
		1, --AtMagazineDate
		1, --AtMagazineTime
		1, --EnRouteDate
		1, --EnRouteTime
		NULL, --InMagazine
		1, --DeliveredDate
		1, --DeliveredTime
		NULL, --DeliveringTime
		1, --BackToDepartmentDate
		1, --BackToDepartmentTime
		NULL, --BackToDepartment
		1, --BackToSenderDate
		1, --BackToSenderTime
		NULL --BackToSender
		);
		
	INSERT INTO MyTime VALUES (56,37,17);
	UPDATE Packages SET 
		AtMagazineDate=IDENT_CURRENT('MyDate'),
		AtMagazineTime=IDENT_CURRENT('MyTime'),
		MagazineId=(SELECT Id FROM Magazines WHERE Name='MagazynA')
		WHERE 
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=11 and Days=22) and
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=10 and Minutes=01 and Seconds=25)
	
	INSERT INTO Courses SELECT Worker_Id FROM Couriers WHERE NameSurname='D¹brówka Firl¹g';
	INSERT INTO MyDate VALUES ('', 23, 11, 2018);
	INSERT INTO MyTime VALUES (42,12,16);
	UPDATE Packages SET 
		CourseId=IDENT_CURRENT('Courses'), 
		EnRouteDate= IDENT_CURRENT('MyDate'), 
		EnRouteTime=IDENT_CURRENT('MyTime'),
		InMagazine=81286
		WHERE 
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=11 and Days=22) and 
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=10 and Minutes=01 and Seconds=25)

	--Package that has been delivered
	INSERT INTO MyDate VALUES ('', 22, 10, 2018);
	INSERT INTO MyTime VALUES (25,11,10);
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'), 
		13, 
		10.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Grzegorz Choiñski'),
		(SELECT Id FROM Clients WHERE NameSurname='Jacek Ardanowski'),
		(SELECT Id FROM PackageTypes WHERE Name='zwyk³a pobraniowa'),
		1,
		1,
		1, --AtMagazineDate
		1, --AtMagazineTime
		1, --EnRouteDate
		1, --EnRouteTime
		NULL, --InMagazine
		1, --DeliveredDate
		1, --DeliveredTime
		NULL, --DeliveringTime
		1, --BackToDepartmentDate
		1, --BackToDepartmentTime
		NULL, --BackToDepartment
		1, --BackToSenderDate
		1, --BackToSenderTime
		NULL --BackToSender
		);
		
	INSERT INTO MyTime VALUES (56,37,17);
	UPDATE Packages SET 
		AtMagazineDate=IDENT_CURRENT('MyDate'),
		AtMagazineTime=IDENT_CURRENT('MyTime'),
		MagazineId=(SELECT Id FROM Magazines WHERE Name='MagazynA')
		WHERE 
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=10 and Days=22) and
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=10 and Minutes=11 and Seconds=25)

	INSERT INTO MyDate VALUES ('', 23, 10, 2018);
	INSERT INTO MyTime VALUES (42,12,18);
	UPDATE Packages SET 
		CourseId=IDENT_CURRENT('Courses'), 
		EnRouteDate= IDENT_CURRENT('MyDate'), 
		EnRouteTime=IDENT_CURRENT('MyTime'),
		InMagazine=81286
		WHERE 
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=10 and Days=22) and
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=10 and Minutes=11 and Seconds=25)

	INSERT INTO MyTime VALUES (56,37,21);
	UPDATE Packages SET 
		DeliveredDate=IDENT_CURRENT('MyDate'),
		DeliveredTime=IDENT_CURRENT('MyTime'),
		DeliveringTime=10800
		WHERE 
			CreateDate=(SELECT Id FROM MyDate WHERE Years=2018 and Months=10 and Days=22) and
			CreateTime=(SELECT Id FROM MyTime WHERE Hours=10 and Minutes=11 and Seconds=25)

		--Package #1
	-- Created Date&Time
	INSERT INTO MyDate VALUES ('', 18, 11, 2018);
	INSERT INTO MyTime VALUES (15,28,6);
	-- AtMagazine Date&Time
	INSERT INTO MyDate VALUES ('', 19, 11, 2018);
	INSERT INTO MyTime VALUES (25,29,7);
	-- EnRoute Date&Time
	INSERT INTO MyDate VALUES ('', 20, 11, 2018);
	INSERT INTO MyTime VALUES (24,25,8);
	-- Delivering Date&Time
	INSERT INTO MyDate VALUES ('', 21, 11, 2018);
	INSERT INTO MyTime VALUES (59,15,9);
	-- BackToDepartment Date&Time
	INSERT INTO MyDate VALUES ('', 22, 11, 2018);
	INSERT INTO MyTime VALUES (44,10,10);
	
	INSERT INTO Courses SELECT Worker_Id FROM Couriers WHERE NameSurname='D¹brówka Firl¹g';
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate')-4,
		IDENT_CURRENT('MyTime')-4, 
		12, 
		6.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Jacek Ardanowski'),
		(SELECT Id FROM Clients WHERE NameSurname='Pawe³ Blajer'),
		(SELECT Id FROM PackageTypes WHERE Name='zwyk³a op³acona'),
		IDENT_CURRENT('Courses'),
		(SELECT Id FROM Magazines WHERE Name='MagazynC'),
		IDENT_CURRENT('MyDate')-3,
		IDENT_CURRENT('MyTime')-3, 
		IDENT_CURRENT('MyDate')-2,
		IDENT_CURRENT('MyTime')-2,
		85200,
		IDENT_CURRENT('MyDate')-1,
		IDENT_CURRENT('MyTime')-1,
		83600,
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'),
		84700,
		1,
		1,
		null
		);

	--Package #2
	
	-- Created Date&Time
	INSERT INTO MyDate VALUES ('', 1, 12, 2018);
	INSERT INTO MyTime VALUES (16,28,6);
	-- AtMagazine Date&Time
	INSERT INTO MyDate VALUES ('', 2, 12, 2018);
	INSERT INTO MyTime VALUES (42,50,9);
	-- EnRoute Date&Time
	INSERT INTO MyDate VALUES ('', 3, 11, 2018);
	INSERT INTO MyTime VALUES (54,38,8);
	-- Delivered Date&Time
	INSERT INTO MyDate VALUES ('', 4, 11, 2018);
	INSERT INTO MyTime VALUES (45,35,10);
	-- BackToDepartment Date&Time
	INSERT INTO MyDate VALUES ('', 5, 11, 2018);
	INSERT INTO MyTime VALUES (21,8,8);
	-- BackToSender Date&Time
	INSERT INTO MyDate VALUES ('', 5, 11, 2018);
	INSERT INTO MyTime VALUES (1,18,10);
	
	INSERT INTO Courses SELECT Worker_Id FROM Couriers WHERE NameSurname='Jef Gombrowicz';
	
	INSERT INTO Packages VALUES (
		IDENT_CURRENT('MyDate')-5,
		IDENT_CURRENT('MyTime')-5, 
		11, 
		6.99, 
		(SELECT Id FROM Clients WHERE NameSurname='Piotr Dulski'),
		(SELECT Id FROM Clients WHERE NameSurname='Grzegorz Choiñski'),
		(SELECT Id FROM PackageTypes WHERE Price=6.99),
		IDENT_CURRENT('Courses'),
		(SELECT Id FROM Magazines WHERE Name='MagazynB'),
		IDENT_CURRENT('MyDate')-4,
		IDENT_CURRENT('MyTime')-4, 
		IDENT_CURRENT('MyDate')-3,
		IDENT_CURRENT('MyTime')-3,
		85200,
		IDENT_CURRENT('MyDate')-2,
		IDENT_CURRENT('MyTime')-2,
		83600,
		IDENT_CURRENT('MyDate')-1,
		IDENT_CURRENT('MyTime')-1,
		81604,
		IDENT_CURRENT('MyDate'),
		IDENT_CURRENT('MyTime'),
		82400
		);