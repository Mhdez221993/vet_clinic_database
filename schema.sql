/* Database schema to keep the structure of entire database. */
--=# CREATE DATABASE vet_clinic;
-- =# UPDATE animals SET id = 2 WHERE name = 'Gabumon';
CREATE TABLE animals (
    id                int NOT NULL,
    name              varchar(100) NOT NULL,
    date_of_birth     date,
    escape_attempts   integer,
    neutered          boolean,
    weight_kg         decimal(5,2)
);

