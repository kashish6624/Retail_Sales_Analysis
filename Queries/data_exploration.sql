SELECT * FROM customers LIMIT 15;

SELECT * FROM sales LIMIT 15;

/* How many total customers are in the data given?*/
SELECT Count(DISTINCT customer_id) as customer_count
FROM customers;

/* All the product categories present in the dataset*/
SELECT DISTINCT product_category
FROM sales;

/* Return customer id and transaction date*/
SELECT customer_id, transaction_date
FROM customers;

/* Return all those records which have the per unit cost greater than 100*/
SELECT * 
FROM sales
WHERE price_per_unit >= 100;

/* Return records where sales quantity is less than 3*/
SELECT *
FROM sales
WHERE quantity < 3;

/* Return records where sales quantity is greater than 3*/
SELECT *
FROM sales
WHERE quantity > 3;

/*Find average customer age.*/
SELECT round(avg(age),2) as average_age
FROM customers;

/*Find maximum and minimum transaction amount.*/
SELECT max(total_amount) as max_transation, 
        min(total_amount) as min_transaction
FROM sales;
