/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals
  where name like '%mon%';

SELECT name FROM animals
  WHERE date_of_birth
  BETWEEN '2016-01-01' AND '2019-01-01';

SELECT name FROM animals
  WHERE neutered
  AND escape_attempts < 3;

SELECT name FROM animals
  WHERE name
  IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts
  FROM animals
  WHERE weight_kg > 10.5;

SELECT name FROM animals
  WHERE neutered;

SELECT name FROM animals
  WHERE name != 'Gabumon';

SELECT name FROM animals
  WHERE weight_kg
  BETWEEN 10.4 AND 17.3;
