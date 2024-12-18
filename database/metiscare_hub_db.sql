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


-- Create hospital_departments table --
CREATE TABLE hospital_departments (
    hospitalDepartment_id INT AUTO_INCREMENT PRIMARY KEY,
    departmentHead_id INT, 
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (departmentHead_id) REFERENCES users (id)
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
    physician_id INT,
    room_id INT,
    notes TEXT,
    amountTotal DECIMAL(9, 2),
    creditCard VARCHAR(16),
    insuranceClaim BOOLEAN,
    status ENUM('Active', 'Closed', 'Refunded') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
    FOREIGN KEY (physician_id) REFERENCES physicians (physician_id)
    FOREIGN KEY (room_id) REFERENCES rooms (room_id)
);


-- Create a schedules table --
CREATE TABLE schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL, 
    scheduleType ENUM('Physician', 'Nurse Supervisor', 'Nurse'),
    scheduleDescription TEXT,
    location VARCHAR(200),
    additionalNotes VARCHAR(300),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES users (id)
);



-- Create private_room table --
CREATE TABLE private_rooms (
    id INT PRIMARY KEY,

);


-- Create semi_private_rooms table --
CREATE TABLE semi_private_rooms (
    id INT PRIMARY KEY,
);

-- Create intensive_care_unit_rooms table  --
CREATE TABLE intensive_care_unit_rooms (
    id INT PRIMARY KEY,
    besideMonitors BOOLEAN NOT NULL,
    centralMonitoringSystems BOOLEAN NOT NULL,
    icpMonitors BOOLEAN NOT NULL,
     defibrillator BOOLEAN NOT NULL,
    ultrasound BOOLEAN NOT NULL,
    ventillator BOOLEAN NOT NULL,
    ivFluid BOOLEAN NOT NULL,
    painRelievers BOOLEAN NOT NULL,
    sedatives BOOLEAN NOT NULL,
    emegencyDrugs BOOLEAN NOT NULL,
    testingKits BOOLEAN NOT NULL,
    XRay BOOLEAN NOT NULL,
    thermometers BOOLEAN NOT NULL,
    surgicalTools BOOLEAN NOT NULL,
    oxygenTanks BOOLEAN NOT NULL,
    sutureKits BOOLEAN NOT NULL,
    gloves BOOLEAN NOT NULL,
    gown BOOLEAN NOT NULL,
    mask BOOLEAN NOT NULL,
    needles BOOLEAN NOT NULL, 
    syringes BOOLEAN NOT NULL, 
    ivCatheters BOOLEAN NOT NULL,
    bvm BOOLEAN NOT NULL, 
    bandages BOOLEAN NOT NULL,
    alcoholSwabs BOOLEAN NOT NULL,
    packedBlood BOOLEAN NOT NULL,
    gauzePads BOOLEAN NOT NULL, 
    scissors BOOLEAN NOT NULL, 
    splints BOOLEAN NOT NULL, 
    feedingPumps BOOLEAN NOT NULL,
    overbedTables BOOLEAN NOT NULL,
    mobilityAids BOOLEAN NOT NULL,
    dialysisMachines BOOLEAN NOT NULL,
    FOREIGN KEY (id) REFERENCES rooms (id)
);

