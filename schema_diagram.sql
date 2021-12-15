CREATE TABLE "medical_histories"(
    "id"           INTEGER NOT NULL,
    "admitted_at"  TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id"   INTEGER NOT NULL,
    "status"       VARCHAR(255) NOT NULL
);

CREATE TABLE "patients"(
    "id"             INTEGER NOT NULL,
    "name"           VARCHAR(255) NOT NULL,
    "date_of_birth"  DATE NOT NULL
);

CREATE TABLE "treatments"(
    "id"     INTEGER NOT NULL,
    "type"   VARCHAR(255) NOT NULL,
    "name"   VARCHAR(255) NOT NULL
);

CREATE TABLE "invoice_items"(
    "id"            VARCHAR INTEGER NOT NULL,
    "unit_price"    VARCHAR DECIMAL(8, 2) NOT NULL,
    "quantity"      VARCHAR INTEGER NOT NULL,
    "total_price"   VARCHAR DECIMAL(8, 2) NOT NULL,
    "invoice_id"    VARCHAR INTEGER NOT NULL,
    "treatment_id"  VARCHAR INTEGER NOT NULL
);
