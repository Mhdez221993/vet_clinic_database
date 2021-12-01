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
  'Feb 8th, 2020',
  11,
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
