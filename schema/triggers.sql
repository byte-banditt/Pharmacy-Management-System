-- 1. Keep Only Latest Prescription (Simplified)
CREATE OR REPLACE TRIGGER trg_latest_prescription
BEFORE INSERT ON Prescription
FOR EACH ROW
BEGIN
    DELETE FROM Prescription
    WHERE PatientID = :NEW.PatientID;
END;
/


-- 2. Pharmacy Drug Minimum Enforcement (Simplified)
CREATE OR REPLACE TRIGGER trg_min_drugs_per_pharmacy
AFTER DELETE OR UPDATE ON Drug_Sale
DECLARE
    v_pharmacy_id NUMBER;
    v_count       NUMBER;
BEGIN
    FOR rec IN (
        SELECT PharmacyID, COUNT(DISTINCT Trade_Name) AS drug_count
        FROM Drug_Sale
        GROUP BY PharmacyID
        HAVING COUNT(DISTINCT Trade_Name) < 10
    ) LOOP
        RAISE_APPLICATION_ERROR(-20001,
            'Pharmacy ' || rec.PharmacyID || ' has less than 10 unique drugs');
    END LOOP;
END;
/



-- 3. Doctor Patient Minimum Enforcement (Simplified)
-- CREATE OR REPLACE TRIGGER trg_min_patients_per_doctor
-- AFTER DELETE ON Patient
-- DECLARE
--     v_bad_doctor NUMBER;
-- BEGIN
--     SELECT primary_doctor_ID INTO v_bad_doctor
--     FROM Patient
--     RIGHT JOIN Doctor ON Doctor.DoctorID = Patient.primary_doctor_ID
--     GROUP BY primary_doctor_ID
--     HAVING COUNT(PatientID) = 0
--     FETCH FIRST 1 ROW ONLY;

--     IF v_bad_doctor IS NOT NULL THEN
--         RAISE_APPLICATION_ERROR(-20002,
--             'Doctor ' || v_bad_doctor || ' has no patients remaining');
--     END IF;
-- END;
-- /

-- Prevent Start_Date > End_Date for contract
CREATE OR REPLACE TRIGGER trg_validate_contract_dates
BEFORE INSERT OR UPDATE ON Contract
FOR EACH ROW
BEGIN
    IF :NEW.End_Date < :NEW.Start_Date THEN
        RAISE_APPLICATION_ERROR(-20015, 'End date cannot be earlier than start date.');
    END IF;
END;
/
