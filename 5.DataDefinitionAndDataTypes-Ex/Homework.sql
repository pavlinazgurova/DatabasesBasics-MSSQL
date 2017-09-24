CREATE DATABASE Minions

CREATE TABLE Minions (
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50),
	Age INT 
)

CREATE TABLE Towns (
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50)
)

ALTER TABLE Minions
ADD TownId INT FOREIGN KEY REFERENCES Towns(Id)

INSERT INTO Towns(Id, [Name]) VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO Minions(Id,[Name], Age, TownId) VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2)

TRUNCATE TABLE Minions

DROP TABLE Minions

DROP TABLE Towns

CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	Height DECIMAL(15, 2),
	[Weight] DECIMAL(15, 2),
	Gender NCHAR(1) CHECK(Gender = 'm' OR Gender = 'f'),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People([Name], Picture, Height, [Weight], Gender, Birthdate,Biography) VALUES
('Meri', NULL, 168.00, NULL, 'f', '2015-12-17', 'cat'),
('Lili', NULL, 168.00, 45.00, 'f', '1994-12-14', 'pretty'),
('Stefan', NULL, 188.00, NULL, 'm', '1994-12-14', 'student'),
('Misho', NULL, 198.00, 82.36, 'm', '1994-12-14', 'student'),
('Kati', NULL, 168.00, 55.00, 'f', '1994-12-14', 'cat')

CREATE TABLE Users (
	Id INT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT 
)

INSERT INTO Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted) VALUES 
('USER123', '123456', NULL, NULL, 0),
('another', '963852741', NULL, NULL, 0),
('onemoreuser', '525252', NULL, NULL, 1),
('second', 'zdrasti', NULL, NULL, 1),
('last', '987654321', NULL, NULL, 0)

ALTER TABLE Users 
ADD CONSTRAINT CHK_Password CHECK (LEN([Password]) >= 5)

ALTER TABLE Users
ADD CONSTRAINT DF_LastLogin DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users 
ADD CONSTRAINT CHK_Username CHECK (LEN(Username) >= 3)