CREATE OR REPLACE PROCEDURE DrugsByCompany(
    p_company_name  IN VARCHAR2,
    p_result        OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT Trade_Name, Formula
        FROM Drug
        WHERE Company_Name = p_company_name;
END;
/
