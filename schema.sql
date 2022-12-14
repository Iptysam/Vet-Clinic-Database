/* Database schema to keep the structure of entire database. */

/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default",
    date_of_birth integer,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
)

ALTER TABLE animals ADD species text COLLATE pg_catalog."default"