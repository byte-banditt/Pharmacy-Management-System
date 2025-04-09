-- constraints.sql for NOVA Pharmacy Database Project
-- Adds constraints to the tables created in tables.sql
-- RUN THIS SCRIPT AFTER tables.sql

-- Add foreign key for Patient.primary_doctor_ID to Doctor.AadharID
ALTER TABLE Patient
    ADD CONSTRAINT fk_patient_doctor
    FOREIGN KEY (primary_doctor_ID) REFERENCES Doctor(AadharID)
    ON DELETE SET NULL;

-- Add unique constraint for Pharmaceutical_Company.Name (already PK, but explicit for clarity)
ALTER TABLE Pharmaceutical_Company
    ADD CONSTRAINT uk_pharma_company_name UNIQUE (Name);

-- Add foreign key for Drug.Company_Name to Pharmaceutical_Company.Name with cascading delete
ALTER TABLE Drug
    ADD CONSTRAINT fk_drug_company
    FOREIGN KEY (Company_Name) REFERENCES Pharmaceutical_Company(Name)
    ON DELETE CASCADE;

-- Add foreign key for Prescription.DoctorID to Doctor.AadharID
ALTER TABLE Prescription
    ADD CONSTRAINT fk_prescription_doctor
    FOREIGN KEY (DoctorID) REFERENCES Doctor(AadharID)
    ON DELETE SET NULL;

-- Add foreign key for Prescription.PatientID to Patient.AadharID
ALTER TABLE Prescription
    ADD CONSTRAINT fk_prescription_patient
    FOREIGN KEY (PatientID) REFERENCES Patient(AadharID)
    ON DELETE SET NULL;

-- Add foreign key for Prescription_Drug.PrescriptionID to Prescription.PrescriptionID
ALTER TABLE Prescription_Drug
    ADD CONSTRAINT fk_prescription_drug_prescription
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
    ON DELETE CASCADE;

-- Add foreign key for Prescription_Drug.(Trade_Name, Company_Name) to Drug.(Trade_Name, Company_Name)
ALTER TABLE Prescription_Drug
    ADD CONSTRAINT fk_prescription_drug_drug
    FOREIGN KEY (Trade_Name, Company_Name) REFERENCES Drug(Trade_Name, Company_Name)
    ON DELETE CASCADE;

-- Add foreign key for Drug_Sale.PharmacyID to Pharmacy.PharmacyID
ALTER TABLE Drug_Sale
    ADD CONSTRAINT fk_drug_sale_pharmacy
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID)
    ON DELETE CASCADE;

-- Add foreign key for Drug_Sale.(Trade_Name, Company_Name) to Drug.(Trade_Name, Company_Name)
ALTER TABLE Drug_Sale
    ADD CONSTRAINT fk_drug_sale_drug
    FOREIGN KEY (Trade_Name, Company_Name) REFERENCES Drug(Trade_Name, Company_Name)
    ON DELETE CASCADE;

-- Add foreign key for Contract.Company_Name to Pharmaceutical_Company.Name
ALTER TABLE Contract
    ADD CONSTRAINT fk_contract_company
    FOREIGN KEY (Company_Name) REFERENCES Pharmaceutical_Company(Name)
    ON DELETE CASCADE;

-- Add foreign key for Contract.PharmacyID to Pharmacy.PharmacyID
ALTER TABLE Contract
    ADD CONSTRAINT fk_contract_pharmacy
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID)
    ON DELETE CASCADE;

-- Enforce latest prescription rule (unique constraint on DoctorID, PatientID, Date)
-- Note: This assumes only the latest date is inserted; a trigger is recommended for full enforcement
ALTER TABLE Prescription
    ADD CONSTRAINT uk_latest_prescription
    UNIQUE (DoctorID, PatientID, Date);

