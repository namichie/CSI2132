/* Composite attributes as enumerated types */
CREATE TYPE category_type AS ENUM ('grain', 'dairy', 'meat', 'vegetable', 'fruit', 'egg', 'juice');
CREATE TYPE usage_type AS ENUM ('rarely', 'sometimes', 'frequently');

/* Database tables */
CREATE TABLE Ingredient(
ingredient_id varchar(10) NOT NULL,
name varchar(15) NOT NULL,
threshold date NOT NULL,
price_per_item numeric CONSTRAINT valid_price CHECK (price_per_item > 0),
count integer,
category category_type, 
num_times_used usage_type,
PRIMARY KEY(ingredient_id));

INSERT INTO Ingredient(ingredient_id, name, threshold, price_per_item, count, category, num_times_used)
VALUES ('I_BRD', 'bread', '2017-02-28', 2.80, 5, 'grain', 'frequently'),
('I_OJ', 'orange juice', '2017-03-28', 2.00, 3, 'juice', 'rarely'),
('I_BGR', 'burger', '2017-02-28', 1.50, 15, 'meat', 'frequently'),
('I_LTCE', 'lettuce', '2017-02-28', 1.50, 10, 'vegetable', 'frequently'),
('I_TOM', 'tomato', '2017-02-28', 1.30, 20, 'vegetable', 'frequently'),
('I_CHKN', 'chicken', '2017-04-10', 3.20, 15, 'meat', 'frequently'),
('I_BTR', 'butter', '2017-05-28', 1.20, 5, 'dairy', 'frequently'),
('I_CBR', 'cucumber', '2017-02-02', 1.00, 10, 'vegetable', 'sometimes'),
('I_CHS', 'cheese', '2017-01-28', 2.00, 12, 'dairy', 'sometimes'),
('I_SPA', 'spaghetti', '2017-07-28', 1.00, 10, 'grain', 'rarely');

select * from ingredient

CREATE TABLE Meals(
meal_id integer NOT NULL,
name varchar(30),
description varchar(30),
cuisine varchar(10),
PRIMARY KEY(meal_id));

INSERT INTO Meals(meal_id, name, description, cuisine)
VALUES (1,'Tomato Soup' , 'A soup made with tomatoes', 'Canadian'),
(2,'Hamburger' , 'A burger', 'Canadian'),
(3,'Spaghetti with chicken' , 'Made with chicken', 'Italian'),
(4,'Green Salad' , 'A salad', 'American');

select * from meals;

CREATE TABLE Composed_of(
ingredient_id varchar(10) NOT NULL,
meal_id integer NOT NULL,
quantity integer CONSTRAINT qty_used_in_meal CHECK (quantity > 0), 
FOREIGN KEY (ingredient_id) references Ingredient(ingredient_id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (meal_id) references Meals(meal_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO Composed_of(ingredient_id, meal_id, quantity)
VALUES ('I_TOM', 1,1),
('I_BRD', 2,2),
('I_BGR', 2,1),
('I_LTCE', 2,1),
('I_TOM', 2, 1),
('I_CHS', 2, 1),
('I_SPA', 3, 1),
('I_CHKN', 3, 1),
('I_BTR', 3, 1),
('I_CBR', 4, 1),
('I_LTCE', 4,5);

select * from composed_of;

CREATE TABLE Orders( 
order_num integer NOT NULL,
ingredient_id varchar(10) NOT NULL,
space_requirement integer,
PRIMARY KEY(order_num),
FOREIGN KEY (ingredient_id) references Ingredient(ingredient_id) ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO Orders(order_num, ingredient_id, space_requirement)
VALUES (1, 'I_BGR', 5); 

select * from orders;

/* Users */
CREATE TABLE Chef(
chef_id integer NOT NULL,
PRIMARY KEY(chef_id));

INSERT INTO Chef(chef_id)
VALUES (1);

SELECT * from chef;

CREATE TABLE Regular_user(
order_num integer NOT NULL,
FOREIGN KEY(order_num) references Orders(order_num)ON DELETE RESTRICT ON UPDATE CASCADE);

INSERT INTO Regular_user(order_num)
VALUES (1);

select * from regular_user;

CREATE TABLE Administrator (
admin_id integer NOT NULL,
PRIMARY KEY(admin_id));

INSERT INTO Administrator(admin_id)
VALUES (1);

select * from administrator;

CREATE TABLE Refrigerator(
ingredient_id varchar(10) NOT NULL,
meal_id integer NOT NULL,
max_capacity integer NOT NULL,
FOREIGN KEY(ingredient_id) references Ingredient(ingredient_id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(meal_id) references Meals(meal_id) ON DELETE RESTRICT ON UPDATE CASCADE);

/* View the price of a meal based on the costs of ingredients */
CREATE VIEW Cost_Of_Meal AS(
           SELECT * FROM Meals NATURAL JOIN 
           ( SELECT C.meal_id, 
           SUM(C.quantity * I.price_per_item) AS price_of_ingredients   
           FROM Composed_of As C NATURAL JOIN Ingredient 
           AS I GROUP BY meal_id) AS tmp_meal);

SELECT name, price_of_ingredients   
FROM Cost_Of_Meal
ORDER BY price_of_ingredients DESC;

/* Drop table queries */
DROP TABLE Ingredient CASCADE;
DROP TABLE Meals CASCADE;
DROP TABLE Composed_of CASCADE;
DROP TABLE Orders CASCADE;
DROP TABLE Chef CASCADE;
DROP TABLE Regular_user CASCADE;
DROP TABLE Administrator CASCADE;
DROP TABLE Refrigerator CASCADE;