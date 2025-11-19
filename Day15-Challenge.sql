
-- Topics: Joining more than two tables, complex relationships
select * from patients;       -- patient_id, name, age, arrival_date, departure_date, service, satisfaction
select * from staff;          -- staff_id, staff_name, role, service 
select * from staff_schedule; -- week, staff_id, staff_name, role, service, present 

-- ### Practice Questions:
-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT p.patient_id, p.name AS patient_name, p.service, s.staff_id, s.staff_name, ss.week, ss.present
  FROM patients p
  LEFT JOIN staff s ON p.service = s.service
  LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id;

-- 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT sw.week, sw.service, sw.patients_admitted, sw.patients_refused, s.staff_id, s.staff_name, ss.week AS schedule_week, ss.present
  FROM services_weekly sw
  LEFT JOIN staff s ON sw.service = s.service
  LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id;

-- 3. Create a multi-table report showing patient admissions with staff information.
SELECT p.patient_id, p.name AS patient_name, p.service, sw.patients_admitted, s.staff_id, s.staff_name
  FROM patients p
  LEFT JOIN services_weekly sw ON p.service = sw.service
  LEFT JOIN staff s ON p.service = s.service;

-- ### Daily Challenge

-- Create a comprehensive service analysis report for week 20 showing: service name, total patients 
-- admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, 
-- and count of staff present that week. Order by patients admitted descending.
-- Comprehensive service analysis for Week 20 

SELECT sw.service, SUM(sw.patients_admitted) AS total_admitted, SUM(sw.patients_refused) AS total_refused,
  ROUND(AVG(sw.patient_satisfaction), 2) AS avg_satisfaction,
  COUNT(DISTINCT s.staff_id) AS total_staff,
  SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
  FROM services_weekly sw
  LEFT JOIN staff s ON sw.service = s.service
  LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id AND ss.week = sw.week
  WHERE sw.week = 20 GROUP BY sw.service ORDER BY total_admitted DESC;
  
