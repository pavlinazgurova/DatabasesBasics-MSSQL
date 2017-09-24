SELECT CountryName, IsoCode AS [ISO Code]
FROM Countries
WHERE LOWER(CountryName) LIKE '%a%a%a%'
ORDER BY [ISO Code]

SELECT PeakName, RiverName,
LOWER(CONCAT(PeakName, SUBSTRING(RiverName, 2, 200) )) AS [Mix]
FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY [Mix]