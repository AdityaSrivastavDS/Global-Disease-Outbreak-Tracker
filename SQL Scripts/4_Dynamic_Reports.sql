-- Example call for weekly reports
CALL GenerateTrendReport('weekly');

-- Example call for monthly reports
CALL GenerateTrendReport('monthly');



-- Cases by Region
SELECT Region, SUM(Cases) AS TotalCases, SUM(Recoveries) AS TotalRecoveries, SUM(Fatalities) AS TotalFatalities
FROM Outbreaks
JOIN Countries ON Outbreaks.CountryID = Countries.CountryID
GROUP BY Region
ORDER BY TotalCases DESC;

-- Fatality Rate Per Disease
SELECT DiseaseName, 
       SUM(Fatalities) * 100.0 / SUM(Cases) AS FatalityRate
FROM Outbreaks
JOIN Diseases ON Outbreaks.DiseaseID = Diseases.DiseaseID
GROUP BY DiseaseName
ORDER BY FatalityRate DESC;