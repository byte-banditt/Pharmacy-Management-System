CREATE OR REPLACE PROCEDURE add_contract(
    p_company_name     IN VARCHAR2,
    p_pharmacy_id      IN NUMBER,
    p_start_date_str   IN VARCHAR2,  -- Now accepts string
    p_end_date_str     IN VARCHAR2,  -- Now accepts string
    p_contract_content IN VARCHAR2,
    p_supervisor       IN VARCHAR2
) AS
    v_start_date DATE;
    v_end_date   DATE;
BEGIN
    -- Convert string to DATE
    v_start_date := TO_DATE(p_start_date_str, 'YYYY-MM-DD');
    v_end_date := TO_DATE(p_end_date_str, 'YYYY-MM-DD');

    -- Insert into Contract
    INSERT INTO Contract (
        Company_Name,
        PharmacyID,
        Start_Date,
        End_Date,
        Contract_Content,
        Supervisor
    ) VALUES (
        p_company_name,
        p_pharmacy_id,
        v_start_date,
        v_end_date,
        p_contract_content,
        p_supervisor
    );

    DBMS_OUTPUT.PUT_LINE('Contract added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Contract with same Company, Pharmacy, and Start Date already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/