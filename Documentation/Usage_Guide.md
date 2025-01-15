
---

# Usage Guide

This guide provides step-by-step instructions for setting up and using the **Global Disease Outbreak Tracker**.

---

## **1. Setup**

### **1.1 Import SQL Scripts**
1. Open MySQL Workbench or a terminal connected to your database server.
2. Execute the following scripts in order:
   - `1_Create_Tables.sql`: Creates the database and table structure.
   - `2_Insert_Sample_Data.sql`: Inserts initial sample data.
   - `3_Stored_Procedures.sql`: Defines the stored procedure for dynamic reports.
   - `4_Dynamic_Reports.sql`: Includes examples of calling dynamic reports.

---

## **2. Adding Data**

### **2.1 Add a New Disease**
Insert a new disease into the `Diseases` table:
```bash
INSERT INTO Diseases (DiseaseName, Description, DateDiscovered)
VALUES ('New Disease', 'Description of the disease', 'YYYY-MM-DD');
```


### 2.2 **Add a New Country**
Insert a new country into the Countries table:

```bash
INSERT INTO Countries (CountryName, Region)
VALUES ('New Country', 'New Region');
```

### **2.3 Add a New Outbreak**
Insert outbreak data into the Outbreaks table:

```bash
INSERT INTO Outbreaks (DiseaseID, CountryID, ReportDate, Cases, Recoveries, Fatalities)
VALUES (1, 1, '2025-01-15', 50, 45, 5);
```

## **3. Generating Reports**

### **3.1 Weekly Report**
Generate a report summarizing weekly outbreak trends:

```bash
CALL GenerateTrendReport('weekly');
```

### **3.2 Monthly Report**
Generate a report summarizing monthly outbreak trends:

```bash
CALL GenerateTrendReport('monthly');
```

## **4. Analytical Queries**
### 4.1 **Analyze Regional Trends**
Get a summary of cases, recoveries, and fatalities by region:

```bash
SELECT Region, SUM(Cases) AS TotalCases, SUM(Recoveries) AS TotalRecoveries, SUM(Fatalities) AS TotalFatalities
FROM Outbreaks
JOIN Countries ON Outbreaks.CountryID = Countries.CountryID
GROUP BY Region
ORDER BY TotalCases DESC;
```

### **4.2 Calculate Fatality Rates**
Find the fatality rate for each disease:

```bash
SELECT DiseaseName, SUM(Fatalities) * 100.0 / SUM(Cases) AS FatalityRate
FROM Outbreaks
JOIN Diseases ON Outbreaks.DiseaseID = Diseases.DiseaseID
GROUP BY DiseaseName;
```

## **5. FAQs**

### **5.1 How do I update data for an existing outbreak?**
Use the UPDATE query:

```bash
UPDATE Outbreaks
SET Cases = 1000, Recoveries = 950, Fatalities = 50
WHERE OutbreakID = 1;
```

### **5.2 How do I delete outdated outbreak data?**
Use the DELETE query:

```bash
DELETE FROM Outbreaks
WHERE ReportDate < '2024-01-01';
```

## 6. Best Practices
- Regularly back up the database to avoid data loss.
- Use indexes on frequently queried columns like DiseaseID and CountryID for better performance.
- Test stored procedures with various intervals to ensure accuracy.


