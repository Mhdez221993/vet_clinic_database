/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES
  ( 'Agumon', 'Feb 3, 2020', 0, true, 10.23 ),
  ( 'Gabumon', 'Nov 15, 2018', 2, true, 8 ),
  ( 'Pikachu', 'Jan 7, 2021', 1, FALSE, 15.04 ),
  ( 'Devimon', 'May 12, 2017', 5, true, 11 );

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
  VALUES
    ( 'Charmander', 'Feb 8, 2020', -11, false, 0 ),
    ( 'Plantmon', 'Nov 15, 2022', -5.7, true, 2 ),
    ( 'Squirtle', 'Apr 2, 1993', -12.13, false, 3 ),
    ( 'Angemon', 'Jun 12, 2005', -45, true, 1 ),
    ( 'Boarmon', 'Jun 7, 2005', 20.4, true, 7 ),
    ( 'Blossom', 'Oct 13, 1998', 17, true, 3 );

BEGIN;

INSERT INTO owners (full_name, age)
  VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

COMMIT;

BEGIN;

INSERT INTO species (name)
  VALUES
    ('Pokemon'),
    ('Digimon');

COMMIT;

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon

BEGIN;

UPDATE animals
  SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
  WHERE name
  LIKE '%mon%';

UPDATE animals
  SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
  WHERE name
  NOT LIKE '%mon%';

COMMIT;

-- Modify your inserted animals to include owner information (owner_id)
-- Sam Smith owns Agumon.

BEGIN;

UPDATE animals
  SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
  WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.

UPDATE animals
  SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
  WHERE name
  IN ('Gabumon', 'Pikachu');

-- Bob owns Devimon and Plantmon.

UPDATE animals
  SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
  WHERE name
  IN ('Devimon', 'Plantmon'); -- Plantmon was deleted on milestone 2

-- Melody Pond owns Charmander, Squirtle, and Blossom.

UPDATE animals
  SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHERE name
  IN ('Charmander', 'Squirtle', 'Blossom');

-- Dean Winchester owns Angemon and Boarmon.

UPDATE animals
  SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  WHERE name
  IN ('Angemon', 'Boarmon');

COMMIT;

-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

BEGIN;

INSERT INTO vets (name, age, date_of_graduation)
  VALUES
    ('William Tatcher', 45, 'Apr 23, 2000'),
    ('Maisy Smith', 26, 'Jan 17, 2019'),
    ('Stephanie Mendez', 64, 'May 4, 1981'),
    ('Jack Harkness', 38, 'Jun 8, 2008');

COMMIT;

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.

BEGIN;

INSERT INTO specializations (vet_id, species_id)
  VALUES
    (
      (SELECT id FROM vets WHERE name = 'William Tatcher'),
      (SELECT id FROM species WHERE name = 'Pokemon')
    ),
    (
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      (SELECT id FROM species WHERE name = 'Pokemon')
    ),
    (
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      (SELECT id FROM species WHERE name = 'Digimon')
    ),
    (
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      (SELECT id FROM species WHERE name = 'Digimon')
    );

COMMIT;

-- Insert the following data for visits:
-- Agumon visited William Tatcher on May 24th, 2020.
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- Pikachu visited Maisy Smith on May 14th, 2020.
-- Devimon visited Stephanie Mendez on May 4th, 2021.
-- Charmander visited Jack Harkness on Feb 24th, 2021.
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- Plantmon visited William Tatcher on Aug 10th, 2020.
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- Angemon visited Jack Harkness on Nov 4th, 2020.
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- Boarmon visited Maisy Smith on May 15th, 2019.
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- Blossom visited Stephanie Mendez on May 24th, 2020.
-- Blossom visited William Tatcher on Jan 11th, 2021.

BEGIN;

INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES
    (
      (SELECT id FROM animals WHERE name = 'Agumon'),
      (SELECT id FROM vets WHERE name = 'William Tatcher'),
      'May 24, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Agumon'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      'Jul 22, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Gabumon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      'Feb 2, 2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'Jan 5, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'Mar 8, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'May 14, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Devimon'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      'May 4, 2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Charmander'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      'Feb 24, 2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Squirtle'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      'Sep 29, 2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Angemon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      'Oct 3, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Angemon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      'Nov 4, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'Jan 24, 2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'May 15, 2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'Feb 27, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      'Aug 3, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Blossom'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      'May 24, 2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Blossom'),
      (SELECT id FROM vets WHERE name = 'William Tatcher'),
      'Jan 11, 2021'
    );

COMMIT;


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
