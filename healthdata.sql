CREATE DATABASE HEALTH;
USE HEALTH;

select * from ocd_patient_dataset;

ALTER TABLE ocd_patient_dataset
RENAME COLUMN `Duration of Symptoms (months)` TO Duration_Of_Symptoms_Months;

ALTER TABLE ocd_patient_dataset
RENAME COLUMN `Y-BOCS Score (Obsessions)` TO Y_BOCS_Score_Obsessions;

ALTER TABLE ocd_patient_dataset
RENAME COLUMN `Y-BOCS Score (Compulsions)` TO Y_BOCS_Score_Compulsions;

ALTER TABLE ocd_patient_dataset
RENAME COLUMN `OCD Diagnosis Date` TO OCD_Diagnosis_Date;

-- Retrieve all patient details whose OCD diagnosis was made in 2022
SELECT * FROM ocd_patient_dataset WHERE OCD_Diagnosis_Date LIKE '2022%';

-- Find the average age of patients diagnosed with OCD.
SELECT AVG(Age) as Average_age FROM ocd_patient_dataset;

ALTER TABLE ocd_patient_dataset
RENAME COLUMN `Family History of OCD` TO Family_History_of_OCD;

-- Count the number of patients with a family history of OCD.
SELECT COUNT(*) as Familyocd FROM ocd_patient_dataset where Family_History_of_OCD='Yes';

-- Find the gender distribution of OCD patients.
SELECT Gender, COUNT(*) AS Count FROM ocd_patient_dataset GROUP BY Gender;


ALTER TABLE ocd_patient_dataset
RENAME COLUMN `Obsession Type` TO Obsession_Type;

-- Identify the most common obsession type.
SELECT Obsession_Type, COUNT(*) AS Count FROM ocd_patient_dataset
GROUP BY Obsession_Type 
ORDER BY Count 
DESC LIMIT 1;

-- Calculate the average duration of OCD symptoms.
SELECT AVG(Duration_of_Symptoms_months) AS Avg_Duration FROM ocd_patient_dataset;

-- Retrieve patients who have had OCD symptoms for more than 5 years.
SELECT * FROM ocd_patient_dataset WHERE Duration_of_Symptoms_months > 60;


-- Count the number of single patients with OCD.
SELECT COUNT(*) AS Single_Patients FROM ocd_patient_dataset WHERE `Marital Status` = 'Single';

-- List unique levels of education among OCD patients.
SELECT DISTINCT `Education Level` FROM ocd_patient_dataset;

-- Find patients who have obsessive thoughts about contamination.
SELECT * FROM ocd_patient_dataset WHERE `Obsession_Type` = 'Contamination';



