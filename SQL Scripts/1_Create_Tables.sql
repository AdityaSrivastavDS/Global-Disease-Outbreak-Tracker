-- Create the main database
CREATE DATABASE GlobalDiseaseOutbreakTracker;
USE GlobalDiseaseOutbreakTracker;

-- Table for storing disease details
CREATE TABLE Diseases (
    DiseaseID INT AUTO_INCREMENT PRIMARY KEY,
    DiseaseName VARCHAR(100) NOT NULL,
    Description TEXT,
    DateDiscovered DATE
);

-- Table for storing country details
CREATE TABLE Countries (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL
);

-- Table for tracking outbreaks
CREATE TABLE Outbreaks (
    OutbreakID INT AUTO_INCREMENT PRIMARY KEY,
    DiseaseID INT NOT NULL,
    CountryID INT NOT NULL,
    ReportDate DATE NOT NULL,
    Cases INT DEFAULT 0,
    Recoveries INT DEFAULT 0,
    Fatalities INT DEFAULT 0,
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID),
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);
