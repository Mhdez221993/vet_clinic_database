CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);

CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
