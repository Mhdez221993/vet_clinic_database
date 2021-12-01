/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals where name like '%mon%';

SELECT name FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered Is TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered IS TRUE;

SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT delete_date;

UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered, AVG(escape_attempts) FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY neutered;
