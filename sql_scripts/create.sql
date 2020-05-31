/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  m.ambros
 * Created: 31. 5. 2020
 */

CREATE DATABASE db_cocktails
    WITH 
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'Czech_Czechia.1250'
    LC_CTYPE = 'Czech_Czechia.1250'
    CONNECTION LIMIT = -1;

CREATE SCHEMA co
    AUTHORIZATION postgres;

CREATE TABLE co.t_ingredients
(
    ingredient_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    PRIMARY KEY (ingredient_id)
);

ALTER TABLE co.t_ingredients
    OWNER to postgres;

CREATE TABLE co.t_cocktails
(
    cocktail_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    url character varying(1000) NOT NULL,
    PRIMARY KEY (cocktail_id)
);

ALTER TABLE co.t_cocktails
    OWNER to postgres;

CREATE TABLE co.t_cocktails_x_ingredients
(
    cocktail_id bigserial NOT NULL,
    ingredients_id bigserial NOT NULL,
    FOREIGN KEY (cocktail_id)
        REFERENCES co.t_cocktails (cocktail_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (ingredients_id)
        REFERENCES co.t_ingredients (ingredient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE co.t_cocktails_x_ingredients
    OWNER to postgres;