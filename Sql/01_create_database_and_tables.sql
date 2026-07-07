-- =====================================================
-- Healthcare Business Intelligence System
-- =====================================================

-- STEP 1 : Create Database
USE healthcare_bi;

-- STEP 2 : Create Patients Table

CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(30),
    email VARCHAR(100)
);

-- =====================================================
-- STEP 3 : Create Doctors Table
-- =====================================================AR(100)
CREATE TABLE doctors (
    doctor_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone_number VARCHAR(15),
    years_experience INT,
    hospital_branch VARCHAR(100),
    email VARCHAR(100)
);

-- STEP 4 : Create Appointments Table

CREATE TABLE appointments (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    doctor_id VARCHAR(10),
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(100),
    status VARCHAR(30),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- STEP 5 : Create Treatments Table

CREATE TABLE treatments (
    treatment_id VARCHAR(10) PRIMARY KEY,
    appointment_id VARCHAR(10),
    treatment_name VARCHAR(100),
    description TEXT,
    cost DECIMAL(10,2),
    treatment_date DATE,

    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- STEP 6 : Create Billing Table

CREATE TABLE billing (
	bill_id varchar(10) primary KEY,
    patient_id varchar(10),
    treatment_id varchar(10),
    bill_date DATE,
    amount decimal(10,2),
    payment_method VARCHAR(50),
	payment_status VARCHAR(20),

	FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
	FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

