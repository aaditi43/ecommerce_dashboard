create database ecommerce_sales;
use  ecommerce_sales;

CREATE TABLE sales_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);

SELECT COUNT(*) FROM sales_data;

SELECT 
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM 
    sales_data;
    
SELECT 
    Description,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM 
    sales_data
GROUP BY 
    Description
ORDER BY 
    total_revenue DESC
LIMIT 10;

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue
FROM 
    sales_data
GROUP BY 
    month
ORDER BY 
    month;
    
SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM 
    sales_data
GROUP BY 
    Country
ORDER BY 
    revenue DESC;
    
SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_spent
FROM 
    sales_data
GROUP BY 
    CustomerID
ORDER BY 
    total_spent DESC
LIMIT 10;







