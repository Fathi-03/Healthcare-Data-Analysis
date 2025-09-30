
CREATE DATABASE HospitalDB01; 
GO
USE HospitalDB01;
GO

-- 1. appointment
CREATE TABLE appointment (
    appointment_id NVARCHAR(100) PRIMARY KEY,
    patient_id NVARCHAR(100) NULL,
    doctor_id NVARCHAR(100) NULL,
    appointment_date NVARCHAR(50) NULL,
    appointment_time NVARCHAR(50) NULL,
    status NVARCHAR(50) NULL,
    reason NVARCHAR(1000) NULL,
    notes NVARCHAR(2000) NULL,
    suggest NVARCHAR(1000) NULL,
    fees DECIMAL(18,2) NULL,
    payment_method NVARCHAR(100) NULL,
    discount DECIMAL(18,2) NULL,
    diagnosis NVARCHAR(1000) NULL
)


-- time
ALTER TABLE [appointment]
ALTER COLUMN [appointment_time] TIME

-- date
ALTER TABLE [appointment]
ALTER COLUMN [appointment_date] DATE


-- 2. beds
CREATE TABLE beds (
    bed_id NVARCHAR(100) PRIMARY KEY,
    room_id NVARCHAR(100) NULL,
    status NVARCHAR(50) NULL,
    patient_id NVARCHAR(100) NULL,
    occupied_from NVARCHAR(50) NULL,
    occupied_till NVARCHAR(50) NULL
)

-- 3. department
CREATE TABLE department (
    department_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    floor NVARCHAR(50) NULL,
    head_doctor NVARCHAR(255) NULL,
    total_staff INT NULL,
    phone_extension NVARCHAR(50) NULL
);

-- 4. doctor
CREATE TABLE doctor (
    doctor_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    specialization NVARCHAR(255) NULL,
    department_id NVARCHAR(100) NULL,
    salary DECIMAL(18,2) NULL,
    status NVARCHAR(50) NULL,
    availability NVARCHAR(100) NULL,
    joining_date NVARCHAR(50) NULL,
    qualification NVARCHAR(255) NULL,
    experience_years INT NULL,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(255) NULL
)

-- date
ALTER TABLE [doctor]
ALTER COLUMN  joining_date DATE

-- 5. hospital_bills
CREATE TABLE hospital_bills (
    bill_id NVARCHAR(100) PRIMARY KEY,
    patient_id NVARCHAR(100) NULL,
    admission_date NVARCHAR(50) NULL,
    discharge_date NVARCHAR(50) NULL,
    room_charges DECIMAL(18,2) NULL,
    surgery_charges DECIMAL(18,2) NULL,
    medicine_charges DECIMAL(18,2) NULL,
    test_charges DECIMAL(18,2) NULL,
    doctor_fees DECIMAL(18,2) NULL,
    other_charges DECIMAL(18,2) NULL,
    total_amount DECIMAL(18,2) NULL,
    discount DECIMAL(18,2) NULL,
    paid_amount DECIMAL(18,2) NULL,
    payment_status NVARCHAR(50) NULL,
    payment_method NVARCHAR(100) NULL
)

-- date
ALTER TABLE [hospital_bills]
ALTER COLUMN [admission_date] DATE


-- 6. medical_stock
CREATE TABLE medical_stock (
    medicine_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    category NVARCHAR(255) NULL,
    supplier_id NVARCHAR(100) NULL,
    cost_price DECIMAL(18,2) NULL,
    unit_price DECIMAL(18,2) NULL,
    stock_qty INT NULL,
    expiry_date NVARCHAR(50) NULL,
    manufacture_date NVARCHAR(50) NULL,
    batch_number NVARCHAR(100) NULL,
    reorder_level INT NULL
)

-- 7. medical_tests
CREATE TABLE medical_tests (
    test_id NVARCHAR(100) PRIMARY KEY,
    test_name NVARCHAR(255) NULL,
    category NVARCHAR(255) NULL,
    department_id NVARCHAR(100) NULL,
    cost DECIMAL(18,2) NULL,
    duration_minutes INT NULL,
    fasting_required NVARCHAR(10) NULL
)

