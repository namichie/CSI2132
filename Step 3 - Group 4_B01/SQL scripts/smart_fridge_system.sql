/*
NamChi Nguyen (7236760)
Ife Agiri (8205462)
Atai Akunov (6084916)
Lilian Zaky (8237286)
*/

SET search_path ="smart_fridge_system";

/* Composite attributes as enumerated types */
CREATE TYPE category_type AS ENUM ('grain', 'dairy', 'meat', 'vegetable', 'fruit', 'egg', 'juice');

CREATE SEQUENCE ingredient_id_seq;
CREATE TABLE Ingredient(
ingredient_id integer NOT NULL DEFAULT nextval('ingredient_id_seq'),
name varchar(15) NOT NULL,
threshold date NOT NULL,
price_per_item numeric CONSTRAINT valid_price CHECK (price_per_item > 0),
count integer NOT NULL,
category category_type, 
available boolean,
PRIMARY KEY(ingredient_id));
ALTER SEQUENCE ingredient_id_seq OWNED BY Ingredient.ingredient_id;

CREATE SEQUENCE meal_id_seq;
CREATE TABLE Meals(
meal_id integer NOT NULL DEFAULT nextval('meal_id_seq'),
name varchar(30) NOT NULL,
description varchar,
cuisine varchar(20),
available boolean,
PRIMARY KEY(meal_id));
ALTER SEQUENCE meal_id_seq OWNED BY Meals.meal_id;

CREATE TABLE Composed_of(
ingredient_id integer NOT NULL,
meal_id integer NOT NULL,
quantity integer CONSTRAINT qty_used_in_meal CHECK (quantity > 0), 
PRIMARY KEY (ingredient_id, meal_id),
FOREIGN KEY (ingredient_id) references Ingredient(ingredient_id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (meal_id) references Meals(meal_id) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE SEQUENCE user_id_seq;
CREATE TABLE Users(
user_id integer NOT NULL DEFAULT nextval('user_id_seq'),
name varchar(30),
username text NOT NULL,
password text NOT NULL,
status boolean,
user_type varchar(20) NOT NULL,
PRIMARY KEY(user_id));
ALTER SEQUENCE user_id_seq OWNED BY Users.user_id;

CREATE SEQUENCE order_num_seq;
CREATE TABLE Orders( 
order_num integer NOT NULL DEFAULT nextval('order_num_seq'),
ingredient_id integer NOT NULL,
quantity integer NOT NULL,
order_approved boolean DEFAULT FALSE,
PRIMARY KEY(order_num, ingredient_id),
FOREIGN KEY (ingredient_id) references Ingredient(ingredient_id) ON DELETE RESTRICT ON UPDATE CASCADE);
ALTER SEQUENCE order_num_seq OWNED BY Orders.order_num;

/* Drop table/sequence queries */
DROP TABLE Ingredient CASCADE;
DROP TABLE Meals CASCADE;
DROP TABLE Composed_of CASCADE;
DROP TABLE Orders CASCADE;
DROP TABLE Refrigerator CASCADE;
DROP TABLE Users CASCADE;

DROP SEQUENCE ingredient_id_seq cascade;
DROP SEQUENCE meal_id_seq cascade;
DROP SEQUENCE user_id_seq cascade;
DROP SEQUENCE order_num_seq cascade;