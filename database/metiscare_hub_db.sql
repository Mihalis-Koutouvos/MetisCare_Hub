-- Creating MetisCare Hub database --
CREATE DATABASE metiscare;

-- Using the MetisCare Hub database --
USE metiscare;


-- Create users tables --
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    middleName VARCHAR(50),
    lastName VARCHAR(50),
    mobile VARCHAR(15),
    email VARCHAR(75),
    passwordHash VARCHAR(128) NOT NULL,
    country VARCHAR(75),
    town VARCHAR(75),
    state VARCHAR(50),
    registeredAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastLogin DATETIME,
    profile TEXT,
    username VARCHAR(30) UNIQUE,
    accountStatus BOOLEAN DEFAULT TRUE,
    departmentRole ENUM('Physician', 'Nurse', 'Patient', 'Admin'),
    INDEX idx_id (id),
    INDEX idx_mobile (mobile),
    INDEX idx_email (email)
);


-- Create physicians table --
CREATE TABLE physicians (
    physician_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    specialization VARCHAR(200),
    experienceInYears INT NOT NULL,
    medicalSchool VARCHAR(200) NOT NULL,
    licenseState VARCHAR(200) NOT NULL,
    licenseNumber VARCHAR(100) NOT NULL UNIQUE,
    hospitalNetwork TEXT,
    workSchedule TEXT,
    workType ENUM('Full-time', 'Part-time', 'Contract'),
    onCall BOOLEAN DEFAULT FALSE,
    startDate DATETIME NOT NULL,
    endDate DATETIME DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    INDEX idx_id (physician_id),
    INDEX idx_specialization (specialization),
    INDEX idx_licenseNumber (licenseNumber),
    INDEX idx_workType (workType)
);


-- Create patients table --
-- Possibly may need to change this to a non-user entity
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    primaryPhysician_id INT,
    DOB DATE,
    medicalHistory TEXT,
    bloodType ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
    currentMedications TEXT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);


-- Create nurse supervisors table --
CREATE TABLE nursing_supervisors (
    nursingSupervisors_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nursingLicense VARCHAR(100) NOT NULL UNIQUE,
    departmentWing VARCHAR(200),
    workSchedule TEXT,
    atWork BOOLEAN DEFAULT FALSE,
    startDate DATETIME NOT NULL,
    endDate DATETIME DEFAULT NULL,
    reportTo INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    INDEX idx_nursingLicense (nursingLicense)
);


-- Create nurses table --
CREATE TABLE nurses (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nursingLicense VARCHAR(100) NOT NULL UNIQUE,
    departmentWing VARCHAR(200),
    workSchedule TEXT,
    atWork BOOLEAN DEFAULT FALSE,
    startDate DATETIME NOT NULL,
    endDate DATETIME DEFAULT NULL,
    reportTo INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (reportTo) REFERENCES nursing_supervisors (nursingSupervisors_id),
    INDEX idx_nursingLicense (nursingLicense)
);

-- Create admins table --
CREATE TABLE admins (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role VARCHAR(200) NOT NULL,
    departmentBranch VARCHAR(200),
    permissionList TEXT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    INDEX idx_role (role)
);


-- Create departments table --
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,

);




-- Create rooms table --
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    roomNumber VARCHAR(10) NOT NULL UNIQUE,
    buildingName VARCHAR(150) NOT NULL,
    floor INT NOT NULL,
    department VARCHAR(200),
    roomType ENUM('Private', 'Semi-Private', 'ICU', 'ER', 'Operating', 'Maternity', 'Recovery', 'Isolation',
        'Pediatric', 'Observation', 'SDU', 'General Ward', 'Psychiatric', 'Rehabilitation'),
    roomCapacity INT DEFAULT 0,
    availability ENUM('Open', 'Almost-Full', 'Full', 'Under Repair') DEFAULT 'Open'
);


-- Create a billings table --
CREATE TABLE billings (
    billing_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    credit_card,



    FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);


-- Create a schedules table --
CREATE TABLE schedules (

);



-- Create private_room table --
CREATE TABLE private_rooms (

);


-- Create semi_private_rooms table --
CREATE TABLE semi_private_rooms (

);

-- Create intensive_care_unit_rooms table  --
CREATE TABLE intensive_care_unit_rooms (

);

-- Create emergency_room_rooms table __
CREATE TABLE emergency_room_rooms (

);

-- Create operating_rooms table --
CREATE TABLE operating_rooms (

);

-- Create maternity_rooms table --
CREATE TABLE maternity_rooms (

);

-- Create recovery_rooms table --
CREATE TABLE recovery_rooms (

);

-- Create isolation_rooms table --
CREATE TABLE isolation_rooms (

);

-- Create pediatric_rooms table --
CREATE TABLE pediatric_rooms (

);

-- Create observation_rooms table --
CREATE TABLE observation_rooms (

);

-- Create step_down_unit_rooms table --
CREATE TABLE step_down_unit_rooms (

);

-- Create general_ward_rooms table --
CREATE TABLE general_ward_rooms (

);

-- Create psychiatric_rooms table --
CREATE TABLE psychiatric_rooms (

);

-- Create rehabilitation_rooms table --
CREATE TABLE rehabilitation_rooms (

);

