Create TABLE retail_raw(
    transaction_id INTEGER,
    transaction_date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INTEGER,
    product_category VARCHAR(50),
    quantity INTEGER,
    price_per_unit INTEGER,
    total_amount INTEGER
)

copy retail_raw
from 'path/to/dataset'
DELIMITER ','
CSV HEADER;

select * from retail_raw limit 5;

CREATE TABLE Customers(
    transaction_id INTEGER PRIMARY KEY,
    transaction_date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INTEGER
)

CREATE TABLE Sales(
    transaction_id INTEGER,
    product_category VARCHAR(50),
    quantity INTEGER,
    price_per_unit INTEGER,
    total_amount INTEGER,
    CONSTRAINT fk_transc 
        FOREIGN KEY (transaction_id)
        references Customers(transaction_id)
)

INSERT INTO Customers
SELECT
    transaction_id,
    transaction_date,
    customer_id,
    gender,
    age
FROM retail_raw;

INSERT INTO sales
SELECT
    transaction_id,
    product_category,
    quantity,
    price_per_unit,
    total_amount
FROM retail_raw;
