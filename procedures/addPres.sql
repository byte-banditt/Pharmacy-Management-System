CREATE OR REPLACE PROCEDURE AddPrescription(
    p_doctorid      IN VARCHAR2,
    p_patientid     IN VARCHAR2,
    p_date          IN DATE -- Use appropriate date type if needed
) AS
BEGIN
    INSERT INTO Prescription (DoctorID, PatientID, Date_of_pres)
    VALUES (p_doctorid, p_patientid, p_date);
END;
/
