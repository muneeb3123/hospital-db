CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth  DATE
)

CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    patient_id INT,
    admitted_at TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY(patient_id) REFERENCES patients(id)
)

CREATE TABLE treatments (
    id INT  PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(50),
    name VARCHAR(50)
)

CREATE TABLE medical_treatment (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
)

CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(5,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
)

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(5,2),
    quantity INT,
    total_price DECIMAL(5,2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
)
