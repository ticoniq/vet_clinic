CREATE DATABASE vet_clinic;

-- Active: 1692055459948@@127.0.0.1@5432@vet_clinic@public
CREATE TABLE animals (  
    id INT GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2),
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255),
    age integer
);

CREATE TABLE species (
    id serial PRIMARY KEY,
    name varchar(255)
);

ALTER TABLE animals
ALTER COLUMN id SET DATA TYPE serial;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id integer REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id integer REFERENCES owners(id);

CREATE TABLE vets (
    id serial PRIMARY KEY,
    name varchar(255),
    age integer,
    date_of_graduation date
);

CREATE TABLE specializations (
    id serial PRIMARY KEY,
    vet_id integer REFERENCES vets(id),
    species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
    id serial PRIMARY KEY,
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    visit_date date
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX visits_animal_id ON visits(animal_id ASC);

CREATE INDEX visits_vet_id ON visits(vet_id);

CREATE INDEX owners_email ON owners (email);
