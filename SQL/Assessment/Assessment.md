# Retail Profitability & Market Segment Analysis

## SQL for Data Analytics Assessment

## Dataset Preview

![Dataset Preview](https://github.com/Dipaxi23/TOPS-Work/blob/14036c74e55811c70964c6013053d452d9610606/SQL/Assessment/Screenshot%20(1482).png)

---

## Database Import

![Database Schema](https://github.com/Dipaxi23/TOPS-Work/blob/14036c74e55811c70964c6013053d452d9610606/SQL/Assessment/Screenshot%20(1481).png)

---

# Section A: Concept Application

## Q1. What is the functional difference between SELECT * and specifying column names, and when is each preferred?

* The functional difference between SELECT * and specifying column names is SELECT * is used for fetching all the columns in the particular table whereas SELECT column_name is used for fetching the particular column mentioned in the SELECT query.
* When just a read through or a quick data exploration is needed then SELECT * can be used.
* When performance optimization is needed then use SELECT column_name.

## Q2. Which keyword renames a column in the output, and does this alias change the actual table structure in the database?

* 'AS' keyword is used to rename a column in the output and this alias does not change the actual table structure in the database.

## Q3. Why does wrapping a numeric value in quotes (e.g., '5000') in a WHERE clause create a data type conflict in SQL?

* When a numeric value is written in quotes then the query treats it as a string rather than the number and it creates a data type conflict in SQL.
* The conflict occurs because when user created that particular column they gave that column data type as INT but when we write numeric value in quotes in a WHERE clause then it becomes a string and therefore it generates an error.

## Q4. Contrast the results of ORDER BY Profit DESC versus ASC when the goal is to identify the top 10 most profitable orders.

### DESC

```sql
SELECT *
FROM superstore
ORDER BY Profit DESC
LIMIT 10;
```
Displays orders with the highest profits first. Returns the Top 10 most profitable orders.

### ASC

```sql
SELECT *
FROM superstore
ORDER BY Profit ASC
LIMIT 10;
```
Displays orders with the lowest profits first. Returns the 10 least profitable orders. If negative profit exists, then it will be the largest loss.

## Q5. What is the T-SQL equivalent of the LIMIT clause in MS SQL Server, and why does syntax vary across SQL engines?

 * The T-SQL equivalent of the LIMIT clause in MS SQL Server is TOP that used after SELECT whereas LIMIT is used at the end of the query.
 * The syntax varies across the SQL engines because different SQL standards are adopted by different SQL engines.

## Q6. Explain the logical execution order of a query containing SELECT, WHERE, ORDER BY, and LIMIT clauses.

* Let's take an example of the query,
```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1
LIMIT 10;
```

Logical explanation of the query: 
* FROM- the database chooses from which table the result is required
* WHERE- the database applies the condition to the chosen table
* SELECT- it selects which columns to show and applies the calculations if any
* ORDER BY- sorts result dataset to selected column
* LIMIT- restricts the result dataset to specified number
---

# Section B: Practical Task

## 1. Execute a query to retrieve the first 20 records from the orders table to verify data ingestion. 

```sql
SELECT * FROM superstore
ORDER BY `Row ID` ASC
LIMIT 20;
```

## 2. Select Order ID, Order Date, Sales, and Profit, applying a column alias to display Sales as Total_Sales.

```sql
SELECT `Order ID`, `Order Date`,
Sales as 'Total_Sales', Profit
FROM superstore;
```

## 3. Filter the dataset to isolate all high-value transactions where the Sales figure exceeds 5000.

```sql
SELECT * FROM superstore
WHERE Sales>5000;
```

## 4. Generate a report of the top 10 most profitable orders by sorting the records by Profit in descending order.

```sql
SELECT * FROM superstore
ORDER BY Profit DESC
LIMIT 10;
```
---

# Section C: Mini Project

## Problem Statement

Identify underperforming product categories and regions by analyzing the relationship between discount rates and net profit margins

## Query

```sql
SELECT Category, Region,
ROUND(AVG(Discount)*100,2) AS avg_discount,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS profit_margin
FROM superstore
GROUP BY Category, Region
ORDER BY avg_discount DESC;
```
---

## Query Output

![Profit Margin Analysis](https://github.com/Dipaxi23/TOPS-Work/blob/14036c74e55811c70964c6013053d452d9610606/SQL/Assessment/Screenshot%20(1483).png)

---

## Findings
Net Profit Margin = Sales/Profit ×100

### Most Underperforming
Furniture – Central Region

Average Discount= 29.54%

Profit Margin= -1.59%

Total Profit= Loss

This is the weakest-performing segment because it has the highest average discount and the negative profit margin.

### Best Performing
Office Supplies – West Region

Average Discount= 9.36%

Profit Margin= 24.01%

This is the lowest discount rate with the highest profitability. Therefore, higher discounting appears to be a major factor affecting the performance of underperforming categories and regions.

### Relation between Discount and profit margin
Shows an inverse relationship between discount rates and net profit margins.
As average discounts increases, profit tends to decrease. The Furniture category, particularly 
in the Central region, received the highest average discounts and recorded a negative profit margin, 
indicating that high discounting lead to financial losses. 
In contrast, categories and regions with lower discount rates generally achieved higher
profit margins. 

---

# Required Deliverables: SQL script for database schema creation, multi-condition filtering queries, aggregated performance report by region, and a summary of loss-making transaction

## Deliverable 1: Database Schema Creation

```sql
CREATE TABLE superstore(`Row ID` INT,
    `Order ID` TEXT,
    `Order Date` TEXT,
    `Ship Date` TEXT,
    `Ship Mode` TEXT,
    `Customer ID` TEXT,
    `Customer Name` TEXT,
    `Segment` TEXT,
    `Country` TEXT,
    `City` TEXT,
    `State` TEXT,
    `Postal Code` INT,
    `Region` TEXT
    `Product ID` TEXT,
    `Category` TEXT,
    `Sub-Category` TEXT,
    `Product Name` TEXT,
    `Sales` DOUBLE,
    `Quantity` INT,
    `Discount` DOUBLE,
    `Profit` DOUBLE);
```
---

## Deliverable 2: Multi-Condition Filtering Queries

### 1. Identify furniture products receiving high discounts that resulted in losses.

```sql
SELECT *
FROM superstore
WHERE Category='Furniture'
AND Discount>0.20
AND Profit<0;
```

### 2. Filter sales transactions in the South region meeting multiple business conditions.

```sql
SELECT *
FROM superstore
WHERE Region='South'
AND Sales>500
AND Discount>=0.10;
```
---

## Deliverable 3: Aggregated Performance Report by Region

### Summarizes business performance for each region by calculating total sales, total profit, order count, and average discount.

```sql
SELECT Region,
COUNT(*) AS total_orders,
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit,
ROUND(AVG(Discount)*100,2) AS avg_discount
FROM superstore
GROUP BY Region;

```
---

### Output

![Regional Report](https://github.com/Dipaxi23/TOPS-Work/blob/14036c74e55811c70964c6013053d452d9610606/SQL/Assessment/Screenshot%20(1484).png)

---

## Deliverable 3: Summary of Loss-Making Transactions

### Show which categories and regions contribute most to negative profit

```sql
SELECT Region,Category,
COUNT(*) AS loss_transactions,
ROUND(SUM(Profit),2) AS total_loss
FROM superstore
WHERE Profit<0
GROUP BY Region, Category
ORDER BY total_loss;
```

### Output

![Loss Report](https://github.com/Dipaxi23/TOPS-Work/blob/8166a705668be1383fc40edcda47485096376ef8/SQL/Assessment/Screenshot%20(1485).png)

---

# Conclusion

The analysis revealed that discounting has a significant impact on profit. Furniture products in the Central region showed the lowest profit due to high discount rates. Conversely, Office Supplies in the West region showed highest profit with lower discount rates.

These findings demonstrate how SQL can be used to identify underperforming business segments and support data-driven decision-making.
