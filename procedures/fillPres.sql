CREATE OR REPLACE PROCEDURE Add_Prescription_Drug(
    p_prescriptionid    IN NUMBER,
    p_trade_name        IN VARCHAR2,
    p_company_name      IN VARCHAR2,
    p_quantity          IN NUMBER
) AS
BEGIN
    INSERT INTO Prescription_Drug (PrescriptionID, Trade_Name, Company_Name, Quantity)
    VALUES (p_prescriptionid, p_trade_name, p_company_name, p_quantity);
END;
/
