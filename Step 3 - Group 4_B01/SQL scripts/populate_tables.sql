/*
NamChi Nguyen (7236760)
Ife Agiri (8205462)
Atai Akunov (6084916)
Lilian Zaky (8237286)
*/

SET search_path ="smart_fridge_system";

INSERT INTO Ingredient(name, threshold, price_per_item, count, category, available)
VALUES ('bread', '2017-12-28', 2.80, 5, 'grain', true),
('orange juice', '2017-03-28', 2.00, 3, 'juice', false),
('burger', '2017-10-28', 1.50, 15, 'meat', true),
('lettuce', '2017-10-28', 1.50, 10, 'vegetable', true),
('tomato', '2017-10-28', 1.30, 20, 'vegetable', true),
('chicken', '2017-04-10', 3.20, 15, 'meat', true),
('butter', '2017-05-28', 1.20, 5, 'dairy', true),
('cucumber', '2017-11-02', 1.00, 10, 'vegetable', true),
('cheese', '2017-01-28', 2.00, 12, 'dairy', true),
('spaghetti', '2017-07-28', 1.00, 10, 'grain', false);

select * from ingredient

INSERT INTO Meals(name, description, cuisine, available)
VALUES ('Tomato Soup' , 'A soup made with tomatoes', 'Canadian', true),
('Hamburger' , 'A burger', 'Canadian', true),
('Spaghetti with chicken' , 'Made with chicken', 'Italian', true),
('Green Salad' , 'A salad', 'American', true);

select * from meals;

INSERT INTO Composed_of(ingredient_id, meal_id, quantity)
VALUES (5, 1,1), /* tomato */
(1, 2,2), /* bread */
(3, 2,1), /* burger */
(4, 2,1), /* lettuce */
(5, 2, 1), /* tomato */
(9, 2, 1), /* cheese */
(10, 3, 1), /* spaghetti */
(6, 3, 1), /* chicken */
(7, 3, 1), /* butter */
(8, 4, 1), /* cucumber */
(4, 4,5); /* lettuce */

select * from composed_of;

INSERT INTO Users(name, username, password, status, user_type)
VALUES ('Ife Agiri', 'IR', 'IR123', true, 'chef'),
('Lilian Zaky', 'LZ', 'LZ456', true, 'chef'),
('NamChi Nguyen', 'NN', 'NN123', true, 'user'),
('Atai Akunov', 'AA', 'test123', true, 'admin');

select * from Users;

INSERT INTO Orders(ingredient_id, quantity)
VALUES (3, 5); 

select * from orders;