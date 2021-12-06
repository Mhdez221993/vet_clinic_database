/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
  'Agumon',
  'Feb 3, 2020',
  0,
  true,
  10.23
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
  'Gabumon',
  'Nov 15, 2018',
  2,
  true,
  8
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
  'Pikachu',
  'Jan 7, 2021',
  1,
  FALSE,
  15.04
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
  'Devimon',
  'May 12, 2017',
  5,
  true,
  11
);

-- update animals table
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Charmander',
  'Feb 8, 2020',
  -11,
  false,
  0
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Plantmon',
  'Nov 15, 2022',
  -5.7,
  true,
  2
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Squirtle',
  'Apr 2, 1993',
  -12.13,
  false,
  3
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Angemon',
  'Jun 12, 2005',
  -45,
  true,
  1
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Boarmon',
  'Jun 7, 2005',
  20.4,
  true,
  7
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Blossom',
  'Oct 13, 1998',
  17,
  true,
  3
);

-- Vet clinic database: query multiple tables
BEGIN;
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
COMMIT;

BEGIN;
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');
COMMIT;

BEGIN;
UPDATE animals SET species_id = 1 WHERE name LIKE '%mon%';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
COMMIT;

-- Vet clinic database: add "join table" for visits
BEGIN;
INSERT INTO vets (name, age, date_of_graduation) VALUES
  ('William Tatcher', 45, 'Apr 23rd, 2000'),
  ('Maisy Smith', 26, 'Jan 17th, 2019'),
  ('Stephanie Mendez', 64, 'May 4th, 1981'),
  ('Jack Harkness', 38, 'Jun 8th, 2008');
COMMIT;

BEGIN;
INSERT INTO specializations (vets_id, species_id) VALUES
  (1, 1),
  (3, 1),
  (3, 2),
  (4, 2),
COMMIT;

BEGIN;
INSERT INTO visits (animals_id, vets_id, visit_date) VALUES
  (1  1 'May 24th, 2020'),
  (1  3 'Jul 22th, 2020'),
  (2  4 'Feb 2nd, 2021'),
  (3  2 'Jan 5th, 2020'),
  (3  2 'Mar 8th, 2020'),
  (3  2 'May 14th, 2020'),
  (4  3 'May 4th, 2021'),
  (5  4 'Feb 24th, 2021'),
  (6  2 'Dec 21st, 2019'),
  (6  1 'Aug 10th, 2020'),
  (6  2 'Apr 7th, 2021'),
  (7  3 'Sep 29th, 2019'),
  (8  4 'Oct 3rd, 2020'),
  (8  4 'Nov 4th, 2020'),
  (9  2 'Jan 24th, 2019'),
  (9  2 'May 15th, 2019'),
  (9  2 'Feb 27th, 2020'),
  (9  2 'Aug 3rd, 2020'),
  (10  3 'May 24th, 2020'),
  (10  1 'Jan 11th, 2021')
COMMIT;
