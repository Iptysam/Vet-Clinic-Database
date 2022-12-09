/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN 20160101 AND 20191231;
SELECT * from animals WHERE neutered AND escape_attempts <3;
SELECT * from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT (name, escape_attempts) from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * from animals WHERE neutered;
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*Transaction*/
BEGIN;
UPDATE animals 
SET species = 'unspecified';

SELECT species from animals;
ROLLBACK;

SELECT species from animals;

/*Transaction2*/
BEGIN;
UPDATE animals SET species = 'dogomun' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT species from animals;
COMMIT;
SELECT species from animals;

/*Transaction3*/
 BEGIN;

   DELETE FROM animals;
   SELECT COUNT(*) FROM ANIMALS;

   ROLLBACK;
   SELECT COUNT(*) FROM ANIMALS;


/*Transaction4*/
BEGIN;

SAVEPOINT S1;

DELETE FROM animals WHERE date_of_birth > '20220101';

SAVEPOINT S2;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO S2;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;


/*Questions*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY neutered;

select species, min(weight_kg) as minimum, max(weight_kg) as maximum from animals 
GROUP BY species
select species, avg(escape_attempts) from animals 
where extract(YEAR FROM date_of_birth) BETWEEN 19900101 AND 20001231 GROUP BY species
