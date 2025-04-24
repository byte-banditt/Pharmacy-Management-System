-- Pharmaceutical Companies
EXEC add_company ('Pharma_1', '9358727574');
EXEC add_company ('Pharma_2', '9203896509');
EXEC add_company ('Pharma_3', '9597249561');
EXEC add_company ('Pharma_4', '9012639490');
EXEC add_company ('Pharma_5', '9786515405');
EXEC add_company ('Pharma_6', '9651157466');
EXEC add_company ('Pharma_7', '9443401213');
EXEC add_company ('Pharma_8', '9883767170');
EXEC add_company ('Pharma_9', '9579632294');
EXEC add_company ('Pharma_10', '9947844056');

-- Doctors
EXEC add_doctor (100000000001, 'Dr_Name_1', 'Cardiology', 11);
EXEC add_doctor (100000000002, 'Dr_Name_2', 'Cardiology', 11);
EXEC add_doctor (100000000003, 'Dr_Name_3', 'Pediatrics', 16);
EXEC add_doctor (100000000004, 'Dr_Name_4', 'Neurology', 7);
EXEC add_doctor (100000000005, 'Dr_Name_5', 'Orthopedics', 1);
EXEC add_doctor (100000000006, 'Dr_Name_6', 'Orthopedics', 3);
EXEC add_doctor (100000000007, 'Dr_Name_7', 'Orthopedics', 6);
EXEC add_doctor (100000000008, 'Dr_Name_8', 'Orthopedics', 6);
EXEC add_doctor (100000000009, 'Dr_Name_9', 'Dermatology', 18);
EXEC add_doctor (100000000010, 'Dr_Name_10', 'Oncology', 18);

-- Patients
EXEC add_patient (200000000001, 'Patient_1', 'Address_1', 22, 100000000002);
EXEC add_patient (200000000002, 'Patient_2', 'Address_2', 34, 100000000003);
EXEC add_patient (200000000003, 'Patient_3', 'Address_3', 17, 100000000004);
EXEC add_patient (200000000004, 'Patient_4', 'Address_4', 23, 100000000003);
EXEC add_patient (200000000005, 'Patient_5', 'Address_5', 22, 100000000001);
EXEC add_patient (200000000006, 'Patient_6', 'Address_6', 21, 100000000007);
EXEC add_patient (200000000007, 'Patient_7', 'Address_7', 25, 100000000008);
EXEC add_patient (200000000008, 'Patient_8', 'Address_8', 28, 100000000009);
EXEC add_patient (200000000009, 'Patient_9', 'Address_9', 18, 100000000003);
EXEC add_patient (200000000010, 'Patient_10', 'Address_10', 30, 100000000001);

-- Pharmacies
EXEC add_pharmacy (101,'Pharmacy_1', 'Pharmacy_Address_1', '9211420451');
EXEC add_pharmacy (102,'Pharmacy_2', 'Pharmacy_Address_2', '9704793423');
EXEC add_pharmacy (103,'Pharmacy_3', 'Pharmacy_Address_3', '9972202968');
EXEC add_pharmacy (104,'Pharmacy_4', 'Pharmacy_Address_4', '9108589566');
EXEC add_pharmacy (105,'Pharmacy_5', 'Pharmacy_Address_5', '9746829026');
EXEC add_pharmacy (106,'Pharmacy_6', 'Pharmacy_Address_6', '9022933439');
EXEC add_pharmacy (107,'Pharmacy_7', 'Pharmacy_Address_7', '9891650583');
EXEC add_pharmacy (108,'Pharmacy_8', 'Pharmacy_Address_8', '9911570291');
EXEC add_pharmacy (109,'Pharmacy_9', 'Pharmacy_Address_9', '9681414600');
EXEC add_pharmacy (110,'Pharmacy_10', 'Pharmacy_Address_10', '9428616800');

-- Contracts
EXEC add_contract ('Pharma_2', 104, '2024-05-08', '2025-03-28', 'Contract content 1', 'Supervisor_9');
EXEC add_contract ('Pharma_3', 102, '2024-06-08', '2025-05-03', 'Contract content 2', 'Supervisor_2');
EXEC add_contract ('Pharma_4', 104, '2024-07-08', '2025-06-07', 'Contract content 3', 'Supervisor_3');
EXEC add_contract ('Pharma_5', 105, '2024-08-08', '2025-07-12', 'Contract content 4', 'Supervisor_4');
EXEC add_contract ('Pharma_6', 105, '2024-09-08', '2025-08-16', 'Contract content 5', 'Supervisor_5');
EXEC add_contract ('Pharma_7', 103, '2024-10-08', '2025-09-20', 'Contract content 6', 'Supervisor_6');
EXEC add_contract ('Pharma_8', 102, '2024-11-08', '2025-10-25', 'Contract content 7', 'Supervisor_7');
EXEC add_contract ('Pharma_9', 105, '2024-12-08', '2025-11-29', 'Contract content 8', 'Supervisor_8');
EXEC add_contract ('Pharma_1', 101, '2025-01-08', '2025-12-03', 'Contract content 9', 'Supervisor_1');
EXEC add_contract ('Pharma_1', 110, '2025-02-08', '2026-01-07', 'Contract content 10', 'Supervisor_1');

-- Drugs
EXEC add_drug ('Drug_1', 'Pharma_2');
EXEC add_drug ('Drug_2', 'Pharma_3');
EXEC add_drug ('Drug_3', 'Pharma_4');
EXEC add_drug ('Drug_4', 'Pharma_5');
EXEC add_drug ('Drug_5', 'Pharma_6');
EXEC add_drug ('Drug_6', 'Pharma_7');
EXEC add_drug ('Drug_7', 'Pharma_8');
EXEC add_drug ('Drug_8', 'Pharma_9');
EXEC add_drug ('Drug_9', 'Pharma_10');
EXEC add_drug ('Drug_10', 'Pharma_1');
EXEC add_drug ('Drug_1', 'Pharma_8');
EXEC add_drug ('Drug_3', 'Pharma_9');
EXEC add_drug ('Drug_4', 'Pharma_10');
EXEC add_drug ('Drug_9', 'Pharma_1');

-- Drug Sales
EXEC add_drug_sale (101, 'Drug_2', 'Pharma_3', 21.38);
EXEC add_drug_sale (101, 'Drug_3', 'Pharma_4', 42.59);
EXEC add_drug_sale (102, 'Drug_4', 'Pharma_5', 73.79);
EXEC add_drug_sale (103, 'Drug_5', 'Pharma_6', 12.26);
EXEC add_drug_sale (104, 'Drug_6', 'Pharma_7', 78.62);
EXEC add_drug_sale (104, 'Drug_7', 'Pharma_8', 35.23);
EXEC add_drug_sale (101, 'Drug_8', 'Pharma_9', 58.41);
EXEC add_drug_sale (105, 'Drug_9', 'Pharma_10', 39.55);
EXEC add_drug_sale (105, 'Drug_1', 'Pharma_1', 93.50);
EXEC add_drug_sale (106, 'Drug_2', 'Pharma_2', 35.95);
EXEC add_drug_sale (110, 'Drug_6', 'Pharma_7', 78.62);
EXEC add_drug_sale (110, 'Drug_7', 'Pharma_8', 35.23);
EXEC add_drug_sale (108, 'Drug_8', 'Pharma_9', 58.41);
EXEC add_drug_sale (105, 'Drug_9', 'Pharma_10', 39.55);
EXEC add_drug_sale (109, 'Drug_1', 'Pharma_1', 93.50);
EXEC add_drug_sale (110, 'Drug_2', 'Pharma_2', 35.95);