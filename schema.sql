/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id INT,
  name TEXT, 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN, 
  weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- Create owners table
CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  full_name VARCHAR(50), 
  age INT
);

-- Create species table
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  name VARCHAR(50)
);

-- Set id as primary key
ALTER TABLE animals ADD PRIMARY KEY(id);

-- Update id with identity, so it will autoincrement
ALTER TABLE animals ALTER id ADD GENERATED ALWAYS AS IDENTITY;

-- Remove species column from animals table
ALTER TABLE animals DROP COLUMN IF EXISTS species;

-- Add species_id column to animals table and make it a foreign key referencing species table.
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);

-- Add owner_id column to animals table and make it a foreign key referencing owners table.
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Create vets table
CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  name VARCHAR(50), 
  age INT, 
  date_of_graduation DATE
);

-- Create specializations join table referencing vets and species
CREATE TABLE specializations (
  species_id INT, 
  vet_id INT, 
  FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE, 
  FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE, 
  PRIMARY KEY (species_id, vet_id)
);

-- Create visits join table referencing vets and animals
CREATE TABLE visits (
  animal_id INT, 
  vet_id INT, 
  FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE, 
  FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE, 
  PRIMARY KEY (animal_id, vet_id)
);