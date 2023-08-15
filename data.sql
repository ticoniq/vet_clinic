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