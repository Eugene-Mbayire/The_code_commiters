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

![alt text](<1.create_table.png>)

<h3> Data ensertion </h3>

![alt text](<2.inserting_data.png>)

<h3> Values comparation </h3>

![alt text](<3.compare_values.png>)

<h3> Top records identification </h3>

![alt text](<4.identifying_top_records.png>)

<h3> Finding the earliest records </h3>

![alt text](<5.finding_the_earliest_records.png>)

<h3> Aggrigation with the window functions </h3>

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
