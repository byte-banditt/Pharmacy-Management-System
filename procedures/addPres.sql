CREATE OR REPLACE PROCEDURE AddPrescription(
    p_doctorid      IN VARCHAR2,
    p_patientid     IN VARCHAR2,
    p_date          IN DATE, -- Use appropriate date type if needed
    p_no_of_drugs   IN NUMBER
) AS
DECLARE
    v_limit NUMBER := p_no_of_drugs;
BEGIN
    INSERT INTO Prescription (DoctorID, PatientID, Date_of_pres)VALUES (p_doctorid, p_patientid, p_date);
    FOR i IN 1..v_limit LOOP
        AddPrescriptionDrug()
    END LOOP;
END;
/

END;
/
