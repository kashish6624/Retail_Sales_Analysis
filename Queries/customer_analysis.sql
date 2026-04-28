/* Return all Customers having age greater than or equal to 30*/
SELECT customer_id, age
FROM customers
WHERE age >= 30;


/*Show gender-wise average spending.*/
SELECT c.gender, round(avg(s.total_amount),2) as average_spending
FROM customers as c
JOIN sales as s 
on c.transaction_id = s.transaction_id
GROUP BY c.gender;

/*Find age group that spends the most.*/
SELECT c.age, round(sum(s.total_amount),3) as revenue
FROM customers as c JOIN sales as s
on c.transaction_id = s.transaction_id
GROUP BY age
ORDER BY revenue DESC
LIMIT 1;

/*Identify top 10 customers based on spending.*/
SELECT c.customer_id , s.total_amount 
FROM customers as c JOIN sales as s 
ON c.transaction_id = s.transaction_id
ORDER BY s.total_amount DESC
LIMIT 10;

/*Identify customers who never bought Electronics.*/
SELECT c.customer_id, s.product_category
FROM sales as s JOIN customers as c
ON c.transaction_id = s.transaction_id
where s.product_category != 'Electronics';

/*Segment cutomers as High, Medium or Low if 
total amount spent is >1000, between 1000 and 500 or <500 resp*/
SELECT c.customer_id,
CASE
    WHEN sum(s.total_amount) > 1000 THEN 'High Value'
    WHEN sum(s.total_amount) BETWEEN 500 AND 1000 THEN 'Medium Value'
    ELSE 'Low Value'
END
FROM customers as c
JOIN sales as s ON c.transaction_id = s.transaction_id
GROUP BY c.customer_id;
