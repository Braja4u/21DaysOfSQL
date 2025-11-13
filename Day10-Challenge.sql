
-- Topics: CASE WHEN, conditional logic, derived columns

-- ### Practice Questions:
-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
select name, satisfaction,
CASE 
WHEN satisfaction > 70 THEN 'High'
WHEN satisfaction > 40 THEN 'Medium'
ELSE 'Low' 
END AS satisfaction_category
from patients ;
     
-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
select DISTINCT role from staff; -- doctor , nurse , nursing_assistant
select staff_id, staff_name, role, 
CASE 
WHEN role IN ('doctor', 'nurse') THEN 'Medical'
WHEN role = 'nursing_assistant' THEN 'Support' 
END AS staff_roles
from staff;

-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
select * from patients;
select *,
CASE 
WHEN age > 65 THEN 'A'
WHEN age BETWEEN 41 AND 65 THEN 'B'
WHEN age BETWEEN 19 AND 40 THEN 'C'
ELSE 'D'
END AS age_group
from patients;


-- ### Daily Challenge:
-- Create a service performance report showing service name, total patients admitted, and a performance category 
-- based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'.
-- Order by average satisfaction descending. 
select * from services_weekly;
select service, 
sum(patients_admitted) as total_patients_admitted, 
round(AVG(patient_satisfaction),2) as avg_patient_satisfaction,
CASE
WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
ELSE 'Needs Improvement' 
END AS performance_category
from services_weekly
group by service
order by AVG(patient_satisfaction) desc;


