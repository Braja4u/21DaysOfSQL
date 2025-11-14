
-- Topics: DISTINCT, removing duplicates, unique values

-- ### Practice Questions:
-- 1. List all unique services in the patients table.
select DISTINCT service from patients;

-- 2. Find all unique staff roles in the hospital.
select DISTINCT role from staff;

-- 3. Get distinct months from the services_weekly table.
select DISTINCT month from services_weekly;



-- ### Daily Challenge:

-- Find all unique combinations of service and event type from the services_weekly table 
-- where events are not null or none, along with the count of occurrences for each combination. 
-- Order by count descending.

select * from services_weekly;
select distinct service, event, count(*) as count_of_occurrences
from services_weekly
where event IS NOT null AND event != 'none' 
group by service, event
order by count_of_occurrences desc;




