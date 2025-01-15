USE GlobalDiseaseOutbreakTracker;

-- Insert diseases
INSERT INTO Diseases (DiseaseName, Description, DateDiscovered)
VALUES
('COVID-19', 'Respiratory illness caused by SARS-CoV-2.', '2019-12-01'),
('Ebola', 'Severe hemorrhagic fever caused by the Ebola virus.', '1976-09-01'),
('Malaria', 'Mosquito-borne infectious disease caused by Plasmodium parasites.', '1880-01-01');

-- Insert countries
INSERT INTO Countries (CountryName, Region)
VALUES
('USA', 'North America'),
('India', 'Asia'),
('Brazil', 'South America'),
('South Africa', 'Africa');

-- Insert outbreak data
INSERT INTO Outbreaks (DiseaseID, CountryID, ReportDate, Cases, Recoveries, Fatalities)
VALUES
(1, 1, '2025-01-01', 100000, 95000, 500),
(1, 2, '2025-01-01', 200000, 180000, 1000),
(2, 4, '2025-01-01', 5000, 3000, 1000),
(3, 3, '2025-01-01', 15000, 14000, 200);
