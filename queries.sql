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
