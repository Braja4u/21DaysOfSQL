
create database sqlchallenge;
use sqlchallenge;

-- ### Practice Questions:
-- 1. Retrieve all columns from the `patients` table.
select * from patients;

-- 2. Select only the `patient_id`, `name`, and `age` columns from the `patients` table.
select patient_id, name, age from patients;

-- 3. Display the first 10 records from the `services_weekly` table.
select * from services_weekly order by week ASC LIMIT 10;

-- ### Daily Challenge:
-- Introduction to SQL & SELECT Statement
-- List all unique hospital services available in the hospital.
SELECT DISTINCT service
FROM services_weekly;


