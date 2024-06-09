DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE Doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL,
);

CREATE TABLE Patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday DATE NOT NULL,
);

CREATE TABLE Visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id),
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    date DATE NOT NULL
);

CREATE TABLE Diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INT,
    disease_id INT,
    FOREIGN KEY (visit_id) REFERENCES Visits(id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(id)
);

--CHECK if use id or doctor_id (for all Insert values)
INSERT INTO Doctors (name, specialty)
VALUES ('Nguyen', 'Cardiologist');

INSERT INTO Patients (name, insurance, birthday)
VALUES ('Zack', 'United Health', '1990-12-31');

INSERT INTO Visits (doctor_id, patient_id, date)
VALUES (1, 1, '2024-09-23');

INSERT INTO Diseases (name, description)
VALUES ('Covid-19', 'coughing, hard to breath, lost ability to smell and taste');

INSERT INTO Diagnoses (visit_id, disease_id)
VALUES (2, 1);




