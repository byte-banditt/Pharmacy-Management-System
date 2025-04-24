CREATE OR REPLACE PROCEDURE AddCompany(
    p_name      IN VARCHAR2,
    p_phone     IN VARCHAR2
) AS
BEGIN
    INSERT INTO Pharmaceutical_Company (Name, Phone)
    VALUES (p_name, p_phone);
END;
/