-- 8. medicine_patient
CREATE TABLE medicine_patient (
    patient_id NVARCHAR(100) ,
    medicine_id NVARCHAR(100),
    qty INT NULL,
    date0 NVARCHAR(50) ,
    CONSTRAINT pk_medicine_patient PRIMARY KEY (patient_id , medicine_id ,date0)
)


-- 9. patient
CREATE TABLE patient (
    patient_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    age INT NULL,
    gender NVARCHAR(50) NULL,
    weight DECIMAL(8,2) NULL,
    blood_group NVARCHAR(10) NULL,
    address NVARCHAR(1000) NULL,
    state NVARCHAR(255) NULL,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(255) NULL,
    admission_date NVARCHAR(50) NULL,
    discharge_date NVARCHAR(50) NULL,
    status NVARCHAR(50) NULL
);

--  date
ALTER TABLE [patient]
ALTER COLUMN [admission_date] DATE


-- 10. patient_test
CREATE TABLE patient_test (
    patient_test_id NVARCHAR(100) PRIMARY KEY,
    patient_id NVARCHAR(100) NULL,
    test_id NVARCHAR(100) NULL,
    doctor_id NVARCHAR(100) NULL,
    test_date NVARCHAR(50) NULL,
    result_date NVARCHAR(50) NULL,
    status NVARCHAR(50) NULL,
    result NVARCHAR(2000) NULL,
    notes NVARCHAR(2000) NULL,
    amount DECIMAL(18,2) NULL,
    payment_method NVARCHAR(100) NULL,
    discount DECIMAL(18,2) NULL
)
-- date
ALTER TABLE [patient_test]
ALTER COLUMN [test_date] DATE;

--  date
ALTER TABLE [patient_test]
ALTER COLUMN [result_date] DATE

-- 11. rooms
CREATE TABLE rooms (
    room_id NVARCHAR(100) PRIMARY KEY,
    department_id NVARCHAR(100) NULL,
    room_type NVARCHAR(100) NULL,
    floor NVARCHAR(50) NULL,
    capacity INT NULL,
    status NVARCHAR(50) NULL,
    daily_charge DECIMAL(18,2) NULL,
    avg_monthly_maintenance_cost DECIMAL(18,2) NULL
);

-- 12. satisfaction_score
CREATE TABLE satisfaction_score (
    satisfaction_id NVARCHAR(100) PRIMARY KEY,
    patient_id NVARCHAR(100) NULL,
    doctor_id NVARCHAR(100) NULL,
    rating INT NULL,
    feedback NVARCHAR(2000) NULL,
    date NVARCHAR(50) NULL,
    department_id NVARCHAR(100) NULL
);

-- 13. staff
CREATE TABLE staff (
    staff_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    department_id NVARCHAR(100) NULL,
    role NVARCHAR(255) NULL,
    salary DECIMAL(18,2) NULL,
    joining_date NVARCHAR(50) NULL,
    shift NVARCHAR(50) NULL,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(255) NULL,
    address NVARCHAR(1000) NULL
);

-- 14. supplier
CREATE TABLE supplier (
    supplier_id NVARCHAR(100) PRIMARY KEY,
    name NVARCHAR(255) NULL,
    contact_person NVARCHAR(255) NULL,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(255) NULL,
    address NVARCHAR(1000) NULL,
    city NVARCHAR(255) NULL,
    state NVARCHAR(255) NULL,
    pincode NVARCHAR(50) NULL,
    contract_start_date NVARCHAR(50) NULL,
    contract_end_date NVARCHAR(50) NULL
);

-- 15. surgery
CREATE TABLE surgery (
    surgery_id NVARCHAR(100) PRIMARY KEY,
    appointment_id NVARCHAR(100) NULL,
    patient_id NVARCHAR(100) NULL,
    doctor_id NVARCHAR(100) NULL,
    surgery_date NVARCHAR(50) NULL,
    surgery_time NVARCHAR(50) NULL,
    status NVARCHAR(50) NULL,
    reason NVARCHAR(1000) NULL,
    notes NVARCHAR(2000) NULL,
    fees DECIMAL(18,2) NULL,
    payment_method NVARCHAR(100) NULL,
    discount DECIMAL(18,2) NULL
)

