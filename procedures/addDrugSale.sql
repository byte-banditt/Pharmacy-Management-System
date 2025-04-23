CREATE OR REPLACE PROCEDURE AddDrugSale(
    p_pharmacyid   IN VARCHAR2,
    p_trade_name   IN VARCHAR2,
    p_company_name IN VARCHAR2,
    p_price        IN NUMBER
) AS
BEGIN
    -- Insert into Drug_Sale table
    INSERT INTO Drug_Sale (
        PharmacyID, Trade_Name, Company_Name, Price
    ) VALUES (
        p_pharmacyid, p_trade_name, p_company_name, p_price
    );

    DBMS_OUTPUT.PUT_LINE('Drug sale entry added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: This drug already exists for the pharmacy and company.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
