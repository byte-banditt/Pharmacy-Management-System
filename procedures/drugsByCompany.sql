CREATE OR REPLACE PROCEDURE Drugs_By_Company(
    p_company_name  IN VARCHAR2
    ) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    FOR rec IN (
        SELECT Trade_Name
        FROM Drug
        WHERE Company_Name = p_company_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Trade Name: ' || rec.Trade_Name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
END;
/
