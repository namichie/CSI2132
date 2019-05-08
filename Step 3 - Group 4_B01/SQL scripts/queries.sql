/*
NamChi Nguyen (7236760)
Ife Agiri (8205462)
Atai Akunov (6084916)
Lilian Zaky (8237286)
*/

SET search_path ="smart_fridge_system";

-- Chef
/* Enter different types of meals and the required ingredients. If any of the defined ingredients is not available he can place an order that needs to be approved by the administrator. */
-- Create a meal
INSERT INTO Meals(name, description, cuisine, available)
VALUES ('Tomato Soup' , 'A soup made with tomatoes', 'Canadian', true);

INSERT INTO Composed_of(ingredient_id, meal_id, quantity)
VALUES (5, 1,1); /* tomato */

-- Remove a meal
DELETE FROM Meals
WHERE meal_id = 1;

-- Add an ingredient
INSERT INTO Ingredient(name, threshold, price_per_item, count, category, available)
VALUES ('bread', '2017-02-28', 2.80, 5, 'grain', true);

-- Remove an ingredient
DELETE FROM Ingredient
WHERE ingredient_id = 1;

/* Select ingredients and create an order if ingredients aren’t available */
SELECT ingredient_id, name
FROM Ingredient
WHERE available = false;

INSERT INTO Orders(ingredient_id, quantity)
VALUES (2, 5); 

/* See a report of meals that belong to a required cuisine and will be able to see whether the ingredients of any meal are available or not. */
SELECT M.name, M.cuisine, I.name
FROM Meals AS M, Ingredient AS I, Composed_of AS C
WHERE C.meal_id = M.meal_id AND C.ingredient_id = I.ingredient_id;

/* Get all ingredients that are necessary to make a particular meal */
SELECT I.name, C.quantity 
FROM Ingredient AS I, Meals AS M, Composed_of AS C
WHERE C.meal_id = M.meal_id AND C.ingredient_id = I.ingredient_id AND M.name = 'Hamburger';

-- Regular user
/* Can get single food item out of the fridge either by requesting the food item name or checking from the list of available food based on its category. */
SELECT name
FROM Ingredient
WHERE name = 'broccoli' OR category = 'vegetable';

-- Request a meal
SELECT name
FROM Meals
WHERE name = 'Hamburger';

-- Admin
-- Prepare an order (fridge/chef)
INSERT INTO Orders(ingredient_id, quantity)
VALUES (2, 5); 

/* View the price of a meal based on the costs of ingredients (View a report of the most expensive meal) */
CREATE VIEW Cost_Of_Meal AS(
           SELECT * FROM Meals NATURAL JOIN 
           ( SELECT C.meal_id, 
           SUM(C.quantity * I.price_per_item) AS price_of_meal
           FROM Composed_of AS C NATURAL JOIN Ingredient 
           AS I GROUP BY meal_id) AS tmp_meal);

SELECT name, price_of_meal 
FROM Cost_Of_Meal
ORDER BY price_of_meal DESC;

/* View the price of an order (derived attribute) */
CREATE VIEW Cost_Of_Order AS(
	SELECT * FROM Orders NATURAL JOIN
	( SELECT O.ingredient_id, 
	 SUM(O.quantity * I.price_per_item) AS price_of_order
	 FROM Orders AS O NATURAL JOIN Ingredient AS I 
	 GROUP BY order_num, O.ingredient_id) AS tmp_order);

SELECT order_num, quantity, price_of_order
FROM Cost_Of_Order;

/*View a report of frequently used ingredients */
SELECT I.name, C.ingredient_id, COUNT(C.ingredient_id) AS most_used_ingredient 	
FROM Composed_of AS C NATURAL JOIN Ingredient AS I	
GROUP BY C.ingredient_id, I.name
ORDER BY COUNT(C.ingredient_id) DESC;

/* View a report of the top 3 most used ingredients in a meal */
SELECT I.name, C.ingredient_id, COUNT(C.ingredient_id) AS top_3_ingredients 	
FROM Composed_of AS C NATURAL JOIN Ingredient AS I
GROUP BY C.ingredient_id, I.name
ORDER BY COUNT(C.ingredient_id) DESC
LIMIT 3;


/* Queries used in Eclipse */
--find Ingredient By Name
SELECT * FROM smart_fridge_system.Ingredient WHERE name ILIKE ?;

--find Ingredient By Category
SELECT * FROM smart_fridge_system.Ingredient WHERE category = ?::smart_fridge_system.category_type;

-- listIngredientInfoForOrder
SELECT ingredient_id, name, price_per_item, count FROM smart_fridge_system.Ingredient

--find Meal By Name
SELECT * FROM smart_fridge_system.Meals WHERE name ILIKE ?;

--find Meal By Cuisine
SELECT * FROM smart_fridge_system.Meals WHERE cuisine ILIKE ?;

-- add a meal
INSERT INTO smart_fridge_system.Meals (name, description, cuisine, available) VALUES (?,?,?,?);

-- place an order
INSERT INTO smart_fridge_system.Orders (ingredient_id, quantity) VALUES (?,?)

-- get all ingredients
SELECT * FROM smart_fridge_system.Ingredient ORDER BY name

-- find ingredient
SELECT I.name, I.ingredient_id 
FROM smart_fridge_system.Meals AS M, smart_fridge_system.Composed_of AS C, smart_fridge_system.Ingredient AS I 
WHERE M.meal_id=C.meal_id AND I.ingredient_id=C.ingredient_id AND M.meal_id=?;

-- add ingredients to meal
INSERT INTO smart_fridge_system.Composed_of(ingredient_id, meal_id, quantity) VALUES (?,?,?)

-- Drop queries
drop view Cost_Of_Meal;
drop view Cost_Of_Order;