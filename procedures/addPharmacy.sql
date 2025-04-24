CREATE OR REPLACE PROCEDURE Add_Pharmacy(
    p_id        IN NUMBER,
    p_name      IN VARCHAR2,
    p_address   IN VARCHAR2,
    p_phone     IN VARCHAR2
) AS
BEGIN
    INSERT INTO Pharmacy (PharmacyID, Name, Address, Phone)
    VALUES (p_id, p_name, p_address, p_phone);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Pharmacy with this name already exists.');
END;
/
