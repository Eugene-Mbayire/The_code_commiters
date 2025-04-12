README.md

<h1 style="color: blue;">✨ The_code_commiters ✨</h1>

<p style="color: darkgreen;">Exploring SQL Window Functions (Assignment)</p>

<h2 style="color: blue;">👨‍💼 Group Members:</h2>

<p style="color: darkgreen;">
1. Names: Eugene Mbayire<br>
&nbsp;&nbsp;&nbsp;&nbsp;ID: 27094<br>
2. Names: Serge Irakoze<br>
&nbsp;&nbsp;&nbsp;&nbsp;ID: 26980<br>
3. Names: Maniraguha Eric (Instructor)
</p>

<h2 style="color: blue;">🏛️ Objective</h2>

<p style="color: darkgreen;">
In this assignment, we explore SQL Window Functions such as <code>LAG()</code>, <code>LEAD()</code>, <code>RANK()</code>, <code>DENSE_RANK()</code>, <code>ROW_NUMBER()</code>, and aggregate window functions. We use them to perform analytical queries on a dataset and provide real-life applications for each case.
</p>

<h1 style="color: blue;">SQL COMMANDS EXECUTED (OUTPUT SCREENSHOTS)</h1>
<hr>

<h3 style="color: blue;">Table creation</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is creating a table named <code>sales_data</code> in a database. The <code>sales_data</code> table has 11 columns. Here's the list:
</p>

<ul style="color: darkgreen;">
<li>transaction_id</li>
<li>sale_date</li>
<li>product_id</li>
<li>product_name</li>
<li>category</li>
<li>region</li>
<li>salesperson_id</li>
<li>salesperson_name</li>
<li>quantity</li>
<li>unit_price</li>
<li>sale_amount</li>
</ul>

<h4 style="color: blue;">Expected output:</h4>
<p style="color: darkgreen;">Table is created successfully.</p>

![alt text](<1.create_table.png>)

<h3 style="color: blue;">Data insertion</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is inserting multiple rows of data into the <code>sales_data</code> table. Each row represents a sales transaction with various attributes such as transaction ID, sale date, product details, salesperson information, and sale amount. The <code>INSERT ALL</code> statement allows for inserting multiple rows in a single command, which is efficient for bulk data insertion.
</p>

<h4 style="color: blue;">Expected output:</h4>
<p style="color: darkgreen;">![alt text](<2.inserting_data.png>)</p>

<h3 style="color: blue;">Compare Values with Previous or Next Records using LAG() and LEAD()</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is using the <code>LAG()</code> and <code>LEAD()</code> window functions to compare each sale amount with the previous and next sale amounts within the same product category. It also categorizes the comparison results as "HIGHER", "LOWER", or "EQUAL". The output is ordered by category and sale date.
</p>

<h4 style="color: blue;">Expected output:</h4>
<p style="color: darkgreen;">![alt text](<3.compare_values.png>)</p>

<h3 style="color: blue;">Top records identification</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is using the <code>RANK()</code> and <code>DENSE_RANK()</code> window functions to rank sales transactions within each product category based on the sale amount. The results are ordered by category and sale amount in descending order.
</p>

<h4 style="color: blue;">Expected output:</h4>
<p style="color: darkgreen;">![alt text](<rank()_and_Dense_rank().png>)</p>

<h3 style="color: blue;">Top records identification</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is using a Common Table Expression (CTE) named ranked_sales to rank sales transactions within each product category based on the sale amount. It then filters the results to show only the top 3 sales in each category.
</p>

![alt text](<4.identifying_top_records.png>)

<h3 style="color: blue;">Finding the earliest records</h3>

```bash
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
```

<p style="color: darkgreen;">
This SQL block is using the <code>ROW_NUMBER()</code> window function to rank sales transactions within each product category based on the sale date. It then filters the results to show only the first 2 sales in each category chronologically.
</p>

![alt text](<5.finding_the_earliest_records.png>)

<h3 style="color: blue;">Aggregation with the window functions</h3>

