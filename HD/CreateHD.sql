CREATE TABLE MyTime
	(
	Id time IDENTITY (1, 1) PRIMARY KEY,
	Seconds int,
	Minutes int,
	Hours int
	)
CREATE TABLE MyDate
	(
	Id date IDENTITY (1, 1) PRIMARY KEY,
	Holiday nvarchar(60),
	Days int,
	Months int,
	Years int
	)
CREATE TABLE Addresses
	(
	Id int IDENTITY (1, 1) PRIMARY KEY,
	HouseNumber nvarchar(3),
	StreetName nvarchar(46),
	City nvarchar(50),
	Voivodeship nvarchar(50),
	Country nvarchar(50),
	PostalCode nchar(6)
	)
CREATE TABLE Clients
	(
	Id int IDENTITY (1, 1) PRIMARY KEY,
	NameSurname nvarchar(60),
	AddressId int references Addresses
	)

CREATE TABLE PackageTypes
	(
	Id int IDENTITY (1, 1) PRIMARY KEY,
	Name nvarchar(30),
	Description nvarchar(MAX) NULL,
	Price real,
	AddDate date,
	EndDate date
	)

CREATE TABLE Magazines
	(
	Id int IDENTITY (1, 1) PRIMARY KEY,
	Name nvarchar(50),
	AddressId int references Addresses,
	Capacity nvarchar(10),
	OpeningHours time references MyTime,
	ClosingHours time references MyTime,
	BeginingDate date,
	EndingDate date
	)

CREATE TABLE Couriers
	(
	Worker_Id int PRIMARY KEY,
	NameSurname nvarchar(60),
	PESEL bigint,
	PhoneNumber int,
	EmailAddress nvarchar(MAX),
	RecruitDate date REFERENCES MyDate,
	Region nvarchar(MAX)
	)

CREATE TABLE Courses
	(
	Id int IDENTITY (1, 1) PRIMARY KEY,
	CourierId int REFERENCES Couriers
	)

CREATE TABLE Packages
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	CreateDate date REFERENCES MyDate,
	CreateTime time REFERENCES MyTime,
	Mass real,
	Price real,
	
	SenderId int REFERENCES Clients,
	RecieverId int REFERENCES Clients,
	TypeId int  REFERENCES PackageTypes,
	CourseId int REFERENCES Courses,
	MagazineId int REFERENCES Magazines,
	
	AtMagazineDate date REFERENCES MyDate,
	AtMagazineTime time REFERENCES MyTime,

	EnRouteDate date REFERENCES MyDate,
	EnRouteTime time REFERENCES MyTime,
	InMagazine bigint, --czas wyjechania minus czas w�o�enia do magazynu
	
	DeliveredDate date REFERENCES MyDate,
	DeliveredTime time REFERENCES MyTime,
	DeliveringTime bigint, --czas dostarczenia minus czas wyjechania z magazynu
	
	BackToDepartmentDate date REFERENCES MyDate,
	BackToDepartmentTime time REFERENCES MyTime,
	BackToDepartment bigint, --czas powrotu do oddzia�u minus czas wyjechania z magazynu

	BackToSenderDate date REFERENCES MyDate,
	BackToSenderTime time REFERENCES MyTime,
	BackToSender bigint, --czas powrotu do nadawcy minus czas powrotu do oddzia�u
	)