DROP TABLE surgery


-- AGIAN. surgery
CREATE TABLE surgery (
    surgery_id NVARCHAR(100) PRIMARY KEY,
    appointment_id NVARCHAR(100) NULL,
    patient_id NVARCHAR(100) NULL,
    doctor_id NVARCHAR(100) NULL,
	appointment_date DATE NULL,
	appointment_time TIME NULL,
    status NVARCHAR(50) NULL,
    reason NVARCHAR(1000) NULL,
	tests NVARCHAR(2000) NULL,
    notes NVARCHAR(2000) NULL,
    fees DECIMAL(18,2) NULL,
    payment_method NVARCHAR(100) NULL,
    discount DECIMAL(18,2) NULL
)


GO

alter table surgery

--- insert data into appointment table
BULK INSERT [dbo].[appointment]
FROM 'C:\Users\am\clean_appointment.CSV'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
-- delet data in table to reloaded
TRUNCATE TABLE appointment

--- insert data into beds table
BULK INSERT [dbo].[beds]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Beds.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)

--- insert data into deparment table
BULK INSERT [dbo].[department]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Department.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)

--- insert data into doctor table
BULK INSERT [dbo].[doctor]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Doctor.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)

--- Add img column into doctor table
ALTER TABLE [doctor]
ADD [img]NVARCHAR(100) null
-- delet data in table to reloaded
TRUNCATE TABLE doctor


--- insert data into hospital_bills table
BULK INSERT [dbo].[hospital_bills]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Hospital Bills.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)

--- insert data into medical_stock table
BULK INSERT [dbo].[medical_stock]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Medical Stock.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into medical_tests table
BULK INSERT [dbo].[medical_tests]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Medical Tests.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data medicine_patient table
BULK INSERT [dbo].[medicine_patient]
FROM 'C:\Users\am\Pictures\clean_medicine patient.CSV'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into patient table
BULK INSERT [dbo].[patient]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\patient.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- add img column in patient table
ALTER TABLE [patient]
ADD [img]NVARCHAR(100) null
-- delet data in table to reloaded
TRUNCATE TABLE patient

--- insert data into patient_test table
BULK INSERT [dbo].[patient_test]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Patient_Tests.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into rooms table
BULK INSERT [dbo].[rooms]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Rooms.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into stissfaction_score table
BULK INSERT [dbo].[satisfaction_score]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Satisfaction Score.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into staff table
BULK INSERT [dbo].[staff]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Staff.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into supplier table
BULK INSERT [dbo].[supplier]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Supplier.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)
--- insert data into surgery table
BULK INSERT [dbo].[surgery]
FROM 'E:\Dat for BigProject\Hospital 🏥\CSVs\Surgery.csv'
WITH (
    FIRSTROW = 2, -- لتخطي العناوين
    FIELDTERMINATOR = ',',  -- الفاصل بين الأعمدة
    ROWTERMINATOR = '\n',   -- نهاية الصف
    CODEPAGE = '65001'      -- لو ملفات UTF-8
)

-- Run to confirm that import row counts match CSV file counts.
SELECT 'patient' AS table_name, COUNT(*) AS row_count FROM patient
SELECT 'doctor', COUNT(*) FROM doctor
SELECT 'appointment', COUNT(*) FROM appointment
SELECT 'beds', COUNT(*) FROM beds
SELECT 'department', COUNT(*) FROM department
SELECT 'hospital_bills', COUNT(*) FROM hospital_bills
SELECT 'medical_stock', COUNT(*) FROM medical_stock
SELECT 'medical_tests', COUNT(*) FROM medical_tests
SELECT 'medicine_patient', COUNT(*) FROM medicine_patient
SELECT 'patient_test', COUNT(*) FROM patient_test
SELECT 'rooms', COUNT(*) FROM rooms
SELECT 'satisfaction_score', COUNT(*) FROM satisfaction_score
SELECT 'staff', COUNT(*) FROM staff
SELECT 'supplier', COUNT(*) FROM supplier
SELECT 'surgery', COUNT(*) FROM surgery



