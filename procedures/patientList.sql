CREATE OR REPLACE PROCEDURE PatientListForDoctor(
    p_doctorid  IN NUMBER,
    p_result    OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT AadharID, Name, Address, Age
        FROM Patient
        WHERE primary_doctor_ID = p_doctorid;
END;
/
