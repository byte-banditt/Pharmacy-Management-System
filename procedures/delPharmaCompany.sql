CREATE OR REPLACE PROCEDURE DeletePharmaCompany(
    p_company IN VARCHAR2
) AS
BEGIN
    DELETE FROM Drug WHERE Company_Name = p_company;
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Company not found.');
    END IF;
END;
/
