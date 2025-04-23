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
AFTER INSERT OR UPDATE ON Drug_Sale
DECLARE
    v_bad_pharmacy NUMBER;
BEGIN
    SELECT PharmacyID INTO v_bad_pharmacy
    FROM Drug_Sale
    GROUP BY PharmacyID
    HAVING COUNT(DISTINCT Trade_Name) < 10
    FETCH FIRST 1 ROW ONLY;

    IF v_bad_pharmacy IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Pharmacy ' || v_bad_pharmacy || ' has less than 10 unique drugs');
    END IF;
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
