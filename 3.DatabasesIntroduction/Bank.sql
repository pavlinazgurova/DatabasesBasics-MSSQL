USE Bank
GO

CREATE TABLE Clients
(
Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL
)

CREATE TABLE AccountType
(
Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Accounts (
Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
ClientId INT FOREIGN KEY REFERENCES Clients(Id) NOT NULL,
AccountTypeId INT FOREIGN KEY REFERENCES AccountType(Id) NOT NULL,
Balance DECIMAL(15, 2) DEFAULT(0) NOT NULL
)

INSERT INTO Clients(FirstName, LastName) VALUES
('Gosho', 'Ivanov'),
('Stefan', 'Lilov'),
('Ina', 'Shopova'),
('Lina','Petrova')

INSERT INTO AccountType VALUES
('Checking'),
('Savings')

INSERT INTO Accounts(ClientId, AccountTypeId, Balance) VALUES 
(1, 1, 385.56),
(1, 2, 999.50),
(2, 1, 63.00),
(3, 1, 107.30),
(4, 2, 795.38)

CREATE VIEW v_ClientBalances AS 
SELECT (FirstName + ' ' + LastName) AS [Name],
AccountType.Name AS [Account Type], Balance
FROM Clients
JOIN Accounts ON Clients.Id = Accounts.ClientId
JOIN AccountType ON AccountType.Id = Accounts.AccountTypeId

CREATE FUNCTION f_CalculateTotalBalance (@ClientId INT)
RETURNS DECIMAL(15, 2)
BEGIN 
	DECLARE @result AS DECIMAL(15, 2) = (
		SELECT SUM(Balance) 
		FROM Accounts WHERE ClientId = @ClientId
		)
	RETURN @result
END

SELECT dbo.f_CalculateTotalBalance(1) AS Balace

CREATE PROC p_AddAccount @ClientId INT, @AccountTypeId INT AS
INSERT INTO Accounts (ClientId, AccountTypeId)
VALUES (@ClientId, @AccountTypeId)

CREATE PROC p_Deposit @AccountId INT, @Amount DECIMAL(15, 2) AS
UPDATE Accounts 
SET Balance += @Amount
WHERE Id = @AccountId

CREATE PROC p_Withdraw @AccountId INT, @Amount DECIMAL(15, 2) AS
BEGIN
	DECLARE @OldBalance AS DECIMAL(15, 2)
	SELECT @OldBalance = Balance FROM Accounts WHERE Id = @AccountId
	IF (@OldBalance - @Amount >= 0)
	BEGIN UPDATE Accounts SET Balance -= @Amount WHERE Id = @AccountId
	END
	ELSE 
	BEGIN 
		RAISERROR('Insufficient funds', 10, 1)
	END
END

CREATE TABLE Transactions (
	Id INT PRIMARY KEY IDENTITY,
	AccountId INT FOREIGN KEY REFERENCES Accounts(Id),
	OldBalance DECIMAL(15, 2) NOT NULL,
	NewBalance DECIMAL(15, 2) NOT NULL,
	Amount AS NewBalance - OldBalance,
	[DateTime] DATETIME2
)

CREATE TRIGGER tr_Transaction ON Accounts
AFTER UPDATE
AS
	INSERT INTO Transactions (AccountId, OldBalance, NewBalance, [DateTime])
	SELECT inserted.Id, deleted.Balance, inserted.Balance, GETDATE() FROM inserted
	JOIN deleted ON inserted.Id = deleted.Id

p_Deposit 1, 25.00
GO

p_Deposit 1, 40.00
GO

p_Withdraw 2, 200.00
GO

p_Deposit 4, 180.00
GO

SELECT * FROM Transactions


