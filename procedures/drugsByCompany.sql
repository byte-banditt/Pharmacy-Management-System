CREATE OR REPLACE PROCEDURE DrugsByCompany(
    p_company_name  IN VARCHAR2
    ) AS
BEGIN
    FOR rec IN (
        SELECT Trade_Name, Formula
        FROM Drug
        WHERE Company_Name = p_company_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Trade Name: ' || rec.Trade_Name);
        DBMS_OUTPUT.PUT_LINE('Formula ' || rec.Formula);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;
END;
/
