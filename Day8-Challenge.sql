
-- Topics: UPPER, LOWER, LENGTH, CONCAT, SUBSTRING

### Practice Questions:
-- 1. Convert all patient names to uppercase.
select * from patients;
select name, upper(name) as CapsLk_Name from patients;

-- 2. Find the length of each staff member's name.
select * from staff;
select staff_name, LENGTH(staff_name) as Name_Length from staff;

-- 3. Concatenate staff_id and staff_name with a hyphen separator.
select * from staff;
select concat(staff_id,' - ',staff_name) as concat_id from staff;


### Daily Challenge:
-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, 
-- age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. 
-- Only show patients whose name length is greater than 10 characters.

select * from patients;
select patient_id, upper(name) as name_in_uppercase, length(name) as name_length, lower(service) as service_in_lowercase,
CASE
WHEN age >= 65 THEN 'Senior'
WHEN age >= 18 THEN 'Adult'
ELSE 'Minor' 
END 
AS Category, age
from patients
where LENGTH(name) > 10 ;









