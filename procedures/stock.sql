CREATE OR REPLACE PROCEDURE StockPosition(
    p_pharmacyid    IN NUMBER,
    p_result        OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result FOR
        SELECT ds.Trade_Name, ds.Company_Name, ds.Price
        FROM Drug_Sale ds
        WHERE ds.PharmacyID = p_pharmacyid;
END;
/
