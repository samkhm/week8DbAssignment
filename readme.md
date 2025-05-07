# Clinic Booking System Database

## 📌 Overview
This project is a **Clinic Booking System** built entirely with **MySQL**. It models core operations of a medical clinic including patient registration, doctor scheduling, appointment booking, and prescription management.

## 🧱 Database Features
- **Relational schema** with multiple entities
- **Normalized structure** (3NF)
- Implements **1:1**, **1:M**, and **M:M** relationships
- Enforces data integrity through **PKs**, **FKs**, **NOT NULL**, and **UNIQUE** constraints

## 🗃️ Tables & Relationships

### 1. `Patients`
Stores patient personal details.

| Column         | Type        | Constraints         |
|----------------|-------------|---------------------|
| patient_id     | INT         | Primary Key, Auto-Increment |
| full_name      | VARCHAR(100)| NOT NULL            |
| date_of_birth  | DATE        |                     |
| gender         | ENUM        | ('Male', 'Female', 'Other') |
| phone_number   | VARCHAR(15) | UNIQUE              |
| email          | VARCHAR(100)| UNIQUE              |

---

### 2. `Doctors`
Stores doctor information and links to their specialization.

| Column         | Type        | Constraints         |
|----------------|-------------|---------------------|
| doctor_id      | INT         | Primary Key, Auto-Increment |
| full_name      | VARCHAR(100)| NOT NULL            |
| specialization_id | INT      | Foreign Key → `Specializations` |
| phone_number   | VARCHAR(15) | UNIQUE              |
| email          | VARCHAR(100)| UNIQUE              |

---

### 3. `Specializations`
Defines medical fields such as Pediatrics, Cardiology, etc.

| Column            | Type        | Constraints         |
|-------------------|-------------|---------------------|
| specialization_id | INT         | Primary Key, Auto-Increment |
| name              | VARCHAR(50) | NOT NULL, UNIQUE    |

---

### 4. `Appointments`
Records patient-doctor bookings.

| Column         | Type        | Constraints         |
|----------------|-------------|---------------------|
| appointment_id | INT         | Primary Key, Auto-Increment |
| patient_id     | INT         | Foreign Key → `Patients` |
| doctor_id      | INT         | Foreign Key → `Doctors` |
| appointment_date | DATETIME  | NOT NULL            |
| reason         | TEXT        |                     |
| status         | ENUM        | ('Scheduled', 'Completed', 'Cancelled') |

---

### 5. `Prescriptions`
Links prescriptions to specific appointments.

| Column          | Type        | Constraints         |
|------------------|-------------|---------------------|
| prescription_id  | INT         | Primary Key, Auto-Increment |
| appointment_id   | INT         | Foreign Key → `Appointments` |
| issue_date       | DATE        | NOT NULL            |
| notes            | TEXT        |                     |

---

### 6. `Medications`
Stores details of prescribed medicines.

| Column          | Type        | Constraints         |
|------------------|-------------|---------------------|
| medication_id    | INT         | Primary Key, Auto-Increment |
| name             | VARCHAR(100)| NOT NULL, UNIQUE    |
| description      | TEXT        |                     |

---

### 7. `Prescription_Medications`
Join table for **many-to-many** relationship between `Prescriptions` and `Medications`.

| Column          | Type        | Constraints         |
|------------------|-------------|---------------------|
| prescription_id  | INT         | PK, FK → `Prescriptions` |
| medication_id    | INT         | PK, FK → `Medications` |
| dosage           | VARCHAR(50) |                     |
| frequency        | VARCHAR(50) |                     |

---

## 🔧 How to Use

1. Import the `.sql` file into your MySQL database:
   ```bash
   mysql -u your_username -p your_database < clinic_booking_system.sql
