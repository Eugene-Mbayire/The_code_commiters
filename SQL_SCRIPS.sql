-- Create the sales_data table
CREATE TABLE sales_data (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    salesperson_id INT,
    salesperson_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10, 2),
    sale_amount DECIMAL(10, 2)
);

-- Insert sample data
INSERT ALL
  INTO sales_data VALUES (1, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 101, 'Laptop Pro', 'Electronics', 'North', 1, 'John Smith', 2, 1200.00, 2400.00)
  INTO sales_data VALUES (2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 102, 'Smartphone X', 'Electronics', 'South', 2, 'Emma Johnson', 5, 800.00, 4000.00)
  INTO sales_data VALUES (3, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 103, 'Office Desk', 'Furniture', 'East', 3, 'Michael Brown', 1, 350.00, 350.00)
  INTO sales_data VALUES (4, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 104, 'Coffee Maker', 'Appliances', 'West', 4, 'Lisa Davis', 3, 75.00, 225.00)
  INTO sales_data VALUES (5, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 105, 'Gaming Console', 'Electronics', 'North', 1, 'John Smith', 2, 450.00, 900.00)
  INTO sales_data VALUES (6, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 106, 'Office Chair', 'Furniture', 'South', 2, 'Emma Johnson', 4, 120.00, 480.00)
  INTO sales_data VALUES (7, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 107, 'Wireless Earbuds', 'Electronics', 'East', 3, 'Michael Brown', 8, 90.00, 720.00)
  INTO sales_data VALUES (8, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 108, 'Blender', 'Appliances', 'West', 4, 'Lisa Davis', 2, 65.00, 130.00)
  INTO sales_data VALUES (9, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 109, 'Tablet Pro', 'Electronics', 'North', 1, 'John Smith', 3, 600.00, 1800.00)
  INTO sales_data VALUES (10, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 110, 'Bookshelf', 'Furniture', 'South', 5, 'Sarah Wilson', 1, 180.00, 180.00)
  INTO sales_data VALUES (11, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 111, 'Smart Watch', 'Electronics', 'East', 3, 'Michael Brown', 4, 250.00, 1000.00)
  INTO sales_data VALUES (12, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 112, 'Microwave', 'Appliances', 'West', 4, 'Lisa Davis', 1, 120.00, 120.00)
  INTO sales_data VALUES (13, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 113, 'Desktop Computer', 'Electronics', 'North', 5, 'Sarah Wilson', 1, 950.00, 950.00)
  INTO sales_data VALUES (14, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 114, 'Dining Table', 'Furniture', 'South', 2, 'Emma Johnson', 1, 450.00, 450.00)
  INTO sales_data VALUES (15, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 115, 'Headphones', 'Electronics', 'East', 3, 'Michael Brown', 5, 85.00, 425.00)
  INTO sales_data VALUES (16, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 116, 'Refrigerator', 'Appliances', 'West', 1, 'John Smith', 1, 800.00, 800.00)
  INTO sales_data VALUES (17, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 117, 'Smart TV', 'Electronics', 'North', 5, 'Sarah Wilson', 2, 700.00, 1400.00)
  INTO sales_data VALUES (18, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 118, 'Filing Cabinet', 'Furniture', 'South', 2, 'Emma Johnson', 2, 150.00, 300.00)
  INTO sales_data VALUES (19, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 119, 'Portable Speaker', 'Electronics', 'East', 1, 'John Smith', 3, 70.00, 210.00)
  INTO sales_data VALUES (20, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 120, 'Toaster', 'Appliances', 'West', 4, 'Lisa Davis', 2, 45.00, 90.00)
SELECT * FROM dual;

-- 1. Compare Values with Previous or Next Records using LAG() and LEAD()
SELECT 
    transaction_id,
    sale_date,
    product_name,
    category,
    sale_amount,
    LAG(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) AS previous_sale_amount,
    CASE 
        WHEN sale_amount > LAG(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'HIGHER'
        WHEN sale_amount < LAG(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'LOWER'
        WHEN sale_amount = LAG(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'EQUAL'
        ELSE 'FIRST RECORD'
    END AS compared_to_previous,
    LEAD(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) AS next_sale_amount,
    CASE 
        WHEN sale_amount > LEAD(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'HIGHER'
        WHEN sale_amount < LEAD(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'LOWER'
        WHEN sale_amount = LEAD(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) THEN 'EQUAL'
        ELSE 'LAST RECORD'
    END AS compared_to_next
FROM 
    sales_data
ORDER BY 
    category, sale_date;
    
    
    -- 2. Ranking Data within a Category using RANK() and DENSE_RANK()
SELECT 
    transaction_id,
    product_name,
    category,
    region,
    sale_amount,
    RANK() OVER (PARTITION BY category ORDER BY sale_amount DESC) AS rank_in_category,
    DENSE_RANK() OVER (PARTITION BY category ORDER BY sale_amount DESC) AS dense_rank_in_category
FROM 
    sales_data
ORDER BY 
    category, sale_amount DESC;
    
    
    -- 3. Identifying Top Records (Top 3 products by sale amount in each category)
WITH ranked_sales AS (
    SELECT 
        transaction_id,
        product_name,
        category,
        sale_amount,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY sale_amount DESC) AS sale_rank
    FROM 
        sales_data
)
SELECT 
    transaction_id,
    product_name,
    category,
    sale_amount,
    sale_rank
FROM 
    ranked_sales
WHERE 
    sale_rank <= 3
ORDER BY 
    category, sale_rank;
    
    
    -- 4. Finding the Earliest Records (First 2 sales in each category by date)
WITH ranked_by_date AS (
    SELECT 
        transaction_id,
        sale_date,
        product_name,
        category,
        sale_amount,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY sale_date) AS date_rank
    FROM 
        sales_data
)
SELECT 
    transaction_id,
    sale_date,
    product_name,
    category,
    sale_amount,
    date_rank
FROM 
    ranked_by_date
WHERE 
    date_rank <= 2
ORDER BY 
    category, date_rank;
    
    
    -- 5. Aggregation with Window Functions
SELECT 
    transaction_id,
    product_name,
    category,
    sale_amount,
    MAX(sale_amount) OVER (PARTITION BY category) AS max_in_category,
    MAX(sale_amount) OVER () AS overall_max_sale,
    ROUND(sale_amount / MAX(sale_amount) OVER (PARTITION BY category) * 100, 2) AS percent_of_category_max,
    ROUND(sale_amount / MAX(sale_amount) OVER () * 100, 2) AS percent_of_overall_max
FROM 
    sales_data
ORDER BY 
    category, sale_amount DESC;