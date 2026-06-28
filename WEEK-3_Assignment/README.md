# WEEK-3 Assignment - SQL Advanced Analytics

## Project Overview

This project demonstrates advanced SQL concepts using the **Sample Superstore** dataset. The analysis focuses on customer sales insights by applying **Subqueries**, **Common Table Expressions (CTEs)**, **Window Functions**, and **JOINs** to answer business-related questions.

---

## Objective

* Load the Superstore dataset into MySQL.
* Create normalized tables from the raw dataset.
* Apply advanced SQL concepts such as:

  * Subqueries
  * Common Table Expressions (CTEs)
  * Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)
  * JOIN operations
* Generate customer sales insights and rankings.

---

## Project Structure

```
WEEK-3_Assignment
│
├── Queries
│   ├── Database_Creation.sql
│   ├── Subqueries.sql
│   ├── CTE.sql
│   ├── Window_Function.sql
│   ├── Combined_Query.sql
│   └── Mini_Project.sql
│
├── Sample - Superstore.csv
│
└── README.md
```

---

## Dataset

**File:** `Sample - Superstore.csv`

The dataset contains information about:

* Orders
* Customers
* Products
* Sales
* Profit
* Discounts
* Regions
* Categories

---

## SQL Concepts Used

### 1. Database Creation

* Create database
* Create staging table (`superstore_raw`)
* Create normalized tables:

  * Customers
  * Orders
  * Products

### 2. Subqueries

* Orders above average sales
* Highest sales order for each customer
* Customers with above-average total sales

### 3. Common Table Expressions (CTEs)

* Customer sales summary
* Region-wise sales summary

### 4. Window Functions

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`

### 5. JOIN + CTE + Window Functions

* Customer sales ranking
* Region-wise customer ranking

---

## Business Questions Solved

* Top 10 customers by sales
* Bottom 10 customers by sales
* Customers with only one order
* Customers above average sales
* Highest-value order for every customer
* Top customer in each region

---

## Tools Used

* MySQL Server 8.0
* MySQL Workbench
* Sample Superstore Dataset

---

## Key Insights

* Identified customers generating above-average sales.
* Ranked customers based on total sales using Window Functions.
* Found the highest-value order for each customer.
* Identified top-performing customers in each region.
* Analyzed customer ordering patterns, including single-order customers.

---

## Author

**Name:** Sadiya Shaikh

**Project:** SQL Advanced Analytics – Customer Sales Insights
