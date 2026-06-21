# Week 2 - SQL Data Analysis

## Author
**Sadiya Shaikh**

## Objective

The objective of this assignment is to analyze e-commerce sales data using SQL by applying filtering, aggregation, joins, indexing, and business-oriented queries. The project demonstrates practical database management and data analysis skills using MySQL.

---

## Business Scenario

This project is based on **ShopEase**, a mid-sized e-commerce company that sells products across multiple categories such as Electronics, Clothing, and Home Appliances.

The analysis focuses on:

- Customer information
- Product details
- Orders and sales performance
- Product-level transactions
- Business insights using SQL

---

## Database Information

**Database Name:** `shopease_db`

### Tables Used

| Table Name | Description |
|------------|-------------|
| customers | Stores customer information |
| products | Stores product details |
| orders | Stores order information |
| order_items | Stores product-level order details |

---

## Project Structure

```text
WEEK-2-sql_analysis/
│
├── Section_A/
│   └── basic_queries.sql
│
├── Section_B/
│   └── filtering_queries.sql
│
├── Section_C/
│   └── aggregation_queries.sql
│
├── Section_D/
│   └── joins_queries.sql
│
├── Section_E/
│   └── advanced_queries.sql
│
├── database.sql
│
└── README.md
```

---

## Tools & Technologies

- MySQL Workbench
- SQL
- Git
- GitHub

---

##  Concepts Covered

### Section A - SQL Basics
- SELECT Statements
- Primary Keys
- Constraints
- Table Exploration

### Section B - Filtering & Optimization
- WHERE Clause
- BETWEEN Operator
- Logical Operators (AND, OR)
- Index Usage
- Query Optimization

### Section C - Aggregation
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()
- GROUP BY
- HAVING

### Section D - Joins & Relationships
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Foreign Keys
- Referential Integrity

### Section E - Advanced SQL
- CASE Statements
- Transactions
- COMMIT
- ROLLBACK
- ACID Properties

---

## How to Run

### Step 1: Create Database

```sql
CREATE DATABASE shopease_db;
USE shopease_db;
```

### Step 2: Execute Database Script

Run:

```text
database.sql
```

This script will:

- Create all tables
- Create indexes
- Insert sample data

### Step 3: Verify Data

Run:

```sql
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
```

### Step 4: Execute Queries

Run SQL files from each section:

```text
Section_A/basic_queries.sql
Section_B/filtering_queries.sql
Section_C/aggregation_queries.sql
Section_D/joins_queries.sql
Section_E/advanced_queries.sql
```

---

## Key Business Insights

- Delivered orders contribute the highest revenue.
- Electronics products generally have higher prices than other categories.
- Aggregation helps identify top-performing categories and sales trends.
- Joins help combine customer, order, and product information for business reporting.
- Transactions ensure data consistency and reliability.

---

## Learning Outcomes

Through this assignment, I learned:

- Relational database design
- SQL querying techniques
- Data filtering and aggregation
- Working with joins and relationships
- Query optimization using indexes
- Transaction management
- Applying SQL to solve business problems

---

## Assignment Deliverables

✔ Database Creation Script (`database.sql`)

✔ Section A - Basic Queries

✔ Section B - Filtering Queries

✔ Section C - Aggregation Queries

✔ Section D - Join Queries

✔ Section E - Advanced Queries

✔ README Documentation

---

## Repository

This project is part of the **Celebal Technologies Internship 2026** repository.

**Week:** 2  
**Assignment:** SQL-Based Data Analysis Using Filtering, Aggregation, and Business Queries

---

**Celebal Technologies Internship 2026**