
-- Topics: DATE functions, date arithmetic, EXTRACT

-- ### Practice Questions:
-- 1. Extract the year from all patient arrival dates.
select * from patients;
select arrival_date, Year(arrival_date) as arrival_year from patients;
-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
select arrival_date, departure_date, datediff(departure_date,arrival_date) as total_days_stay
from patients;
-- 3. Find all patients who arrived in a specific month.
select arrival_date, month(arrival_date) as arrival_month
from patients;


-- ### Daily Challenge:
-- Calculate the average length of stay (in days) for each service, showing only services 
-- where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.
select * from patients; 
select service, round(avg(datediff(departure_date,arrival_date)),2) as avg_days_stay,
count(*) as num_patinets
from patients
group by service
having avg_days_stay > 7
order by avg_days_stay desc;







