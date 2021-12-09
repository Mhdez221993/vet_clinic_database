CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at date,
    patient_id int,
    status varchar(100),
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type varchar(100),
    name varchar(100),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price decimal(10, 2),
    quantity int,
    total_price decimal,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount decimal(10, 2),
    generated_at int,
    payed_at timestamp,
    medical_history_id int,
    PRIMARY KEY (id)
);

ALTER TABLE
    medical_histories
ADD
    FOREIGN KEY patient_id REFERENCES patients(id);

ALTER TABLE
    invoices
ADD
    FOREIGN KEY medical_history_id REFERENCES medical_histories(id);

ALTER TABLE
    invoice_items
ADD
    FOREIGN KEY invoice_id REFERENCES invoice_id(id);

ALTER TABLE
    invoice_items
ADD
    FOREIGN KEY treatment_id REFERENCES treatments(id);
