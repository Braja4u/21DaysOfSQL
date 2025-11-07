
-- Topics: COUNT, SUM, AVG, MIN, MAX functions

-- ### Practice Questions:
-- 1. Count the total number of patients in the hospital.
select count(patient_id) as total_patient from patients;

-- 2. Calculate the average satisfaction score of all patients.
select AVG(satisfaction) as avg_satisfaction from patients;

-- 3. Find the minimum and maximum age of patients.
select MIN(age) as minimum_age, max(age) as maximum_age from patients;

-- ### Daily Challenge:
-- Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction 
-- across all services and weeks. 
-- Round the average satisfaction to 2 decimal places.
SELECT 
 SUM(patients_admitted) AS Total_patients_admitted,
 SUM(patients_refused) AS Total_patients_refused,
 ROUND(AVG(patient_satisfaction), 2) AS Avg_patient_satisfaction
FROM services_weekly; 

select * from patients; -- patient_id, name, age, arrival_date, departure_date, service, satisfaction
select * from services_weekly; -- week, month, service, available_beds, patients_request, 
-- patients_admitted, patients_refused, patient_satisfaction, staff_morale, event
select * from staff; -- staff_id, staff_name, role, service
select * from staff_schedule; -- week, staff_id, staff_name, role, service, present



