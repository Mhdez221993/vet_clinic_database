/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".

SELECT * FROM animals
  where name

  like '%mon%';

-- List the name of all animals born between 2016 and 2019.

SELECT name FROM animals
  WHERE EXTRACT(year FROM date_of_birth)
  BETWEEN 2016
  AND 2019;

-- List the name of all animals that are neutered and have less than 3 escape attempts.

SELECT name FROM animals
  WHERE neutered
  AND escape_attempts < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu"

SELECT date_of_birth FROM animals
  WHERE name
  IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg

SELECT name, escape_attempts FROM animals
  WHERE weight_kg > 10.5;

-- Find all animals that are neutered.

SELECT * FROM animals
  WHERE neutered;

-- Find all animals not named Gabumon.
SELECT * FROM animals
  WHERE name
  NOT
  LIKE 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)

SELECT * FROM animals
  WHERE weight_kg
  BETWEEN 10.4
  AND 17.3;


-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made.
-- Then roll back the change and verify that species columns went back to the state before tranasction.

BEGIN;

UPDATE animals
  SET species = 'unspecified';

ROLLBACK;

-- Inside a transaction:
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
-- Commit the transaction.
-- Verify that change was made and persists after commit.

BEGIN;

UPDATE animals
  SET species = 'digimon'
  WHERE name
  LIKE '%mon%';

UPDATE animals
  SET species = 'pokemon'
  WHERE species
  IS NULL;

COMMIT;

-- Inside a transaction delete all records in the animals table, then roll back the transaction.
-- After the roll back verify if all records in the animals table still exist.

BEGIN;

DELETE FROM animals;

ROLLBACK;

-- Inside a transaction:
-- Delete all animals born after Jan 1st, 2022.
-- Create a savepoint for the transaction.
-- Update all animals' weight to be their weight multiplied by -1.
-- Rollback to the savepoint
-- Update all animals' weights that are negative to be their weight multiplied by -1.
-- Commit transaction

BEGIN;

DELETE FROM animals
  WHERE date_of_birth > 'Jan 1, 2022';

SAVEPOINT delete_date;

UPDATE animals
  SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT delete_date;

UPDATE animals
  SET weight_kg = weight_kg * -1
  WHERE weight_kg < 0;

COMMIT;

-- How many animals are there?

SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?

SELECT COUNT(*) FROM animals
  WHERE escape_attempts = 0;

-- What is the average weight of animals?

SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?

SELECT neutered, SUM(escape_attempts)
  FROM animals
  GROUP BY neutered
  ORDER BY SUM
  DESC
  LIMIT 1;

-- What is the minimum and maximum weight of each type of animal?

SELECT neutered, MIN(weight_kg), MAX(weight_kg)
  FROM animals
    GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT neutered, AVG(escape_attempts)
  FROM animals
    WHERE EXTRACT(year FROM date_of_birth)
    BETWEEN 1990
    AND 2000
    GROUP BY species;

-- What animals belong to Melody Pond?

SELECT name, full_name
  FROM animals
    JOIN owners
      ON animals.owner_id = owners.id
    WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

SELECT animals.name, species.name
  FROM animals
    JOIN species
      ON animals.species_id = species.id
    WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT owners.full_name, animals.name
  FROM owners
    FULL JOIN animals
      ON animals.owner_id = owners.id;

-- How many animals are there per species?

SELECT species.name, COUNT(*)
  FROM animals
    JOIN species
      ON species_id = species.id
    GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.

SELECT animals.name, species.name
  FROM animals
    JOIN owners
    ON owner_id = owners.id
    JOIN species
    ON species.id = species_id
    WHERE full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name, escape_attempts
  FROM animals
    JOIN owners
    ON owner_id = owners.id
    WHERE full_name = 'Dean Winchester'
    AND escape_attempts = 0;

-- Who owns the most animals?

SELECT full_name, COUNT(*)
  FROM animals
    JOIN owners
      ON owner_id = owners.id
    GROUP BY full_name
    ORDER BY COUNT DESC
    LIMIT 1;

-- Who was the last animal seen by William Tatcher?

SELECT animals.name, date_of_visit FROM animals
  JOIN visits
    ON animal_id = animals.id
  JOIN vets
    ON vet_id = vets.id
  WHERE vets.name = 'William Tatcher'
  ORDER BY date_of_visit DESC
  LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT COUNT(DISTINCT visits.animal_id), vets.name
  FROM visits
    JOIN vets
      ON vets.id = vet_id
    WHERE vets.name = 'Stephanie Mendez'
    GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name
  FROM vets
    LEFT JOIN specializations
      ON vets.id = specializations.vet_id
    LEFT JOIN species
      ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name, date_of_visit
  FROM visits
    JOIN vets
      ON vet_id = vets.id
    JOIN animals
      ON animals.id = animal_id
    WHERE vets.name = 'Stephanie Mendez'
    AND date_of_visit
    BETWEEN 'Apr 1, 2020'
    AND 'Aug 30, 2020';

-- What animal has the most visits to vets?

SELECT animals.name, COUNT(animal_id)
  FROM animals
    JOIN visits
      ON animal_id = animals.id
    GROUP BY animals.name
    ORDER BY COUNT DESC
    LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT animals.name, date_of_visit, vets.name
  AS first_visit
  FROM visits
    JOIN vets
      ON vets.id = vet_id
    JOIN animals
      ON animal_id = animals.id
    WHERE vets.name = 'Maisy Smith'
    ORDER BY date_of_visit
    LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT * FROM visits
    JOIN vets
      ON vets.id = vet_id
    JOIN animals
      ON animals.id = animal_id
    ORDER BY date_of_visit DESC
    LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(visits.animal_id)
  FROM visits
    JOIN vets
      ON vet_id = vets.id
    WHERE vet_id NOT IN (SELECT vet_id FROM specializations );

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(visits.animal_id)
  AS species_count
  FROM visits
    JOIN vets
      ON vets.id = visits.vet_id
    JOIN animals
      ON visits.animal_id = animals.id
    JOIN species
      ON species.id = animals.species_id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name
    ORDER BY species_count
    DESC LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
