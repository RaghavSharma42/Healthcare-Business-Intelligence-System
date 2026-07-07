USE healthcare_bi;

-- Q.Show all patients who have insurance from WellnessCorp

select first_name , last_name 
from patients 
where insurance_provider = 'WellnessCorp';

-- Q.Show all patients who registered after 1st January 2022

select first_name , last_name 
from patients
where registration_date > '2022-01-01';

-- Q.Show all patients who are insured by WellnessCorp and registered after 1st January 2022

select first_name , last_name 
from patients
where registration_date > '2022-01-01'
AND insurance_provider = 'WellnessCorp';

-- Q.Show all appointments that are either Cancelled OR No-show

select appointment_id , status 
from appointments
where status ='Cancelled' 
or status = 'No-show';

-- Q.Show all patients whose insurance provider is either WellnessCorp or PulseSecure

select first_name , last_name 
from patients 
where insurance_provider in ('WellnessCorp' , 'PulseSecure');

-- Q. Show all patients whose first name have 'A' as the first letter and 'ex' as third and fourth

select first_name , last_name 
from patients 
where first_name like 'A_ex';

-- Q. Show only those insurance providers that have more than 10 patients

select * from patients ;

select insurance_provider,
	count(*) as Provided_insurance_to_more_than_10
from patients
group by  insurance_provider
having count(*)>10;

-- Q.Show the number of bills in each category (High, Medium, Low)

select
case 
	when amount >= 4000 then 'high cost'
    when amount >= 2000 then 'medium cost'
    else 'low cost'
end as cost_category,
count(*) as total_bills
from billing 
group by cost_category
order by total_bills desc;




    



