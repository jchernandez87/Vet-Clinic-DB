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

-- Select Melodys pons's animals
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- Select all animals of pokemon species
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals
SELECT animals.name, owners.full_name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;

-- list number of species
SELECT COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY animals.species_id;

-- Select Jennifer Orwell digimon animals
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- Select Dean Winchester animals with 0 escape attempts
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who onws the most
SELECT owners.full_name FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;

-- Get the latest animals visited by William Tatcher
SELECT animals.name FROM animals JOIN visits ON animals.id = animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

-- Stephanie mendez num of visited animals
SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

-- List vets and their specializations
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vet_id LEFT JOIN species ON species.id = species_id;

-- Animals visited by Stephanie Mendez between to dates
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN 'Apr 1, 2020' AND 'Aug 30,2020';

-- Get animal with most visits
SELECT animals.name FROM visits JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- First animal taht visit Maisy Smith
SELECT animals.name AS animal_name, vets.name AS vet_name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

-- Most recent visit
SELECT animals.name AS animal_name, vets.name AS vet_name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id ORDER BY visits.date_of_visit DESC LIMIT 1;

-- Least visits with an specialist
SELECT COUNT(animals.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id LEFT JOIN specializations ON vets.id = specializations.vet_id WHERE animals.species_id != specializations.species_id;

-- Maisy Smith most visitd species
SELECT species.name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(visits.animal_id) DESC LIMIT 1;