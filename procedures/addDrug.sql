CREATE OR REPLACE PROCEDURE AddDrug(
    p_trade_name    IN VARCHAR2,
    p_company_name  IN VARCHAR2
) AS
BEGIN
    INSERT INTO Drug (Trade_Name, Company_Name)
    VALUES (p_trade_name, p_company_name);
END;
/
