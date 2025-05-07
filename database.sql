-- 1. Question

-- Clinic Booking System Database Schema

-- Table: Patients
CREATE TABLE Patients (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
gender ENUM('Male', 'Female', 'Other'),
phone_number VARCHAR(15) UNIQUE,
email VARCHAR(100) UNIQUE
);

-- Table: Doctors
CREATE TABLE Doctors (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
specialization_id INT,
phone_number VARCHAR(15) UNIQUE,
email VARCHAR(100) UNIQUE
);

-- Table: Specializations
CREATE TABLE Specializations (
specialization_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
);
-- Table: Doctor_Specialization (Many-to-Many)
-- This table links doctors to their specializations
CREATE TABLE Doctor_Specialization (
doctor_id INT NOT NULL,
specialization_id INT NOT NULL,
PRIMARY KEY (doctor_id, specialization_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id)
);

-- Table: Appointments
CREATE TABLE Appointments (
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT NOT NULL,
doctor_id INT NOT NULL,
appointment_date DATETIME NOT NULL,
reason TEXT,
status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Table: Prescriptions
CREATE TABLE Prescriptions (
prescription_id INT AUTO_INCREMENT PRIMARY KEY,
appointment_id INT NOT NULL,
issue_date DATE NOT NULL,
notes TEXT,
FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Table: Medications
CREATE TABLE Medications (
medication_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
description TEXT
);

-- Table: Prescription_Medications (Many-to-Many)
CREATE TABLE Prescription_Medications (
prescription_id INT,
medication_id INT,
dosage VARCHAR(50),
frequency VARCHAR(50),
PRIMARY KEY (prescription_id, medication_id),
FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);
