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