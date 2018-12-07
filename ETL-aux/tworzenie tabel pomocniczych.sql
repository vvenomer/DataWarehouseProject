USE master;
CREATE DATABASE auxiliary;
GO

USE auxiliary;

CREATE TABLE swieta(data DATETIME PRIMARY KEY, swieto VARCHAR(500), wolne BIT);

USE master;
GO