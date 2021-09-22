/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Transactions
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE species IS NULL;
COMMIT;
BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- Num of animals
SELECT COUNT(*) FROM animals;

-- Never tried to escape
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- Avg weight
SELECT AVG(weight_kg) FROM animals;

-- Escape the most
SELECT MAX(escape_attempts) FROM animals WHERE neutered = true OR neutered = false;

-- Max and min weight of each species
SELECT MAX(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'digimon';
SELECT MAX(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'pokemon';

-- Avg escape attempts for animals born between 1990 and 2000;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '1999-12-31';
