/* Populate database with sample data. */
INSERT INTO animals VALUES (1, 'Agumon', 'Feb 3, 2020', 0, true, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', 'Nov 15, 2018', 2, true, 8);
INSERT INTO animals VALUES (3, 'Pikachu', 'Jan 7, 2021', 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', 'May 12, 2017', 5, true, 11);
INSERT INTO animals VALUES (5, 'Charmander', 'Feb 8, 2020', 0, false, -11);
INSERT INTO animals VALUES (6, 'Plantmon', 'Nov 15, 2022', 2, true, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', 'Apr 2, 1993', 3, false, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', 'Jun 12, 2005', 1, true, -45);
INSERT INTO animals VALUES (9, 'Boarmon', 'Jun 7, 2005', 7, true, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', 'Oct 13, 1998', 3, true, 17);

--Owners records insert
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

--Species records insert
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Update species_id to be 2 when name ends with mon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- Update species_id to be 1 when specis_id is null
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Update owner_id to be 1('Sam Smith") when animal name equals Agumon.
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

-- Update owner_id to be 2('Jennifer Orwell") when animal name equals Gabumon or pikachu.
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Update owner_id to be 3('Bob") when animal name equals Devimon or Pikachu.
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

-- Update owner_id to be 4('Melody Pond") when animal name equals Charmander, Squirtle or Blossom.
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Update owner_id to be 5('Dean Whinchester') when animal name equals Angemon or Boarmon.
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
