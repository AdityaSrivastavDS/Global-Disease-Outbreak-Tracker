-- Generate weekly or monthly trend reports dynamically
DELIMITER //

CREATE PROCEDURE GenerateTrendReport(IN intervalType VARCHAR(10))
BEGIN
    SET @query = CONCAT(
        'SELECT DiseaseName, CountryName, ',
        '       SUM(Cases) AS TotalCases, ',
        '       SUM(Recoveries) AS TotalRecoveries, ',
        '       SUM(Fatalities) AS TotalFatalities, ',
        '       DATE_FORMAT(ReportDate, "%Y-%m-%d") AS Period ',
        'FROM Outbreaks ',
        'JOIN Diseases ON Outbreaks.DiseaseID = Diseases.DiseaseID ',
        'JOIN Countries ON Outbreaks.CountryID = Countries.CountryID ',
        'GROUP BY DiseaseName, CountryName, ',
        CASE 
            WHEN intervalType = 'weekly' THEN 'WEEK(ReportDate)'
            ELSE 'MONTH(ReportDate)'
        END
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

