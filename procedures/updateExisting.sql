-- only for Pharmacy, Pharmaceutical_Company, Patient, Doctor, Contract

-- Update Pharmacy
CREATE OR REPLACE PROCEDURE UpdatePharmacy(
    p_old_name  IN VARCHAR2,
    p_new_name  IN VARCHAR2,
    p_address   IN VARCHAR2,
    p_phone     IN VARCHAR2
) AS
BEGIN
    UPDATE Pharmacy
    SET Name = p_new_name,
        Address = p_address,
        Phone = p_phone
    WHERE Name = p_old_name;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Pharmacy not found.');
    END IF;
END;
/

-- Update Pharmaceutical Company
CREATE OR REPLACE PROCEDURE UpdateCompany(
    p_name   IN VARCHAR2,
    p_phone  IN VARCHAR2
) AS
BEGIN
    UPDATE Pharmaceutical_Company
    SET Phone = p_phone
    WHERE Name = p_name;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Company not found.');
    END IF;
END;
/

-- Update Patient
CREATE OR REPLACE PROCEDURE UpdatePatient(
    p_aadharid      IN NUMBER,
    p_name          IN VARCHAR2,
    p_address       IN VARCHAR2,
    p_age           IN NUMBER,
    p_primary_doc   IN NUMBER
) AS
BEGIN
    UPDATE Patient
    SET Name = p_name,
        Address = p_address,
        Age = p_age,
        primary_doctor_ID = p_primary_doc
    WHERE AadharID = p_aadharid;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20012, 'Patient not found.');
    END IF;
END;
/

-- Update Doctor
CREATE OR REPLACE PROCEDURE UpdateDoctor(
    p_aadharid      IN NUMBER,
    p_name          IN VARCHAR2,
    p_specialty     IN VARCHAR2,
    p_experience    IN NUMBER
) AS
BEGIN
    UPDATE Doctor
    SET Name = p_name,
        Specialty = p_specialty,
        Years_of_Experience = p_experience
    WHERE AadharID = p_aadharid;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20013, 'Doctor not found.');
    END IF;
END;
/

-- Update Contract
CREATE OR REPLACE PROCEDURE UpdateContract(
    p_company_name     IN VARCHAR2,
    p_pharmacy_id      IN NUMBER,
    p_start_date       IN DATE,
    p_new_end_date     IN DATE,
    p_new_content      IN VARCHAR2,
    p_new_supervisor   IN VARCHAR2
) AS
BEGIN
    UPDATE Contract
    SET End_Date = p_new_end_date,
        Contract_Content = p_new_content,
        Supervisor = p_new_supervisor
    WHERE Company_Name = p_company_name
      AND PharmacyID = p_pharmacy_id
      AND Start_Date = p_start_date;
    -- should not update start date

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20014, 'Contract not found for the given identifiers.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Contract updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

