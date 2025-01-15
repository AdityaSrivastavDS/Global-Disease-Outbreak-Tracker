# Dynamic Report Examples

This document provides examples of how to generate dynamic reports using the stored procedure `GenerateTrendReport` and analyze outbreak data effectively.

---

## **1. Weekly Trend Report**
Generate a weekly report of total cases, recoveries, and fatalities for each disease and country:
```bash
CALL GenerateTrendReport('weekly');
```

2. **Monthly Trend Report**
Generate a monthly report for the same metrics:

```bash
CALL GenerateTrendReport('monthly');
```

3. **Total Cases by Region**
Analyze total cases, recoveries, and fatalities by region:

```bash
SELECT Region, SUM(Cases) AS TotalCases, SUM(Recoveries) AS TotalRecoveries, SUM(Fatalities) AS TotalFatalities
FROM Outbreaks
JOIN Countries ON Outbreaks.CountryID = Countries.CountryID
GROUP BY Region
ORDER BY TotalCases DESC;
```

4. **Fatality Rate by Disease**
Calculate the fatality rate for each disease:

```bash
SELECT DiseaseName, SUM(Fatalities) * 100.0 / SUM(Cases) AS FatalityRate
FROM Outbreaks
JOIN Diseases ON Outbreaks.DiseaseID = Diseases.DiseaseID
GROUP BY DiseaseName
ORDER BY FatalityRate DESC;
```

