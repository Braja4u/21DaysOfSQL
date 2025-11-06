
--- ### Practice Questions:
--- 1. Display the first 5 patients from the patients table.
select * from patients
order by patient_id asc
LIMIT 5 ;

--- 2. Show patients 11-20 using OFFSET.
select * from patients
order by arrival_date asc
LIMIT 5 OFFSET 20;

--- 3. Get the 10 most recent patient admissions based on arrival_date.
select * from patients
order by arrival_date DESC
LIMIT 10;

-- ### Daily Challenge:
-- Find the 3rd to 7th highest patient satisfaction scores from the patients table, 
-- showing patient_id, name, service, and satisfaction. Display only these 5 records.
select patient_id, name, service, satisfaction
from patients
LIMIT 5 OFFSET 3;

