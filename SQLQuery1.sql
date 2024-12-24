create database healthcaredb

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(100),
    DateOfAdmission DATE,
    Diagnosis VARCHAR(100)
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100),
    ExperienceYears INT
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
INSERT INTO Patients (PatientID, FirstName, LastName, Gender, Age, City, DateOfAdmission, Diagnosis)
VALUES
(1, 'John', 'Smith', 'Male', 45, 'New York', '2024-01-15', 'Diabetes'),
(2, 'Sarah', 'Johnson', 'Female', 30, 'Chicago', '2024-02-10', 'Hypertension'),
(3, 'Emma', 'Brown', 'Female', 50, 'Los Angeles', '2024-01-20', 'Asthma'),
(4, 'Michael', 'Davis', 'Male', 40, 'Houston', '2024-02-01', 'Heart Disease'),
(5, 'James', 'Wilson', 'Male', 60, 'Miami', '2024-03-12', 'Diabetes');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status)
VALUES
(101, 1, 201, '2024-01-18', 'Completed'),
(102, 2, 202, '2024-02-12', 'Cancelled'),
(103, 3, 203, '2024-02-14', 'Scheduled'),
(104, 4, 201, '2024-02-20', 'Completed'),
(105, 5, 204, '2024-03-15', 'Scheduled');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, ExperienceYears)
VALUES
(201, 'Anna', 'Lee', 'Cardiology', 10),
(202, 'David', 'Kim', 'Neurology', 8),
(203, 'Sophia', 'Patel', 'Pulmonology', 12),
(204, 'Chris', 'Johnson', 'Endocrinology', 7);


select * from Doctors

select * from Patients

select * from Appointments

--Basic SQL Practice Tasks
--Simple Retrieval:

--List the names and ages of all patients in the database.

select FirstName,LastName,age
from Patients



--Show all appointments scheduled for February 2024.

select * from Appointments
where month(AppointmentDate)='2'



--Display the names of doctors with more than 10 years of experience.

select * from Doctors
where ExperienceYears > 10

--Data Filtering:

--Retrieve details of all male patients.

select * from Patients
where Gender='male'


--Find all patients diagnosed with "Diabetes."

select * from Patients
where Diagnosis='Diabetes'


--List appointments that are still "Scheduled."

select * from Appointments
where status='Scheduled'


--Sorting Data:

--Retrieve a list of patients sorted by their age in descending order.

select * from Patients
order by Age desc

--Show appointments sorted by AppointmentDate in ascending order.

select * from Appointments
order by AppointmentDate;

--Using Aliases and Functions:

--Display the full name of patients as "FullName" by concatenating FirstName and LastName.

select * from Patients

select CONCAT(FirstName, '' ,LastName) as fullname
from Patients



--Show the current age of each doctor (Assume ExperienceYears starts at age 25).

select ExperienceYears+25 ,concat (firstname,'' ,lastname)
from Doctors

--Intermediate SQL Tasks
--Joins:

--Retrieve all appointments with the patient's full name and the doctor’s specialty.
select * from Appointments

select * from Doctors

select * from Patients

select A.AppointmentDate,A.Status, 
concat(P.FirstName, ' ',P.LastName) as fullname ,D.specialty
from Appointments A
inner join Patients P
on A.PatientID=P.PatientID
inner join Doctors D on A.DoctorID=D.DoctorID

SELECT 
    CONCAT(Patients.FirstName, ' ', Patients.LastName) AS PatientFullName,
    Doctors.Specialty,
    Appointments.AppointmentDate,
    Appointments.Status
FROM Appointments
JOIN Patients ON Appointments.PatientID = Patients.PatientID
JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID;





--Find all patients who have been treated by a doctor specializing in "Cardiology."

select * from Doctors

select * from Patients

select CONCAT(P.firstname, '' ,P.lastname) as fullname
from Patients P
inner join Appointments A
on P.PatientID=A.PatientID
inner join Doctors D
on D.DoctorID=A.DoctorID
where Specialty='Cardiology'

--count the number patients from eacht city

select count(patientid) as countofpatient,city
from Patients
group by City

--Find the average age of patients admitted for "Asthma."
select avg(age) as avg_age from Patients 
where Diagnosis='Asthma'




--Determine the total number of appointments handled by each doctor.
select * from Doctors

select * from Appointments

--select * from Patients

select count(A.AppointmentID) numberofappointments,D.FirstName,d.LastName
from Doctors D
join Appointments A
on D.DoctorID=A.DoctorID
group by D.FirstName,d.LastName

--List all doctors who have treated at least one patient.
select top 2 *  from Doctors

select * from Patients

select * from Appointments

--Find the diagnosis with the most number of patients.
