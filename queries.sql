/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals where name like '%mon%';

SELECT name FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered IS TRUE;

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Use transactions to update the animals table
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

-- Write queries to answer some questions
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered, AVG(escape_attempts) FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY neutered;

-- Vet clinic database: query multiple tables
SELECT animals.name, owners.full_name FROM animals
  INNER JOIN owners
  ON animals.owner_id = owners.id
  WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals
  INNER JOIN species
  ON animals.species_id = species.id
  AND species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
  LEFT JOIN animals
  ON animals.owner_id = owners.id;

SELECT species.name, COUNT(*) FROM animals
  FULL OUTER JOIN species
  ON animals.species_id = species.id
  GROUP BY species.id;

SELECT animals.name, species.name FROM animals
  JOIN owners
  ON animals.owner_id = owners.id
  JOIN species ON species.id = animals.species_id
  WHERE owners.full_name = 'Jennifer Orwell'
  AND species.name = 'Digimon';

SELECT animals.name, animals.escape_attempts FROM animals
  JOIN owners
  ON animals.owner_id = owners.id
  WHERE owners.full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(owners.id) FROM animals
  FULl OUTER JOIN owners
  ON animals.owner_id = owners.id
  GROUP BY owners.id;

-- Vet clinic database: add "join table" for visits
SELECT animals.name, visits.visit_date AS last_visit FROM visits
    INNER JOIN vets ON visits.vets_id = vets.id
    INNER JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'William Tatcher'
    GROUP BY animals.name, visits.visit_date
    ORDER BY last_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT visits.animals_id) FROM visits
    INNER JOIN vets ON visits.vets_id = vets.id
    WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets
    LEFT JOIN specialization ON vets.id = specialization.vets_id
    LEFT JOIN species ON species.id = specialization.species_id;

SELECT animals.name, visits.visit_date FROM visits
    INNER JOIN vets ON visits.vets_id = vets.id
    INNER JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'Stephanie Mendez'
    AND visits.visit_date BETWEEN 'Apr 1, 2020' AND 'Aug 30, 2020';

SELECT animals.name, COUNT(visits.animals_id) AS visit_count FROM visits
    INNER JOIN vets ON visits.vets_id = vets.id
    INNER JOIN animals ON animals.id = visits.animals_id
    GROUP BY animals.name, visits.animals_id
    ORDER BY visit_count DESC LIMIT 1;

SELECT animals.name, visits.visit_date AS first_visit FROM visits
    INNER JOIN vets ON vets.id = visits.vets_id
    INNER JOIN animals ON visits.animals_id = animals.id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY animals.name, visits.visit_date
    ORDER BY first_visit LIMIT 1;

SELECT * FROM visits
    INNER JOIN vets ON vets.id = visits.vets_id
    INNER JOIN animals ON animals.id = visits.animals_id
    ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits
    INNER JOIN vets ON vets.id = visits.vets_id
    INNER JOIN animals ON visits.animals_id = animals.id
    INNER JOIN specialization ON specialization.vets_id = vets.id
    WHERE specialization.species_id <> animals.species_id;

SELECT species.name, COUNT(visits.animals_id) AS species_count FROM visits
    INNER JOIN vets ON vets.id = visits.vets_id
    INNER JOIN animals ON visits.animals_id = animals.id
    INNER JOIN species ON species.id = animals.species_id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name
    ORDER BY species_count DESC LIMIT 1;
