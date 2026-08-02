# E-Commerce Order Analytics System

**Author:** Sadiya  
**Project:** WEEK-8 Assignment – End-to-End E-Commerce Order Analytics System

---

# Project Overview

This project is an end-to-end E-Commerce Order Analytics System developed using **Python, Pandas, SQLite, and SQL**. It simulates a real-world e-commerce business by generating realistic datasets, cleaning and validating the data, loading it into a relational database, performing SQL analytics, and generating business reports through a Command Line Interface (CLI).

The project demonstrates the complete data analytics workflow from raw data generation to business reporting.

---

# Objective

Design and develop an end-to-end e-commerce order analytics system combining Python and SQL—from dataset generation to business reporting.

---

# Technologies Used

- Python 3.11
- Pandas
- NumPy
- Faker
- SQLite
- SQL
- SQLAlchemy
- Tabulate
- DB Browser for SQLite
- Visual Studio Code

---

# Project Structure

```text
WEEK-8Assignment/
│
├── database/
│   └── ecommerce.db
│
├── data/
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│   │
│   └── cleaned/
│       ├── customers_clean.csv
│       ├── products_clean.csv
│       ├── orders_clean.csv
│       └── order_items_clean.csv
│
├── scripts/
│   ├── generate_data.py
│   ├── clean_data.py
│   └── report_cli.py
│
├── sql/
│   ├── schema.sql
│   ├── aggregations.sql
│   ├── window_functions.sql
│   ├── cohort_analysis.sql
│   └── customer_segmentation.sql
│
├── output/
│   └── sample_reports/
│       ├── revenue_report.png
│       ├── top_products_report.png
│       ├── retention_report.png
│       ├── sql_analytics.png
│       ├── database_tables.png
│       └── sample_output.md
│
└── README.md
```

---

# System Architecture

```
Generate Realistic Data
          │
          ▼
     Raw CSV Files
          │
          ▼
 Data Cleaning (Pandas)
          │
          ▼
   Cleaned CSV Files
          │
          ▼
     SQLite Database
          │
          ▼
      SQL Analytics
          │
          ▼
     Business Reports
          │
          ▼
      CLI Reporting
```

---

# Features

- Generate realistic e-commerce datasets using Faker
- Introduce intentional inconsistencies
- Clean and validate data using Pandas
- Validate referential integrity
- Store cleaned data in SQLite
- SQL Joins and Aggregations
- Window Functions
- Common Table Expressions (CTEs)
- Cohort Analysis
- Customer Segmentation
- Command Line Reporting Tool
- Edge Case Handling

---

# Database Tables

The project contains four relational tables:

- Customers
- Products
- Orders
- Order Items

Relationships:

- One Customer → Many Orders
- One Order → Many Order Items
- One Product → Many Order Items

---

# SQL Analytics Performed

The project performs the following business analyses:

- Total Revenue per Customer
- Revenue per Product Category
- Monthly Revenue Trends
- Top Selling Products
- Average Order Value (AOV)
- Customer Lifetime Value Ranking
- Running Revenue Total
- Moving Average Revenue
- Cohort Analysis
- Customer Retention Analysis
- Customer Segmentation
- RFM (Recency, Frequency, Monetary) Analysis

---

# Edge Case Handling

The system handles multiple edge cases including:

- Missing values
- Duplicate records
- Invalid customer IDs
- Invalid product IDs
- Future order dates
- Invalid prices
- Invalid quantities
- Empty query results
- Invalid CLI inputs
- Database connection errors

---

# How to Run the Project

## Step 1: Create Virtual Environment

```bash
python -m venv venv
```

---

## Step 2: Activate Virtual Environment

Windows

```bash
venv\Scripts\activate
```

---

## Step 3: Install Required Libraries

```bash
pip install pandas numpy faker sqlalchemy tabulate
```

---

## Step 4: Generate Raw Dataset

```bash
python scripts/generate_data.py
```

---

## Step 5: Clean Dataset

```bash
python scripts/clean_data.py
```

---

## Step 6: Create SQLite Database

Open **DB Browser for SQLite**.

Execute:

```
sql/schema.sql
```

Import all cleaned CSV files into their respective tables.

Click **Write Changes** to save the database.

---

## Step 7: Run CLI Reports

### Revenue Report

```bash
python scripts/report_cli.py --report revenue
```

### Top Products Report

```bash
python scripts/report_cli.py --report top_products
```

### Retention Report

```bash
python scripts/report_cli.py --report retention
```

---

# Sample Outputs

The **output/sample_reports/** folder contains:

- Revenue Report Screenshot
- Top Products Report Screenshot
- Retention Report Screenshot
- SQL Analytics Screenshot
- Database Tables Screenshot
- **sample_output.md** (Sample CLI output and report summary)

---

# Conclusion

This project demonstrates a complete end-to-end e-commerce analytics workflow using Python and SQL. It includes realistic data generation, data cleaning, SQL-based business analytics, customer segmentation, cohort analysis, and automated reporting through a command-line interface. The project highlights practical data engineering and analytics techniques used in real-world business environments.

---

# Author

**Sadiya**

**WEEK-8 Assignment**

**End-to-End E-Commerce Order Analytics System**