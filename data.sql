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
  5.4,
  true,
  2
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Squirtle',
  'Apr 2, 1993',
  12.13,
  false,
  3
);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (
  'Angemon',
  'Jun 12, 2005',
  45,
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
