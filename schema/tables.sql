-- tables.sql for NOVA Pharmacy Database Project
-- Creates the base tables for the pharmacy system
-- Constraints to be added in constraints.sql
-- NOTE: Address is not broken into subparts

-- Patient Table
CREATE TABLE Patient (
    AadharID NUMBER(12) PRIMARY KEY,
    Name VARCHAR2(100) ,--NOT NULL,
    Address VARCHAR2(200) ,--NOT NULL,
    Age NUMBER(3) CHECK (Age >= 0 AND Age <= 150),
    primary_doctor_ID NUMBER
    -- Foreign key to Doctor added in constraints.sql
);

-- Doctor Table
CREATE TABLE Doctor (
    AadharID NUMBER(12) PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Specialty VARCHAR2(50) NOT NULL,
    Years_of_Experience NUMBER(3) CHECK (Years_of_Experience >= 0)
);

-- Pharmacy Table
CREATE TABLE Pharmacy (
    PharmacyID NUMBER PRIMARY KEY, -- changed
    Name VARCHAR2(100),
    Address VARCHAR2(200) NOT NULL,
    Phone VARCHAR2(10),
    CONSTRAINT unique_pharmacy UNIQUE (Name, Address) -- added
);

-- Pharmaceutical_Company Table
CREATE TABLE Pharmaceutical_Company (
    Name VARCHAR2(100) PRIMARY KEY,
    Phone VARCHAR2(10)
);

-- Drug Table
CREATE TABLE Drug (
    Trade_Name VARCHAR2(100),
    Company_Name VARCHAR2(100),
    --Formula VARCHAR2(200),
    PRIMARY KEY (Trade_Name, Company_Name)
);

-- Prescription Table
CREATE TABLE Prescription (
    PrescriptionID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DoctorID NUMBER(12),
    PatientID NUMBER(12),
    Date_of_pres DATE 
);

-- Prescription_Drug Table (for multiple drugs per prescription)
CREATE TABLE Prescription_Drug (
    PrescriptionID NUMBER,
    Trade_Name VARCHAR2(100),
    Company_Name VARCHAR2(100),
    Quantity NUMBER CHECK (Quantity > 0),
    PRIMARY KEY (PrescriptionID, Trade_Name, Company_Name)
    -- FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID),
    -- FOREIGN KEY (Trade_Name, Company_Name) REFERENCES Drug(Trade_Name, Company_Name)
);

-- Drug_Sale Table (for pharmacy-drug relationship with price)
CREATE TABLE Drug_Sale (
    PharmacyID NUMBER,
    Trade_Name VARCHAR2(100),
    Company_Name VARCHAR2(100),
    Price NUMBER(10,2) CHECK (Price >= 0),
    PRIMARY KEY (PharmacyID, Trade_Name, Company_Name)
);

-- Contract Table
CREATE TABLE Contract (
    Company_Name VARCHAR2(100),
    PharmacyID NUMBER,
    Start_Date DATE,
    End_Date DATE,
    Contract_Content VARCHAR2(4000),
    Supervisor VARCHAR2(100),
    PRIMARY KEY (Company_Name, PharmacyID, Start_Date)
);