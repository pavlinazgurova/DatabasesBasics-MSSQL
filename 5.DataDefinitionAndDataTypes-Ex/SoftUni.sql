CREATE DATABASE SoftUni
GO

CREATE TABLE Towns (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Addresses (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	AddressText NVARCHAR(100) NOT NULL,
	TownId INT FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(25) NOT NULL,
	MiddleName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	JobTitle NVARCHAR(25),
	DepartmentId INT FOREIGN KEY REFERENCES Departments(Id),
	HireDate DATE,
	Salary DECIMAL(15, 2),
	AddressId INT FOREIGN KEY REFERENCES Addresses(Id)
)

INSERT INTO Towns([Name]) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO Departments([Name]) VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId) VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, NULL),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, NULL),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25, NULL),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, NULL),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88, NULL)

SELECT * FROM Towns ORDER BY [Name] 

SELECT * FROM Departments ORDER BY [Name] 

SELECT * FROM Employees ORDER BY Salary DESC

SELECT [Name] FROM Towns ORDER BY [Name] 

SELECT [Name] FROM Departments ORDER BY [Name] 

SELECT FirstName, LastName, JobTitle, Salary FROM Employees ORDER BY Salary DESC

UPDATE Employees
SET Salary += Salary * 0.10

SELECT Salary FROM Employees 