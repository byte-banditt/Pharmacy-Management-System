CREATE OR REPLACE PROCEDURE AddContract(
    p_company_name     IN VARCHAR2,
    p_pharmacy_id      IN VARCHAR2,
    p_start_date       IN DATE,
    p_end_date         IN DATE,
    p_contract_content IN VARCHAR2,
    p_supervisor       IN VARCHAR2
) AS
BEGIN
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
        p_start_date,
        p_end_date,
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
