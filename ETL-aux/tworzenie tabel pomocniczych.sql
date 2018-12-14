USE master;
CREATE DATABASE auxiliary;
GO

USE auxiliary;

CREATE TABLE swieta(data date PRIMARY KEY, swieto nVARCHAR(500), wolne BIT);

USE master;
GO