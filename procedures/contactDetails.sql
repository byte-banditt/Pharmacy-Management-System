-- Contact Details of a Pharmacy-Pharmaceutical Company Contract
CREATE OR REPLACE PROCEDURE ContactDetails(
    p_pharmacy_id    IN VARCHAR2,
    p_company_name   IN VARCHAR2
) AS
    v_pharmacy_phone     VARCHAR2(20);
    v_company_phone      VARCHAR2(20);
BEGIN
    SELECT Phone INTO v_pharmacy_phone
    FROM Pharmacy
    WHERE Name = p_pharmacy_id;

    SELECT Phone INTO v_company_phone
    FROM Pharmaceutical_Company
    WHERE Name = p_company_name;

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Pharmacy     : ' || p_pharmacy_id);
    DBMS_OUTPUT.PUT_LINE('Pharmacy Ph# : ' || v_pharmacy_phone);
    DBMS_OUTPUT.PUT_LINE('Company      : ' || p_company_name);
    DBMS_OUTPUT.PUT_LINE('Company Ph#  : ' || v_company_phone);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Pharmacy or Company not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
