CREATE OR REPLACE PROCEDURE AddDoctor(
    p_aadharid      IN NUMBER,
    p_name          IN VARCHAR2,
    p_specialty     IN VARCHAR2,
    p_exp           IN NUMBER
) AS
BEGIN
    INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
    VALUES (p_aadharid, p_name, p_specialty, p_exp);
END;
/
