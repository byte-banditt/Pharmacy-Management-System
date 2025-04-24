-- Foreign key for Patient.primary_doctor_ID
ALTER TABLE Patient
    ADD CONSTRAINT patient_doctorid_fk 
    FOREIGN KEY (primary_doctor_ID) 
    REFERENCES Doctor(AadharID)
    ON DELETE SET NULL;

-- Foreign key for Drug.Company_Name
ALTER TABLE Drug
    ADD CONSTRAINT drug_company_fk 
    FOREIGN KEY (Company_Name) 
    REFERENCES Pharmaceutical_Company(Name)
    ON DELETE CASCADE;

-- Foreign keys for Prescription
ALTER TABLE Prescription
    ADD CONSTRAINT prescription_doctorid_fk 
    FOREIGN KEY (DoctorID) REFERENCES Doctor(AadharID)
    ON DELETE SET NULL; -- set to Cascade?
    -- no, prescription is for the patient. Record shouldn't be delted.

ALTER TABLE Prescription
    ADD CONSTRAINT prescription_patientid_fk 
    FOREIGN KEY (PatientID) REFERENCES Patient(AadharID)
    ON DELETE CASCADE;

-- Foreign keys for Prescription_Drug
ALTER TABLE Prescription_Drug
    ADD CONSTRAINT presdrug_presid_fk 
    FOREIGN KEY (PrescriptionID) 
    REFERENCES Prescription(PrescriptionID)
    ON DELETE CASCADE;

ALTER TABLE Prescription_Drug
    ADD CONSTRAINT presdrug_drug_fk 
    FOREIGN KEY (Trade_Name, Company_Name) 
    REFERENCES Drug(Trade_Name, Company_Name)
    ON DELETE CASCADE; 

-- Foreign keys for Drug_Sale
ALTER TABLE Drug_Sale
    ADD CONSTRAINT drugsale_pharmacy_fk 
    FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID)
    ON DELETE CASCADE;

ALTER TABLE Drug_Sale
    ADD CONSTRAINT drugsale_drug_fk 
    FOREIGN KEY (Trade_Name, Company_Name) 
    REFERENCES Drug(Trade_Name, Company_Name)
    ON DELETE CASCADE;

-- Foreign keys for Contract
ALTER TABLE Contract
    ADD CONSTRAINT contract_company_fk 
    FOREIGN KEY (Company_Name) 
    REFERENCES Pharmaceutical_Company(Name)
    ON DELETE CASCADE;

ALTER TABLE Contract
    ADD CONSTRAINT contract_pharmacy_fk 
    FOREIGN KEY (PharmacyID) 
    REFERENCES Pharmacy(PharmacyID)
    ON DELETE CASCADE;

-- Unique constraint for latest prescription
ALTER TABLE Prescription
    ADD CONSTRAINT pres_dr_pt_date_un 
    UNIQUE (DoctorID, PatientID, Date_of_pres);
