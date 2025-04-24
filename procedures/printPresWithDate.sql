-- CREATE OR REPLACE PROCEDURE PrescriptionDetails(
--     p_patientid     IN NUMBER,
--     p_date          IN DATE,
--     p_result        OUT SYS_REFCURSOR
-- ) AS
-- BEGIN
--     OPEN p_result FOR
--         SELECT pr.PrescriptionID, pr.DoctorID, pd.Trade_Name, pd.Company_Name, pd.Quantity
--         FROM Prescription pr
--         JOIN Prescription_Drug pd ON pr.PrescriptionID = pd.PrescriptionID
--         WHERE pr.PatientID = p_patientid AND pr.Date_of_pres = p_date;
-- END;
-- /
CREATE OR REPLACE PROCEDURE Prescription_Details(
    p_patientid IN NUMBER,
    p_date      IN DATE
) AS
    v_count NUMBER := 0;
BEGIN
    FOR rec IN (
        SELECT pr.PrescriptionID, pr.DoctorID, pd.Trade_Name, pd.Company_Name, pd.Quantity
        FROM Prescription pr
        JOIN Prescription_Drug pd ON pr.PrescriptionID = pd.PrescriptionID
        WHERE pr.PatientID = p_patientid AND pr.Date_of_pres = p_date
    ) LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('Prescription ID : ' || rec.PrescriptionID);
        DBMS_OUTPUT.PUT_LINE('Doctor ID       : ' || rec.DoctorID);
        DBMS_OUTPUT.PUT_LINE('Trade Name      : ' || rec.Trade_Name);
        DBMS_OUTPUT.PUT_LINE('Company Name    : ' || rec.Company_Name);
        DBMS_OUTPUT.PUT_LINE('Quantity        : ' || rec.Quantity);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No prescription found for Patient ID ' || p_patientid || ' on date ' || TO_CHAR(p_date, 'DD-MON-YYYY'));
    END IF;
END;
/
