use healthcare_bi;

-- Q.Show all treatments whose cost is higher than the average treatment cost

SELECT treatment_name,
       cost
FROM treatments
WHERE cost >
(
    SELECT AVG(cost)
    FROM treatments
);

-- Q.Find all treatments that cost more than the average treatment cost using a CTE instead of a subquery

with avg_cost as
(	select avg(cost) as average_cost
	from treatments)

select treatment_name , cost 
from treatments
where cost >
(	select average_cost
    from avg_cost);
    
-- Q.Rank doctors by total appointments using ROW_NUMBER()

SELECT
    doctors.doctor_id,
    doctors.first_name,
    doctors.last_name,
    COUNT(*) AS total_appointments,
    ROW_NUMBER() OVER (
        ORDER BY COUNT(*) DESC
    ) AS row_num
FROM appointments
JOIN doctors
ON appointments.doctor_id = doctors.doctor_id
GROUP BY
    doctors.doctor_id,
    doctors.first_name,
    doctors.last_name;
    
-- row_number gives unique row number even if the value is same , rank gives the same rank if value is same like total appointments are 20 for two then 
-- third one will get rank 3 and dense_rank the third one will get 2.





