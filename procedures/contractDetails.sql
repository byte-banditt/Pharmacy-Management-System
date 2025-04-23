CREATE OR REPLACE PROCEDURE ContractDetails(
    p_pharmacy_name IN VARCHAR2,
    p_company_name  IN VARCHAR2
) AS
BEGIN
    FOR rec IN (
        SELECT Start_Date, End_Date, Contract_Content, Supervisor
        FROM Contract
        WHERE PharmacyID = p_pharmacy_name AND Company_Name = p_company_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Start Date: ' || TO_CHAR(rec.Start_Date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('End Date: ' || TO_CHAR(rec.End_Date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Contract Content: ' || rec.Contract_Content);
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || rec.Supervisor);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;
END;
/
