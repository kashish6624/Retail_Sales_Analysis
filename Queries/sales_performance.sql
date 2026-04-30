/* What is total revenue?*/
SELECT sum(total_amount) as total_revenue
FROM sales;

/*Show transaction date with product category sold.*/
SELECT c.transaction_date, s.product_category
FROM customers as c
JOIN sales as s 
on c.transaction_id = s. transaction_id;

/*Find monthly sales trend.*/
SELECT EXTRACT(MONTH FROM transaction_date) as months, 
        round(sum(s.total_amount),2) as revenue
FROM customers as c JOIN sales as s
ON c.transaction_id = s.transaction_id
GROUP BY months
ORDER BY months ASC;

/*On which date were maximum sales recorded?*/
SELECT transaction_date, 
        sum(s.total_amount) as revenue
FROM customers as c
JOIN sales as s
on c.transaction_id = s.transaction_id
GROUP BY transaction_date
ORDER BY revenue DESC
LIMIT 1;

/*Average itmens per order*/
SELECT ROUND(AVG(quantity),2) AS avg_items_per_order
FROM sales;
