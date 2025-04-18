CREATE OR REPLACE PROCEDURE PrescriptionDetails(
    p_patientid     IN VARCHAR2,
    p_date          IN NUMBER,
    p_result        OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT pr.PrescriptionID, pr.DoctorID, pd.Trade_Name, pd.Company_Name, pd.Quantity
        FROM Prescription pr
        JOIN Prescription_Drug pd ON pr.PrescriptionID = pd.PrescriptionID
        WHERE pr.PatientID = p_patientid AND pr.Date_of_pres = p_date;
END;
/
