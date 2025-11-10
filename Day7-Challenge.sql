
-- Topics: HAVING clause, filtering aggregated results

### Practice Questions:
-- 1. Find services that have admitted more than 500 patients in total.
select service, sum(patients_admitted) as patients_count from services_weekly
group by service 
having patients_count > 500 ; 
-- 2. Show services where average patient satisfaction is below 75.
select service, avg(patient_satisfaction) as avg_patients_satisfaction from services_weekly
group by service 
having avg(patient_satisfaction) < 75 ; 
-- 3. List weeks where total staff presence across all services was less than 50.
select week, sum(present) as total_staff_present from staff_schedule
group by week 
having total_staff_present < 50 ; 


-- ### Daily Challenge:
-- Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. 
-- Show service name, total refused, and average satisfaction.
SELECT service, ROUND(SUM(patients_refused),2) AS total_patients_refused, 
ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING total_patients_refused > 100 AND avg_patient_satisfaction < 80;








