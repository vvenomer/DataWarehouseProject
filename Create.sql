CREATE TABLE Clients
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	Name nchar(30) NOT NULL,
	Surname nchar(30) NOT NULL,
	PostalCode nchar(6) NOT NULL, 
	Address nvarchar(50) NOT NULL
	)

CREATE TABLE PackageTypes
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	Name nchar(30) NOT NULL,
	Description varchar(MAX) NULL,
	Price real NOT NULL
	)

CREATE TABLE Magazines
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	Name nvarchar(50) NOT NULL
	)

CREATE TABLE Couriers
	(
	Worker_Id int NOT NULL IDENTITY (0, 1)  PRIMARY KEY,
	Name nchar(30) NOT NULL,
	Surname nchar(30) NOT NULL
	)

CREATE TABLE Courses
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	NrOfPackages int NOT NULL,
	CourierId int NOT NULL REFERENCES Couriers
	)

CREATE TABLE Packages
	(
	Id int NOT NULL IDENTITY (0, 1) PRIMARY KEY,
	Time datetime NOT NULL,
	Mass real NOT NULL,
	Note nvarchar(MAX),
	SenderId int REFERENCES Clients NOT NULL,
	ReceiverId int REFERENCES Clients NOT NULL,
	TypeId int  REFERENCES PackageTypes NOT NULL,
	CourseId int REFERENCES Courses,
	MagazineId int REFERENCES Magazines
	)


CREATE TABLE PackageStatuses
	(
	Id int IDENTITY (0, 1) PRIMARY KEY,
	Name nchar(30) NOT NULL,
	Description nvarchar(MAX),
	Time datetime NOT NULL,
	PackageId int REFERENCES Packages NOT NULL
	)