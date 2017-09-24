SELECT TOP 50 [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start]
FROM Games
WHERE YEAR([Start]) IN (2011, 2012)
ORDER BY Games.Start, [Name]

SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - 1) AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username

SELECT Username, IpAddress AS [IP Address]
FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username

SELECT [Name], 'Part of the Day' = 
	CASE
		WHEN DATEPART(HOUR, [Start]) < 12 THEN 'Morning'
		WHEN DATEPART(HOUR, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END
, 'Duration' = 
	CASE
	 WHEN Duration <= 3 THEN 'Extra Short'
	 WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
	 WHEN Duration > 6 THEN 'Long'
	 ELSE 'Extra Long '	  
	END
FROM Games
ORDER BY [Name], [Duration]