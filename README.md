# Task-3-SQL-for-Data-Analysis
Table Name: ecommerce_dataset_10000

The dataset contains ecommerce transaction and customer review data such as:

Customer details

Product information

Order status

Quantity purchased

Ratings and review text

🛠 Tools & Technologies

MySQL 8.0

MySQL Workbench

SQL Queries (Views, Subqueries, Indexes)
1️⃣ Filter Customers by Age Group
SELECT age_group
FROM ecommerce_dataset_10000
WHERE age_group = "Adults";
📌 Purpose: Identify customer segments based on age categories.

2️⃣ Retrieve Products with Specific Review Text
SELECT product_name
FROM ecommerce_dataset_10000
WHERE review_text = "very good"
ORDER BY rating ASC
LIMIT 0, 200;
📌 Purpose: Find products that received positive reviews and sort them by rating.

3️⃣ Pending Orders with High Quantity Purchases
SELECT COUNT(quantity), first_name
FROM ecommerce_dataset_10000
WHERE order_status = "Pending"
GROUP BY first_name
HAVING COUNT(quantity) >= 3
LIMIT 0, 50;
📌 Purpose: Identify customers with multiple pending purchases.

4️⃣ Join Ecommerce Data with Customer Table
SELECT data.Country, ecommerce_dataset_10000.product_id
FROM ecommerce_dataset_10000
INNER JOIN data
ON data.CustomerID = ecommerce_dataset_10000.customer_id;
📌 Purpose: Combine ecommerce transaction data with customer demographic information.

5️⃣ Total Quantity Sold for a Specific Product
SELECT SUM(quantity)
FROM ecommerce_dataset_10000
WHERE product_name = 'Fitbit Versa 3';
📌 Purpose: Calculate total sales volume for a specific product.

📌 Views for Analysis
6️⃣ Create Product Ratings View
CREATE VIEW product_ratings AS
SELECT
    product_name,
    AVG(rating),
    COUNT(*)
FROM ecommerce_dataset_10000
GROUP BY product_name;
📌 Purpose: Store reusable product rating insights.

View Usage
SELECT * FROM product_ratings;
🔍 Subquery Example (Top Rated Products)
SELECT product_name, avg_rating
FROM (
    SELECT product_name, AVG(rating) AS avg_rating
    FROM ecommerce_dataset_10000
    GROUP BY product_name
) AS sub
ORDER BY avg_rating DESC
LIMIT 10;
📌 Purpose: Identify the top 10 highest-rated products.

⚡ Query Optimization Using Indexes
7️⃣ Create Index on Rating Column
CREATE INDEX idx_rating
ON ecommerce_dataset_10000(rating);
📌 Purpose: Improve performance of queries involving sorting and filtering by rating.

Example Query Benefiting from Index
SELECT *
FROM ecommerce_dataset_10000
ORDER BY rating DESC;

✔ Customer segmentation by age group
✔ Product review and rating analysis
✔ Sales quantity calculations
✔ View creation for reusable reporting
✔ Subqueries for advanced insights
✔ Indexing for faster query execution
