/*1. Show all customer records*/

SELECT * 
FROM sales.customers;

/*2. Show total number of customers*/

SELECT count(*) 
FROM sales.customers;

/*3. Show transactions for Chennai market*/
/*(market code for chennai is Mark001)*/

SELECT * 
FROM sales.transactions 
WHERE market_code='Mark001';

/*4. Show distrinct product codes that were sold in chennai*/

SELECT DISTINCT product_code 
FROM sales.transactions 
WHERE market_code='Mark001';

/*5. Show transactions where currency is US dollars*/

SELECT * 
FROM sales.transactions 
WHERE currency="USD";

/*6. Show transactions in 2020 join by date table*/

SELECT transactions.*, date.* 
FROM sales.transactions 
INNER JOIN sales.date ON transactions.order_date=date.date 
WHERE date.year=2020;

/*7. Show total revenue in year 2020*/

SELECT SUM(transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date 
WHERE sales.date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";

/*8. Show total revenue in year 2020, January Month,*/

SELECT SUM(transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN sales.date ON transactions.order_date=date.date 
WHERE date.year=2020 and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

/* 9. Show total revenue in year 2020 in Chennai*/

SELECT SUM(transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN sales.date ON transactions.order_date=date.date 
WHERE date.year=2020 and transactions.market_code="Mark001";