-- Topics: GROUP BY, aggregating by categories

-- ### Practice Questions:
-- 1. Count the number of patients by each service.
select service, count(*) as num_patients from patients
group by service;
-- 2. Calculate the average age of patients grouped by service.
select service, ROUND(avg(age),2) as avg_age from patients
group by service;
-- 3. Find the total number of staff members per role.
select role, count(*) as total_num_staff from staff
group by role;


-- ### Daily Challenge:

-- For each hospital service, calculate the total number of patients admitted, total patients refused, 
-- and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
select service, sum(patients_admitted) as total_patients_admitted, 
sum(patients_refused) as total_patients_refused, 
ROUND((sum(patients_admitted)/sum(patients_refused))*100,2) as admission_rate
from services_weekly
group by service
order by admission_rate desc;



