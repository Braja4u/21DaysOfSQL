
-- Topics: INNER JOIN, joining two tables, relationship understanding

-- ## Practice Questions:
-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
select p.name, p.service, s.staff_name 
from patients p 
JOIN staff s 
ON p.service = s.service; 
select * from staff;
-- 2. Join services_weekly with staff to show weekly service data with staff information.
select * from services_weekly;
select a.week, a.service, b.staff_id, b.staff_name, b.role
from services_weekly a 
JOIN staff b
ON a.service = b.service;
-- 3. Create a report showing patient information along with staff assigned to their service.
select * from patients; -- patient_id, name, age, arrival_date, departure_date, service, satisfaction
select * from staff; -- staff_id, staff_name, role, service 

select a.patient_id, a.name, a.service, b.staff_id, b.staff_name, b.role
from patients a 
JOIN staff b 
ON a.service = b.service;


-- ### Daily Challenge:
-- Create a comprehensive report showing patient_id, patient name, age, service, 
-- and the total number of staff members available in their service. 
-- Only include patients from services that have more than 5 staff members. 
-- Order by number of staff descending, then by patient name.

SELECT p.patient_id, p.name, p.age, p.service, COUNT(s.staff_id) AS total_staff
FROM patients AS p
JOIN staff AS s ON p.service=s.service
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING total_staff > 5
ORDER BY total_staff DESC, name ;





