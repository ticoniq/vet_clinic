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
