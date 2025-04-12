README.md

✨ <h1>The_code_commiters </h1> ✨

Exploring SQL Window Functions (Assignment)


👨‍💼 Group Members:

1. Names: Eugene Mbayire
      ID: 27094

2. Names: Serge Irakoze
	  ID:26980

3. Names: Maniraguha Eric (Instuctor)


🏛️ Objective

In this assignment, we explore SQL Window Functions such as LAG(), LEAD(), RANK(), DENSE_RANK(), ROW_NUMBER(), and aggregate window functions. We use them to perform analytical queries on a dataset and provide real-life applications for each case.



<h1>  SQL COMMANDS EXECUTED (OUTPUT SCREEN SHOTS) </h1>
<hr>

<h3> Table creation </h3>

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


<p>This SQL block is creating a table named sales_data in a database
The sales_data table has 11 columns. Here's the list:
</p>

<ul>
<li>transaction_id</li>
<li>sale_date</li>
<li>product_id</li>
<li>product_name</li>
<li>category</li>
<li>region</li>
<li>salesperson_id</li>
<li>salesperson_name</li>


sale_amount

<h4> Expected output:</h4>
Table is created successfully.

![alt text](<1.create_table.png>)

<h3> Data ensertion </h3>


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

<p>,This SQL block is inserting multiple rows of data into the sales_data table. Each row represents a sales transaction with various attributes such as transaction ID, sale date, product details, salesperson information, and sale amount.
The INSERT ALL statement allows for inserting multiple rows in a single command, which is efficient for bulk data insertion.
</p>
<h4> Expected output:</h4>

![alt text](<2.inserting_data.png>)

<h3> Compare Values with Previous or Next Records using LAG() and LEAD() </h3>

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
<p>This SQL block is using the LAG() and LEAD() window functions to compare each sale amount with the previous and next sale amounts within the same product category. It also categorizes the comparison results as "HIGHER", "LOWER", or "EQUAL". The output is ordered by category and sale date.
The LAG() function retrieves the previous sale amount, while the LEAD() function retrieves the next sale amount. The CASE statements determine the relationship between the current sale amount and the previous/next amounts.</p>

<h4> Expected output:</h4>

![alt text](<3.compare_values.png>)

<h3> Top records identification </h3>

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
<p>This SQL block is using the RANK() and DENSE_RANK() window functions to rank sales transactions within each product category based on the sale amount. The results are ordered by category and sale amount in descending order.
The RANK() function assigns a rank to each row within a partition of a result set, with gaps in the ranking for ties. The DENSE_RANK() function also assigns ranks but does not leave gaps for ties.</p>

<h4> Expected output:</h4>

![alt text](<rank()_and_Dense_rank().png>)

<h3> Top records identification </h3>

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
<p>This SQL block is using a Common Table Expression (CTE) named ranked_sales to rank sales transactions within each product category based on the sale amount. It then filters the results to show only the top 3 sales in each category.</p>


![alt text](<4.identifying_top_records.png>)

<h3> Finding the earliest records </h3>


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

<p>This SQL block is using the ROW_NUMBER() window function to rank sales transactions within each product category based on the sale date. It then filters the results to show only the first 2 sales in each category chronologically.</p>

![alt text](<5.finding_the_earliest_records.png>)

<h3> Aggrigation with the window functions </h3>

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

<p>This SQL block is using aggregate window functions to calculate the maximum and average sale amounts within each product category. The results are ordered by category and sale amount in descending order.</p>


![alt text](<6.aggregation_with_window_functions.png>)



<h2> Explainations and real world application </h2>
<hr>

<b>1. Compare Values with Previous or Next Records (LAG/LEAD)</b>>

Query Explanation:

•	LAG() and LEAD() functions access previous and next rows' values respectively
•	PARTITION BY category groups data by product category
•	ORDER BY sale_date ensures chronological comparison
•	CASE statements translate numerical comparisons into "HIGHER", "LOWER", or "EQUAL"
Results: This query shows each sale with its previous and next sale amounts within the same category, and indicates whether the current sale amount is higher, lower, or equal compared to those values.
Real-world Applications:
•	Sales trend analysis to identify growth or decline patterns within product categories
•	Stock price movement analysis (up/down indicators)
•	Performance tracking for employees, showing improvement or decline
•	Usage pattern detection for services or resources

2. Ranking Data within a Category (RANK/DENSE_RANK)

Query Explanation:

•	Both functions rank sales by amount within each category
•	RANK() assigns the same rank to ties but skips subsequent ranks
•	DENSE_RANK() assigns the same rank to ties without skipping subsequent ranks
Differences with Example: If we have sales of $2000, $1500, $1500, $1000:
•	RANK(): 1, 2, 2, 4 (skips rank 3)
•	DENSE_RANK(): 1, 2, 2, 3 (doesn't skip)
Real-world Applications:
•	Performance evaluation systems that rank employees within departments
•	Educational grading systems for class rankings
•	Product performance analysis
•	Competitive rankings in sports or contests

3. Identifying Top Records

Query Explanation:

•	Creates a Common Table Expression (CTE) with DENSE_RANK() to rank products by sale amount
•	Filters for only the top 3 products in each category
•	DENSE_RANK() is preferred over RANK() here to ensure we get exactly 3 products even if there are ties
Real-world Applications:
•	Identifying top-performing products, employees, or stores
•	Featured product recommendations
•	Performance bonus distribution
•	Market share analysis for top competitors in each segment

4. Finding the Earliest Records

Query Explanation:

•	Uses ROW_NUMBER() partitioned by category and ordered by date
•	Filters for only the first 2 sales in each category chronologically
•	ROW_NUMBER() ensures we get exactly 2 rows even if multiple sales occur on the same date
Real-world Applications:
•	First customer analysis (early adopters)
•	Identifying pioneer markets or regions
•	Historical trend analysis from initial transactions
•	Employee tenure tracking (first hires in each department)

5. Aggregation with Window Functions

Query Explanation:

•	Calculates maximum sale amount at both category and overall levels
•	Uses aggregates within window functions to compare individual sales to these maximums
•	Calculates percentages to show relative performance

Real-world Applications:

•	Performance bench-marking against category leaders and overall top performers
•	Goal setting based on top performers
•	Bonus calculations based on relative performance
•	Market penetration analysis compared to category leaders


Summary:

Window functions offer powerful analytical capabilities by performing calculations across related rows without collapsing them via GROUP BY. They're essential for:

1.	Comparative Analysis: Analyzing current values against previous/next periods
2.	Rankings and Hierarchies: Establishing ordering within groups
3.	Moving Aggregates: Calculating running totals or moving averages
4.	Relative Performance: Comparing individual records against group metrics

These functions are extensively used in business intelligence, financial analysis, performance evaluation, and sales analytic to derive insights that would be complex or impossible with standard SQL queries


<style>
    p{
        font-size: 16px;
        line-height: 1.5;
        color: blue;
    }
    h3{
        font-size: 24px;
        color: green;
    }
    </style>
