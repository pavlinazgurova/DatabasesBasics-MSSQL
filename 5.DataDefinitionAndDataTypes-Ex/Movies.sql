CREATE DATABASE Movies

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	GenreName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Title NVARCHAR(100) UNIQUE NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear DATE NOT NULL,
	[Length] INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Rating INT,
	Notes NVARCHAR(1000)
)

INSERT INTO Directors(DirectorName, Notes) VALUES 
('Allison Argo', 'born December 23, 1953'),
('Allison Argo', 'born December 23, 1953'),
('Theo Avgerinos', 'born September 22, 1978 in New York City'),
('Allison Argo', NULL),
('Irwin Allen', 'June 12, 1916 – November 2, 1991')

INSERT INTO Genres(GenreName, Notes) VALUES 
('Adventure', NULL),
('Comedy', 'funny movies'),
('Horroer', 'scary movies'),
('Family', NULL),
('History', NULL)

INSERT INTO Categories(CategoryName, Notes) VALUES 
('Serial', 'so much episodes'),
('Documentary', 'looooong movies'),
('Silent', NULL),
('Classic', NULL),
('Animated', 'for children')

INSERT INTO Movies(Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes) VALUES
('HORRORMOVIEE', 2, '2017-05-03', 125, 3, 3, 5.9, 'NOT SO GOOD'),
('COMEDYYYYMOVIEE', 3, '2018-02-09', 98, 2, 5, NULL, 'FUNNY'),
('FAMILYMOVIE', 5, '2015-08-08', 119, 4, 4, 6.9, NULL),
('HISTORYYYMOVIE', 3, '2017-07-07', 200, 5, 2, 4.8, 'LONG'),
('ADVENTUREEEE', 5, '2018-07-07', 129, 1, 1, NULL, NULL)