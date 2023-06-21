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



-- Adding foreign key index to patient_id column in medical_histories table

CREATE INDEX fk_idx_medical_histories_patient_id ON medical_histories (patient_id);

-- Adding foreign key index to medical_history_id column in invoices table

CREATE INDEX fk_idx_invoices_medical_history_id ON invoices (medical_history_id);

-- Adding foreign key indexes to invoice_id and treatment_id columns in invoice_items table

CREATE INDEX fk_idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX fk_idx_invoice_items_treatment_id ON invoice_items (treatment_id);

-- Adding foreign key indexes to medical_history_id and treatment_id columns in medical_treatments table

CREATE INDEX fk_idx_medical_history_treatments_medical_history_id ON medical_treatments (medical_history_id);
CREATE INDEX fk_idx_medical_history_treatments_treatment_id ON medical_treatments (treatment_id);