```bash
SELECT 
    transaction_id,
    product_name,
    category,
    sale_amount,
    MAX(sale_amount) OVER (PARTITION BY category) AS max_sale_amount,
    AVG(sale_amount) OVER (PARTITION BY category) AS avg_sale_amount
FROM 
    sales_data
ORDER BY 
    category, sale_amount DESC;
```

<p style="color: darkgreen;">
This SQL block is using aggregate window functions to calculate the maximum and average sale amounts within each product category. The results are ordered by category and sale amount in descending order.
</p>

![alt text](<6.aggregation_with_window_functions.png>)

<h2 style="color: blue;">Explanations and real-world applications</h2>
<hr>

<p style="color: darkgreen;">
<b>1. Compare Values with Previous or Next Records (LAG/LEAD)</b><br>
Query Explanation:<br>
• LAG() and LEAD() functions access previous and next rows' values respectively<br>
• PARTITION BY category groups data by product category<br>
• ORDER BY sale_date ensures chronological comparison<br>
• CASE statements translate numerical comparisons into "HIGHER", "LOWER", or "EQUAL"<br>
Results: This query shows each sale with its previous and next sale amounts within the same category, and indicates whether the current sale amount is higher, lower, or equal compared to those values.<br>
Real-world Applications:<br>
• Sales trend analysis to identify growth or decline patterns within product categories<br>
• Stock price movement analysis (up/down indicators)<br>
• Performance tracking for employees, showing improvement or decline<br>
• Usage pattern detection for services or resources
</p>

<p style="color: darkgreen;">
<b>2. Ranking Data within a Category (RANK/DENSE_RANK)</b><br>
Query Explanation:<br>
• Both functions rank sales by amount within each category<br>
• RANK() assigns the same rank to ties but skips subsequent ranks<br>
• DENSE_RANK() assigns the same rank to ties without skipping subsequent ranks<br>
Real-world Applications:<br>
• Performance evaluation systems that rank employees within departments<br>
• Educational grading systems for class rankings<br>
• Product performance analysis<br>
• Competitive rankings in sports or contests
</p>

<p style="color: darkgreen;">
<b>3. Identifying Top Records</b><br>
Query Explanation:<br>
• Creates a Common Table Expression (CTE) with DENSE_RANK() to rank products by sale amount<br>
• Filters for only the top 3 products in each category<br>
Real-world Applications:<br>
• Identifying top-performing products, employees, or stores<br>
• Featured product recommendations<br>
• Performance bonus distribution<br>
• Market share analysis for top competitors in each segment
</p>

<p style="color: darkgreen;">
<b>4. Finding the Earliest Records</b><br>
Query Explanation:<br>
• Uses ROW_NUMBER() partitioned by category and ordered by date<br>
• Filters for only the first 2 sales in each category chronologically<br>
Real-world Applications:<br>
• First customer analysis (early adopters)<br>
• Identifying pioneer markets or regions<br>
• Historical trend analysis from initial transactions<br>
• Employee tenure tracking (first hires in each department)
</p>

<p style="color: darkgreen;">
<b>5. Aggregation with Window Functions</b><br>
Query Explanation:<br>
• Calculates maximum sale amount at both category and overall levels<br>
• Uses aggregates within window functions to compare individual sales to these maximums<br>
Real-world Applications:<br>
• Performance bench-marking against category leaders and overall top performers<br>
• Goal setting based on top performers<br>
• Bonus calculations based on relative performance<br>
• Market penetration analysis compared to category leaders
</p>

<h2 style="color: blue;">Summary</h2>

<p style="color: darkgreen;">
Window functions offer powerful analytical capabilities by performing calculations across related rows without collapsing them via GROUP BY. They're essential for:<br>
1. Comparative Analysis: Analyzing current values against previous/next periods<br>
2. Rankings and Hierarchies: Establishing ordering within groups<br>
3. Moving Aggregates: Calculating running totals or moving averages<br>
4. Relative Performance: Comparing individual records against group metrics<br>
These functions are extensively used in business intelligence, financial analysis, performance evaluation, and sales analytics to derive insights that would be complex or impossible with standard SQL queries.
</p>
