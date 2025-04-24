CREATE OR REPLACE PROCEDURE Prescriptions_Report(
    p_patientid     IN NUMBER,
    p_start_date    IN DATE,
    p_end_date      IN DATE,
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
