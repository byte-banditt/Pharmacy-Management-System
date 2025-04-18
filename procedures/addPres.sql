CREATE OR REPLACE PROCEDURE AddPrescription(
    p_doctorid      IN VARCHAR2,
    p_patientid     IN VARCHAR2,
    p_date          IN NUMBER, -- Use appropriate date type if needed
    p_presc_id      OUT NUMBER
) AS
BEGIN
    INSERT INTO Prescription (DoctorID, PatientID, Date_of_pres)
    VALUES (p_doctorid, p_patientid, p_date)
    RETURNING PrescriptionID INTO p_presc_id;
END;
/
