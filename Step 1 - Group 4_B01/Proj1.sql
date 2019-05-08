SET search_path ="Proj1"

create type category_type AS (
grain varchar(10), 
dairy varchar(10), 
meat varchar(10), 
veg varchar(10), 
fruit varchar(10), 
egg varchar(10), 
juice varchar(10)); 

create table Ingredient(
ingredient_id integer,
iname varchar(10),
threshold date,
price_per_item float,
count integer,
/*category category_type, */
category varchar(10),
num_times_used integer,
primary key(ingredient_id));

INSERT INTO Ingredient(ingredient_id, iname, threshold, price_per_item, count, category, num_times_used)
VALUES (2, 'bread', '2017-02-28', 2.80, 1, 'grain', 0)

create table Meals(
meal_id integer,
mname varchar(10),
description varchar(30),
cuisine varchar(10),
primary key(meal_id),
FOREIGN key(ingredient_id) references Ingredient(ingredient_id) 
ON DELETE RESTRICT
ON UPDATE CASCADE);