/* Database schema to keep the structure of entire database. */
--=# CREATE DATABASE vet_clinic;
-- =# UPDATE animals SET id = 2 WHERE name = 'Gabumon';
CREATE TABLE animals (
    id                INT GENERATED ALWAYS AS IDENTITY,
    name              varchar(100),
    date_of_birth     DATE,
    escape_attempts   INT,
    neutered          BOOLEAN,
    weight_kg         decimal(5,2),
    PRIMARY KEY (id)
);
