CREATE OR REPLACE PROCEDURE ContractDetails(
    p_pharmacy_name    IN NUMBER,
    p_company_name  IN VARCHAR2,
    p_result        OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT c.Start_Date, c.End_Date, c.Contract_Content, c.Supervisor
        FROM Contract c
        WHERE c.PharmacyID = p_pharmacyid AND c.Company_Name = p_company_name;
END;
/
