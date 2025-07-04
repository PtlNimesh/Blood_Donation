CREATE DATABASE IF NOT EXISTS bloodbank;
USE bloodbank;

CREATE TABLE donor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    bloodGroup VARCHAR(5)
);

CREATE TABLE blood_request (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    bloodGroup VARCHAR(5),
    location VARCHAR(255)
);
SELECT * FROM blood_request;
delete from blood_request where id=1;

CREATE TABLE donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    donor_name varchar(255),
    donation_date DATE NOT NULL,
    blood_group VARCHAR(10) NOT NULL,
    location varchar(255),
    FOREIGN KEY (donor_id) REFERENCES donor(id)
);

select * from donations;
drop table donations;
CREATE TABLE officer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    camp_name VARCHAR(100)
);

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Optional: Insert a sample admin
INSERT INTO admin (username, password) VALUES ('admin', 'admin123');


INSERT INTO officer (name, email, password, camp_name)
VALUES ('Dr. Nimesh Patel', 'officer1@bloodbank.com', '12345', 'Ahmedabad Camp');
delete from officer where email='officer1@bloodbank.com';

DELETE FROM donations WHERE donor_id=5;


    INSERT 
SELECT * FROM donations;
SELECT * FROM donor;
SELECT * FROM blood_request;

SELECT blood_group, SUM(units) AS total_units
FROM donations
GROUP BY blood_group;


CREATE TABLE donation_center (
  id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE blood_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  blood_type VARCHAR(5) NOT NULL,
  units INT NOT NULL,
  center_id VARCHAR(10),
  stock_level VARCHAR(10),
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (center_id) REFERENCES donation_center(id)
);



-- NEW

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'donor', 'hospital') NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    status ENUM('active', 'inactive') DEFAULT 'active'
);

CREATE TABLE donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    age INT,
    gender ENUM('male', 'female', 'other'),
    blood_group VARCHAR(5),
    last_donation_date DATE,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- HOSPITALS TABLE
CREATE TABLE hospitals (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hospital_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- BLOOD STOCK
CREATE TABLE blood_stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    blood_group VARCHAR(5),
    quantity_available INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BLOOD DONATION RECORDS
CREATE TABLE donation_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT,
    blood_group VARCHAR(5),
    quantity INT,
    donation_date DATE,
    verified_by_admin BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (donor_id) REFERENCES donors(donor_id)
);

-- BLOOD REQUESTS
CREATE TABLE blood_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_id INT,
    blood_group VARCHAR(5),
    quantity INT,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    request_date DATE,
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

