# Retail Profitability & Market Segment Analysis

## SQL for Data Analytics Assessment

# Project Objective

Identify underperforming product categories and regions by analyzing the relationship between discount rates and net profit margins.

The analysis focuses on:

* Regional sales performance
* Product category profitability
* Impact of discounting on profit margins
* Loss-making transactions
* Business decision support


# Dataset

Source:
https://www.kaggle.com/datasets/vivek468/superstore-dataset-final

### Dataset Attributes

| Attribute    | Description         |
| ------------ | ------------------- |
| Category     | Product category    |
| Sub-Category | Product subcategory |
| Region       | Sales region        |
| Sales        | Revenue generated   |
| Profit       | Profit earned       |
| Discount     | Discount applied    |
| Quantity     | Units sold          |

---

## 📸 Dataset Preview

Add screenshot here:

```md
![Dataset Preview](images/dataset-preview.png)
```

---

# 🗄️ Database Schema

```sql
CREATE TABLE superstore(
    `Row ID` INT,
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
    `Region` TEXT,
    `Product ID` TEXT,
    `Category` TEXT,
    `Sub-Category` TEXT,
    `Product Name` TEXT,
    `Sales` DOUBLE,
    `Quantity` INT,
    `Discount` DOUBLE,
    `Profit` DOUBLE
);
```

---

## 📸 Database Import

Add screenshot of imported table structure.

```md
![Database Schema](images/schema.png)
```

---

# 📝 Section A: SQL Concepts

## Q1. SELECT * vs Specific Columns

* `SELECT *` retrieves all columns.
* Specifying column names retrieves only required columns.
* Improves performance and readability.

## Q2. Column Aliases

```sql
SELECT Sales AS Total_Sales
FROM superstore;
```

* `AS` renames output columns.
* Does not modify table structure.

## Q3. Numeric Values in Quotes

```sql
WHERE Sales > 5000
```

Preferred over:

```sql
WHERE Sales > '5000'
```

Because quoted values are treated as strings.

## Q4. ORDER BY Profit DESC vs ASC

### DESC

```sql
SELECT *
FROM superstore
ORDER BY Profit DESC
LIMIT 10;
```

Returns top 10 profitable orders.

### ASC

```sql
SELECT *
FROM superstore
ORDER BY Profit ASC
LIMIT 10;
```

Returns least profitable orders.

## Q5. LIMIT Equivalent in SQL Server

```sql
SELECT TOP 10 *
FROM superstore;
```

SQL Server uses `TOP` instead of `LIMIT`.

## Q6. Query Execution Order

1. FROM
2. WHERE
3. SELECT
4. ORDER BY
5. LIMIT

---

# 🔍 Section B: Practical Tasks

## Retrieve First 20 Records

```sql
SELECT *
FROM superstore
ORDER BY `Row ID`
LIMIT 20;
```

## Display Sales as Total_Sales

```sql
SELECT
`Order ID`,
`Order Date`,
Sales AS Total_Sales,
Profit
FROM superstore;
```

## High Value Transactions

```sql
SELECT *
FROM superstore
WHERE Sales > 5000;
```

## Top 10 Profitable Orders

```sql
SELECT *
FROM superstore
ORDER BY Profit DESC
LIMIT 10;
```

---

# 📊 Section C: Mini Project

## Problem Statement

Identify underperforming product categories and regions by analyzing the relationship between discount rates and net profit margins.

---

## Analysis Query

```sql
SELECT
Category,
Region,
ROUND(AVG(Discount)*100,2) AS avg_discount,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS profit_margin
FROM superstore
GROUP BY Category, Region
ORDER BY avg_discount DESC;
```

---

## 📸 Query Output

Add screenshot here:

```md
![Profit Margin Analysis](images/profit-analysis.png)
```

---

## Findings

### Most Underperforming Segment

**Furniture – Central Region**

| Metric        | Value  |
| ------------- | ------ |
| Avg Discount  | 29.54% |
| Profit Margin | -1.59% |

Reason:

* Highest discount rate
* Negative profitability
* Indicates excessive discounting

---

### Best Performing Segment

**Office Supplies – West Region**

| Metric        | Value  |
| ------------- | ------ |
| Avg Discount  | 9.36%  |
| Profit Margin | 24.01% |

Reason:

* Lowest average discount
* Highest profitability

---

## Relationship Between Discount and Profit Margin

Observation:

* Higher discounts generally resulted in lower profit margins.
* Negative profit margins were associated with aggressive discounting.
* Lower discount rates produced stronger profitability.

Conclusion:

> An inverse relationship exists between discount rates and net profit margins.

---

# 📋 Required Deliverables

## Deliverable 1: Multi-Condition Filtering Queries

### High Discount Furniture Losses

```sql
SELECT *
FROM superstore
WHERE Category='Furniture'
AND Discount > 0.20
AND Profit < 0;
```

### South Region Transactions

```sql
SELECT *
FROM superstore
WHERE Region='South'
AND Sales > 500
AND Discount >= 0.10;
```

---

## Deliverable 2: Aggregated Performance Report by Region

```sql
SELECT
Region,
COUNT(*) AS total_orders,
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit,
ROUND(AVG(Discount)*100,2) AS avg_discount
FROM superstore
GROUP BY Region;
```

### 📸 Output

```md
![Regional Report](images/regional-report.png)
```

---

## Deliverable 3: Summary of Loss-Making Transactions

```sql
SELECT
Region,
Category,
COUNT(*) AS loss_transactions,
ROUND(SUM(Profit),2) AS total_loss
FROM superstore
WHERE Profit < 0
GROUP BY Region, Category
ORDER BY total_loss;
```

### 📸 Output

```md
![Loss Report](images/loss-report.png)
```

---

# 🎯 Conclusion

The analysis revealed that discounting has a significant impact on profitability. Furniture products in the Central region exhibited the poorest performance due to high discount rates and negative profit margins. Conversely, Office Supplies in the West region achieved strong profitability with lower discount rates.

These findings demonstrate how SQL can be used to identify underperforming business segments and support data-driven decision-making.
