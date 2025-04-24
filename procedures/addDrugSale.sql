CREATE OR REPLACE PROCEDURE Add_Drug_Sale(
    p_pharmacyid   IN NUMBER,
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

-- CREATE OR REPLACE PROCEDURE Add_Drug_Sale(
--     p_pharmacy_name   IN VARCHAR2,
--     p_pharmacy_addr   IN VARCHAR2,
--     p_trade_name      IN VARCHAR2,
--     p_company_name    IN VARCHAR2,
--     p_price           IN NUMBER
-- ) AS
--     v_pharmacy_id NUMBER;
-- BEGIN
--     -- Fetch PharmacyID based on name and address
--     SELECT PharmacyID INTO v_pharmacy_id
--     FROM Pharmacy
--     WHERE Name = p_pharmacy_name AND Address = p_pharmacy_addr;

--     -- Insert into Drug_Sale
--     INSERT INTO Drug_Sale (
--         PharmacyID, Trade_Name, Company_Name, Price
--     ) VALUES (
--         v_pharmacy_id, p_trade_name, p_company_name, p_price
--     );

--     DBMS_OUTPUT.PUT_LINE('Drug sale entry added successfully.');
-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         DBMS_OUTPUT.PUT_LINE('Error: Pharmacy not found with provided name and address.');
--     WHEN DUP_VAL_ON_INDEX THEN
--         DBMS_OUTPUT.PUT_LINE('Error: This drug already exists for the pharmacy and company.');
--     WHEN OTHERS THEN
--         DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
-- END;
-- /
