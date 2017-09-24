CREATE DATABASE CarRental

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) UNIQUE NOT NULL,
	DailyRate INT,
	WeeklyRate INT,
	MonthlyRate INT NOT NULL,
	WeekdendRate INT
)

CREATE TABLE Cars (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	PlateNumber INT UNIQUE NOT NULL,
	Manufacturer NVARCHAR(50) NOT NULL,
	Model NVARCHAR(50) NOT NULL,
	CarYear DATE NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Doors INT CHECK(Doors = 2 OR Doors = 4),
	Picture VARBINARY(MAX),
	Condition  NVARCHAR(200),
	Available BIT
)

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(50)
)

CREATE TABLE Customers (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DriverLicenceNumber INT NOT NULL,
	FullName NVARCHAR(80) NOT NULL,
	[Address] NVARCHAR(150),
	City NVARCHAR(50) NOT NULL,
	ZIPCode INT,
	Notes NVARCHAR(500)
)

CREATE TABLE RentalOrders  (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	TankLevel INT,
	KilometrageStart INT,
	KilometrageEnd INT,
	TotalKilometrage INT,
	StartDate DATE,
	EndDate DATE,
	TotalDays INT,
	RateApplied INT,
	TaxRate INT,
	OrderStatus BIT,
	Notes NVARCHAR(500)
)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekdendRate) VALUES
('FIRST', 2.3, NULL, 4.3, NULL),
('SECOND', 2.3, 2.9, 4.3, NULL),
('THIRD', 2.3, NULL, 4.3, 5.6)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
(12859, 'someONE', 'MODEL', '2017-01-01', 1, 2, NULL, NULL, 1),
(325888412, 'someONE', 'MODEL', '2017-01-01', 1, 2, NULL, NULL, 1),
(3232841, 'someONE', 'MODEL', '2017-01-01', 2, 4, NULL, NULL, 0)

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES 
('NAME', 'LASTNAME', 'TITLE', 'FIRST'),
('NAME', 'LASTNAME', NULL, 'SECOND'),
('NAME', 'LASTNAME', 'TITLE', 'THIRD')

INSERT INTO Customers(DriverLicenceNumber, FullName, [Address], City,ZIPCode, Notes) VALUES
(15815, 'fullname0', NULL, 'SOFIA', NULL, 'NOTES'),
(9852, 'fullname0', NULL, 'SOFIA', NULL, 'NOTES'),
(852554, 'fullname0', NULL, 'SOFIA', NULL, 'NOTES')

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd,TotalKilometrage,
StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes) VALUES
(1, 2, 2, 2.0, 100, 600, 2000, '2015-02-02', '2017-02-02', 200, NULL, 2.5, 1, 'NEW'),
(1, 3, 2, 2.0, 100, 600, 2000, '2016-02-02', '2017-02-02', 100, NULL, 2.5, 1, 'NEW'),
(1, 2, 1, 2.0, 100, 600, 2000, '2015-02-02', '2017-02-02', 200, NULL, NULL, 0, 'NEW')