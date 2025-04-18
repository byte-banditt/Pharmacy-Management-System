CREATE OR REPLACE PROCEDURE PrescriptionsReport(
    p_patientid     IN VARCHAR2,
    p_start_date    IN NUMBER,
    p_end_date      IN NUMBER,
    p_result        OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT pr.PrescriptionID, pr.DoctorID, pr.Date_of_pres, pd.Trade_Name, pd.Company_Name, pd.Quantity
        FROM Prescription pr
        JOIN Prescription_Drug pd ON pr.PrescriptionID = pd.PrescriptionID
        WHERE pr.PatientID = p_patientid
          AND pr.Date_of_pres BETWEEN p_start_date AND p_end_date;
END;
/
