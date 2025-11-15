
-- Topics: NULL handling, IS NULL, IS NOT NULL, COALESCE

## Practice Questions:
-- 1. Find all weeks in services_weekly where no special event occurred.
select distinct event from services_weekly;
select week, service, event from services_weekly
where event IS NULL OR event = 'none';

-- 2. Count how many records have null or empty event values.
select count(*) as empty_event
from services_weekly
where event IS NULL OR event = 'none';

-- 3. List all services that had at least one week with a special event.
select week, month, service, event
from services_weekly
where event IS NOT NULL OR event <> 'none';


-- ## Daily Challenge:
-- Analyze the event impact by comparing weeks with events vs weeks without events. 
-- Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
-- and average staff morale. Order by average patient satisfaction descending.
SELECT
CASE
WHEN event IS NOT NULL AND LOWER(event) <> 'none' THEN 'With Event'
ELSE 'No Event'
END AS event_status,
COUNT(DISTINCT week) AS week_count,
ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction,
ROUND(AVG(staff_morale),2) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;








