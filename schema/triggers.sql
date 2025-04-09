-- triggers.sql for NOVA Pharmacy Database Project
-- Defines triggers to enforce business rules
-- RUN THIS SCRIPT tables.sql and constraints.sql

-- Trigger to enforce the latest prescription rule
-- Ensures only the latest prescription per doctor-patient pair is retained
CREATE OR REPLACE TRIGGER trg_latest_prescription
BEFORE INSERT OR UPDATE ON Prescription
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- Check for existing prescriptions for the same doctor and patient
    SELECT COUNT(*)
    INTO v_count
    FROM Prescription
    WHERE DoctorID = :NEW.DoctorID
    AND PatientID = :NEW.PatientID
    AND Date < :NEW.Date;

    -- If older prescriptions exist, delete them
    IF v_count > 0 THEN
        DELETE FROM Prescription
        WHERE DoctorID = :NEW.DoctorID
        AND PatientID = :NEW.PatientID
        AND Date < :NEW.Date;
    END IF;

    -- Optional: Prevent insertion if a newer prescription exists (stricter rule)
    -- Uncomment the following block if desired
    -- SELECT COUNT(*)
    -- INTO v_count
    -- FROM Prescription
    -- WHERE DoctorID = :NEW.DoctorID
    -- AND PatientID = :NEW.PatientID
    -- AND Date > :NEW.Date;
    -- IF v_count > 0 THEN
    --     RAISE_APPLICATION_ERROR(-20003, 'Cannot insert/update: Newer prescription exists.');
    -- END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error in trg_latest_prescription: ' || SQLERRM);
END;
/

-- Trigger to ensure each pharmacy sells at least 10 unique drugs
-- Checks on insert or update to Drug_Sale
CREATE OR REPLACE TRIGGER trg_min_drugs_per_pharmacy
BEFORE INSERT OR UPDATE ON Drug_Sale
FOR EACH ROW
DECLARE
    v_drug_count NUMBER;
BEGIN
    -- Count unique drugs for the pharmacy
    SELECT COUNT(DISTINCT Trade_Name)
    INTO v_drug_count
    FROM Drug_Sale
    WHERE PharmacyID = :NEW.PharmacyID;

    -- If inserting or updating, ensure at least 10 drugs
    IF v_drug_count < 10 AND INSERTING THEN
        RAISE_APPLICATION_ERROR(-20001, 'Each pharmacy must sell at least 10 unique drugs.');
    END IF;

    -- For updates, check after the change (simplified; assumes no deletion here)
    -- Note: This trigger only checks on insert; a more complex trigger could handle updates/deletes
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20005, 'Error in trg_min_drugs_per_pharmacy: ' || SQLERRM);
END;
/

-- Trigger to ensure each doctor has at least one patient
-- Checks on delete from Patient
CREATE OR REPLACE TRIGGER trg_min_patients_per_doctor
BEFORE DELETE ON Patient
FOR EACH ROW
DECLARE
    v_patient_count NUMBER;
BEGIN
    -- Count remaining patients for the doctor
    SELECT COUNT(*)
    INTO v_patient_count
    FROM Patient
    WHERE primary_doctor_ID = :OLD.primary_doctor_ID;

    -- If this is the last patient, prevent deletion
    IF v_patient_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cannot delete patient: Doctor must have at least one patient.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20006, 'Error in trg_min_patients_per_doctor: ' || SQLERRM);
END;
/