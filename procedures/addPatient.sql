CREATE OR REPLACE PROCEDURE AddPatient(
    p_aadharid      IN NUMBER,
    p_name          IN VARCHAR2,
    p_address       IN VARCHAR2,
    p_age           IN NUMBER,
    p_primary_doc   IN NUMBER
) AS
BEGIN
    INSERT INTO Patient (AadharID, Name, Address, Age, primary_doctor_ID)
    VALUES (p_aadharid, p_name, p_address, p_age, p_primary_doc);
END;
/
