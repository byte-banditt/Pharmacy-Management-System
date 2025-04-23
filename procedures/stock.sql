CREATE OR REPLACE PROCEDURE StockPosition(
    p_pharmacyid IN VARCHAR2
) AS
    v_count NUMBER := 0;
BEGIN
    FOR rec IN (
        SELECT ds.Trade_Name, ds.Company_Name, ds.Price
        FROM Drug_Sale ds
        WHERE ds.PharmacyID = p_pharmacyid
    ) LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('Trade Name   : ' || rec.Trade_Name);
        DBMS_OUTPUT.PUT_LINE('Company Name : ' || rec.Company_Name);
        DBMS_OUTPUT.PUT_LINE('Price        : ' || rec.Price);
        DBMS_OUTPUT.PUT_LINE('------------------------------------');
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No stock found for Pharmacy ID: ' || p_pharmacyid);
    END IF;
END;
/
