CREATE OR REPLACE PROCEDURE PatientListForDoctor(
    p_doctorid IN NUMBER
) AS
    v_count NUMBER := 0;
BEGIN
    FOR rec IN (
        SELECT AadharID, Name, Address, Age
        FROM Patient
        WHERE primary_doctor_ID = p_doctorid
    ) LOOP
        v_count := v_count + 1;
        
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Aadhar ID : ' || rec.AadharID);
        DBMS_OUTPUT.PUT_LINE('Name      : ' || rec.Name);
        DBMS_OUTPUT.PUT_LINE('Address   : ' || rec.Address);
        DBMS_OUTPUT.PUT_LINE('Age       : ' || rec.Age);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No patients found for Doctor ID: ' || p_doctorid);
    END IF;
END;
/
