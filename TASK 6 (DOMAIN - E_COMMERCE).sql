USE internship_task

CREATE TABLE e_commerce_task_6(
	Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100),
    Category VARCHAR(100),
    Price INT,
    Quantity INT
);

INSERT INTO e_commerce_task_6 (Product_Name, Category, Price, Quantity)
VALUES
('Wireless Mouse', 'Electronics', 599, 40),
('Laptop', 'Electronics', 45000, 10),
('Notebook Set', 'Stationery', 199, 200),
('Pen Pack', 'Stationery', 99, 150),
('Yoga Mat', 'Fitness', 749, 25),
('Dumbbells', 'Fitness', 1299, 15),
('Office Chair', 'Furniture', 4999, 5),
('Study Table', 'Furniture', 7999, 3),
('LED Lamp', 'Home Decor', 1599, 12),
('Curtains Set', 'Home Decor', 1199, 8);
    
SELECT * FROM e_commerce_task_6

-- Questions of Task 6 Practice Questions (Subqueries & Nested Logic) From "CHATGPT" 

-- 1. Find all products whose price is above the average price of all products.   

SELECT Product_Name, Price 
FROM e_commerce_task_6
WHERE Price > (SELECT AVG(Price) From e_commerce_task_6);

-- 2. List product names and prices where the product has the lowest price in its category.

SELECT Product_Name, Price, Category
FROM e_commerce_task_6
WHERE Price IN (SELECT MIN(PRICE) 
             FROM e_commerce_task_6
             GROUP BY Category);
			
-- 3. Show products that belong to categories having more than 1 product.

SELECT Product_Name, Category
FROM e_commerce_task_6
WHERE Category IN (SELECT Category
				   FROM e_commerce_task_6
				   GROUP BY Category 
                   HAVING Count(*) > 1);
				
-- 4. Find products that are not the cheapest in their category using a correlated subquery.

SELECT Product_Name, Category, Price
FROM e_commerce_task_6 p1
WHERE Price > (
    SELECT MIN(Price)
    FROM e_commerce_task_6 p2
    WHERE p1.Category = p2.Category
);

-- 5. Display product names that exist in categories where at least one product costs more than 1000.

SELECT Product_Name, Category, Price
FROM e_commerce_task_6 p1
WHERE EXISTS (
    SELECT 1
    FROM e_commerce_task_6 p2
    WHERE p1.Category = p2.Category
      AND p2.Price > 1000
);

-- 6. Show the category and product name for each product where the quantity is less than the maximum quantity in the same category.
                  
SELECT Product_Name, Category, Quantity
FROM e_commerce_task_6 p1
WHERE Quantity < (
    SELECT MAX(Quantity)
    FROM e_commerce_task_6 p2
    WHERE p1.Category = p2.Category
);



    