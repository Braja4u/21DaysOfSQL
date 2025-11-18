
-- Topics: LEFT JOIN, RIGHT JOIN, including unmatched records

-- ### Practice Questions:
----- 1. Show all staff members and their schedule information (including those with no schedule entries).
select * from staff;
select * from staff_schedule;
select a.staff_id,a.staff_name,a.role,a.service
from staff a 
LEFT JOIN staff_schedule b 
ON a.staff_id = b.staff_id;

----- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT a.week, a.month, a.service, s.staff_id, s.staff_name
FROM services_weekly a
LEFT JOIN staff s ON a.service = s.service;

----- 3. Display all patients and their service's weekly statistics (if available).
SELECT p.*, sw.*
FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service; 

-- ### Daily Challenge:
-- Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) 
-- and the count of weeks they were present (from staff_schedule). Include staff members 
-- even if they have no schedule records. Order by weeks present descending.

SELECT s.staff_id, s.staff_name, s.role, s.service, 
SUM(COALESCE(p.present, 0)) AS weeks_present
FROM staff AS s
LEFT JOIN staff_schedule AS p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY weeks_present DESC;




