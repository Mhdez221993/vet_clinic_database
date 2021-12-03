/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id                INT GENERATED ALWAYS AS IDENTITY,
    name              varchar(100),
    date_of_birth     DATE,
    escape_attempts   INT,
    neutered          BOOLEAN,
    weight_kg         decimal(5,2),
    PRIMARY KEY (id)
);

-- Add a column species
ALTER TABLE animals ADD species varchar(100);

-- query multiple tables
CREATE TABLE owners (
    id                INT GENERATED ALWAYS AS IDENTITY,
    full_name         varchar(100),
    age               INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id                INT GENERATED ALWAYS AS IDENTITY,
    name         varchar(100),
    PRIMARY KEY (id)
);

-- NOTE: The id from animals table was set from the first exercise to be AUTOINCREMENTED
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT, ADD CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE;
ALTER TABLE animals ADD owner_id INT, ADD CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE;

-- Vet clinic database: add "join table" for visits
CREATE TABLE vets (
    id                    INT GENERATED ALWAYS AS IDENTITY,
    name                  varchar(100),
    age                   INT,
    date_of_graduation    DATE,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vets_id     INT,
    species_id  INT,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id),
    PRIMARY KEY(species_id, vets_id)
);

CREATE TABLE visits (
    id          INT GENERATED ALWAYS AS IDENTITY,
    animals_id  INT,
    vets_id     INT,
    visit_date  DATE,
    FOREIGN KEY (animals_id) REFERENCES animals(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id),
    PRIMARY KEY(id)
);