-- Create emergency_room_rooms table __
CREATE TABLE emergency_room_rooms (
    id INT PRIMARY KEY,
    defibrillator BOOLEAN NOT NULL,
    ultrasound BOOLEAN NOT NULL,
    ventillator BOOLEAN NOT NULL,
    ivFluid BOOLEAN NOT NULL,
    painRelievers BOOLEAN NOT NULL,
    sedatives BOOLEAN NOT NULL,
    emegencyDrugs BOOLEAN NOT NULL,
    testingKits BOOLEAN NOT NULL,
    XRay BOOLEAN NOT NULL,
    thermometers BOOLEAN NOT NULL,
    surgicalTools BOOLEAN NOT NULL,
    oxygenTanks BOOLEAN NOT NULL,
    sutureKits BOOLEAN NOT NULL,
    gloves BOOLEAN NOT NULL,
    gown BOOLEAN NOT NULL,
    mask BOOLEAN NOT NULL,
    needles BOOLEAN NOT NULL, 
    syringes BOOLEAN NOT NULL, 
    ivCatheters BOOLEAN NOT NULL,
    bvm BOOLEAN NOT NULL, 
    bandages BOOLEAN NOT NULL,
    alcoholSwabs BOOLEAN NOT NULL,
    packedBlood BOOLEAN NOT NULL,
    gauzePads BOOLEAN NOT NULL, 
    scissors BOOLEAN NOT NULL, 
    splints BOOLEAN NOT NULL, 
    FOREIGN KEY (id) REFERENCES rooms (id)
);

-- Create operating_rooms table --
CREATE TABLE operating_rooms (
    id INT PRIMARY KEY,
    defibrillator BOOLEAN NOT NULL,
    ultrasound BOOLEAN NOT NULL,
    ventillator BOOLEAN NOT NULL,
    ivFluid BOOLEAN NOT NULL,
    painRelievers BOOLEAN NOT NULL,
    sedatives BOOLEAN NOT NULL,
    emegencyDrugs BOOLEAN NOT NULL,
    testingKits BOOLEAN NOT NULL,
    XRay BOOLEAN NOT NULL,
    thermometers BOOLEAN NOT NULL,
    surgicalTools BOOLEAN NOT NULL,
    oxygenTanks BOOLEAN NOT NULL,
    sutureKits BOOLEAN NOT NULL,
    gloves BOOLEAN NOT NULL,
    gown BOOLEAN NOT NULL,
    mask BOOLEAN NOT NULL,
    needles BOOLEAN NOT NULL, 
    syringes BOOLEAN NOT NULL, 
    ivCatheters BOOLEAN NOT NULL,
    bvm BOOLEAN NOT NULL, 
    bandages BOOLEAN NOT NULL,
    alcoholSwabs BOOLEAN NOT NULL,
    packedBlood BOOLEAN NOT NULL,
    gauzePads BOOLEAN NOT NULL, 
    scissors BOOLEAN NOT NULL, 
    splints BOOLEAN NOT NULL, 
    scalpels BOOLEAN NOT NULL,
    forceps BOOLEAN NOT NULL,
    retractors BOOLEAN NOT NULL,
    boneSaws BOOLEAN NOT NULL,
    laparaoscopicSystems BOOLEAN NOT NULL,
    suctionDevices BOOLEAN NOT NULL,
    esu BOOLEAN NOT NULL,
    implants BOOLEAN NOT NULL,
    FOREIGN KEY (id) REFERENCES rooms (id)
);

-- Create maternity_rooms table --
CREATE TABLE maternity_rooms (
    id INT PRIMARY KEY,
);

-- Create recovery_rooms table --
CREATE TABLE recovery_rooms (
    id INT PRIMARY KEY,
);

-- Create isolation_rooms table --
CREATE TABLE isolation_rooms (
    id INT PRIMARY KEY,
);

-- Create pediatric_rooms table --
CREATE TABLE pediatric_rooms (
    id INT PRIMARY KEY,
);

-- Create observation_rooms table --
CREATE TABLE observation_rooms (
    id INT PRIMARY KEY,
);

-- Create step_down_unit_rooms table --
CREATE TABLE step_down_unit_rooms (
    id INT PRIMARY KEY,
);

-- Create general_ward_rooms table --
CREATE TABLE general_ward_rooms (
    id INT PRIMARY KEY,
);

-- Create psychiatric_rooms table --
CREATE TABLE psychiatric_rooms (
    id INT PRIMARY KEY,
);

-- Create rehabilitation_rooms table --
CREATE TABLE rehabilitation_rooms (
    id INT PRIMARY KEY,
);

