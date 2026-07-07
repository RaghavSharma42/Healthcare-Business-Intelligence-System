USE healthcare_bi;

-- Q. How many doctors work in each specialization?
SELECT specialization,
       COUNT(*) AS total_doctors
FROM doctors
GROUP BY specialization;

-- Q.How many appointments were completed, cancelled, and marked as no-show?
SELECT status,
       COUNT(*) AS appoitnment_status
FROM appointments
GROUP BY status;

-- Q.Which treatments generate the highest revenue?

SELECT treatment_name,
       SUM(cost) AS total_revenue
FROM treatments
GROUP BY treatment_name
ORDER BY total_revenue DESC;

-- Q.Which doctors have handled the most appointments?

SELECT
    doctors.first_name,
    doctors.last_name,
    COUNT(*) AS total_appointments
FROM appointments
JOIN doctors
ON appointments.doctor_id = doctors.doctor_id
GROUP BY
	patients.patient_id,
	doctors.first_name,
	doctors.last_name
ORDER BY total_appointments DESC;

-- Q.Which patients have visited the hospital the most?

SELECT 
	patients.first_name,
	patients.last_name,
	count(*) as total_visits
from appointments
join patients
on appointments.patient_id = patients.patient_id
group by
	patients.patient_id,
	patients.first_name,
	patients.last_name
order by total_visits desc;

-- Q.Which doctor generated the highest treatment revenue?

select 
	doctors.first_name,
    doctors.last_name,
    sum(cost) as revenue
from appointments
join doctors
on appointments.doctor_id = doctors.doctor_id
join treatments
on appointments.appointment_id = treatments.appointment_id
group by doctors.first_name,
    doctors.last_name,
    doctors.doctor_id
order by revenue desc limit 3;

-- Q.What is the average treatment cost for each treatment type?

select*from treatments;

select treatment_name , round(avg(cost),2) as average_cost
from treatments
group by treatment_name
order by average_cost desc;


	
	

