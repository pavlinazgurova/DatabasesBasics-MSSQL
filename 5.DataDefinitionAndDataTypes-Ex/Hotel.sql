CREATE DATABASE HOTEL

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(200)
)

CREATE TABLE Customers (
	AccountNumber INT PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber INT NOT NULL,
	EmergencyName NVARCHAR(50) NOT NULL,
	EmergencyNumber INT NOT NULL,
	Notes NVARCHAR(200)
)

CREATE TABLE RoomStatus (
	RoomStatus INT PRIMARY KEY IDENTITY(1, 1),
	Notes NVARCHAR(200)
)

CREATE TABLE RoomTypes (
	RoomType INT PRIMARY KEY IDENTITY(1, 1),
	Notes NVARCHAR(200)
)

CREATE TABLE BedTypes (
	BedType INT PRIMARY KEY IDENTITY(1, 1),
	Notes NVARCHAR(200)
)

CREATE TABLE Rooms (
	RoomNumber INT PRIMARY KEY IDENTITY(1, 1),
	RoomType INT FOREIGN KEY REFERENCES RoomTypes(RoomType),
	BedType INT FOREIGN KEY REFERENCES BedTypes(BedType),
	Rate INT,
	RoomStatus INT FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
	Notes NVARCHAR(200)
)

CREATE TABLE Payments (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	PaymentDate DATE NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT NOT NULL, 
	AmountCharged DECIMAL(15,2) NOT NULL,
	TaxRate DECIMAL(15, 2),
	TaxAmount DECIMAL(15, 2),
	PaymentTotal DECIMAL(15, 2) NOT NULL,
	Notes NVARCHAR(200)
)

CREATE TABLE Occupancies (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeID INT FOREIGN KEY REFERENCES Employees(Id),
	DateOccupied DATE NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
	RateApplied INT,
	PhoneCharge DECIMAL(15, 2),
	Notes NVARCHAR(200)
)

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES 
('FIRSTNAME', 'LASTNAME', NULL, NULL),
('FIRSTNAME', 'LASTNAME', 'TITLE', NULL),
('FIRSTNAME', 'LASTNAME', NULL, 'NOTES')

INSERT INTO Customers(FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
('FIRSTNAME', 'LASTNAME', 0898525252, 'NAME', 0898654654, NULL),
('FIRSTNAME', 'LASTNAMEEE', 0898528252, 'NAME', 0898824654, 'NOTES'),
('FIRSTNAMEEE', 'LASTNAME', 0898589252, 'NAME', 0897854654, NULL)

INSERT INTO RoomStatus(Notes) VALUES 
('NEW'),
('Occupated'),
('OLD')

INSERT INTO RoomTypes(Notes) VALUES 
('one'),
('two'),
('three')

INSERT INTO BedTypes(Notes) VALUES 
('first'),
('second'),
('third')

INSERT INTO Rooms(RoomType, BedType, Rate, RoomStatus, Notes) VALUES
(1, 1, 4.0, 3, NULL),
(2, 1, 4.0, 1, NULL),
(2, 3, 4.0, 2, 'NOTES')

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays,
AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes) VALUES
(1, '2017-02-02', 1, '2017-02-03', '2017-02-04', 10, 200.00, NULL, NULL, 230.00, NULL),
(1, '2017-02-02', 1, '2017-02-03', '2017-02-04', 10, 200.00, NULL, NULL, 230.00, NULL),
(1, '2017-02-02', 1, '2017-02-03', '2017-02-04', 10, 200.00, NULL, NULL, 230.00, NULL)

INSERT INTO Occupancies(EmployeeID, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) VALUES
(1, '2017-02-03', 2, 3, 6.3, 3.60, 'nOTES'),
(1, '2017-02-03', 2, 3, 6.3, 3.60, 'nOTES'),
(1, '2017-02-03', 2, 3, 6.3, 3.60, 'nOTES')

UPDATE Payments
SET TaxRate -= TaxRate * 0.03

SELECT TaxRate FROM Payments