# Week 5: Apache Spark Data Cleaning and Transformation

**Author:** Sadiya Shaikh

## Overview

This repository contains my **Week 5 Assignment** completed as part of the **Celebal Technologies Data Engineering Internship**.

The aim of this assignment is to learn the fundamentals of **Apache Spark** and perform data cleaning, transformation, filtering, and analysis using **PySpark DataFrames**. A sales dataset containing approximately **8,000 records** is processed through an end-to-end data pipeline implemented in a Jupyter Notebook.

**Project Details**

* **Folder Name:** `WEEK-5_Assignment`
* **Notebook File:** `Notebook/Spark.ipynb`

---

## Objectives

The primary objectives of this assignment are to:

* Understand the limitations of the MapReduce programming model.
* Learn the advantages and architecture of Apache Spark.
* Create and manipulate Spark DataFrames.
* Explore the dataset structure and schema.
* Handle missing, null, and inconsistent values.
* Remove duplicate records.
* Apply filtering using different conditions.
* Rename columns for better readability.
* Convert columns to appropriate data types.
* Perform aggregation operations such as sum, average, minimum, and maximum.
* Group data using `groupBy()` for analysis.
* Apply conditions on grouped results.
* Understand Spark transformations, actions, and shuffle operations.
* Build a complete data processing workflow using PySpark.
* Save the processed data for further analysis.

---

## Technologies Used

* Python
* Apache Spark
* PySpark
* Jupyter Notebook
* Pandas
* CSV Dataset
* GitHub

---

## Dataset Description

The project uses a sales dataset containing approximately **8,000 records**.

The dataset includes the following fields:

* Order ID
* Customer ID
* Customer Name
* Age
* Category
* Region
* Store ID
* Product
* Quantity
* Price
* Discount
* Revenue

The dataset contains missing values, duplicate records, empty fields, and inconsistent data, making it suitable for practicing various data cleaning and transformation techniques using PySpark.

---

## Project Workflow

The workflow followed in this assignment includes:

1. Loading the dataset into a Spark DataFrame.
2. Exploring the schema and dataset structure.
3. Cleaning missing and invalid values.
4. Removing duplicate records.
5. Renaming and casting columns to appropriate data types.
6. Applying filters based on different conditions.
7. Performing aggregation and grouping operations.
8. Analyzing the transformed data.
9. Saving the processed output as a CSV file.

---

## Project Structure

```text
WEEK-5_Assignment/
│
├── Data/
│   └── sales_dataset_8000.csv
│
├── Notebook/
│   └── Spark.ipynb
│
├── Output/
│   └── results.csv
│
└── README.md
```

---

## Learning Outcomes

By completing this assignment, I gained practical experience in:

* Apache Spark fundamentals
* Working with PySpark DataFrames
* Data cleaning and preprocessing
* Data transformation techniques
* Filtering and conditional operations
* Aggregation and grouping using `groupBy()`
* Understanding Spark transformations and actions
* Building an end-to-end Spark data processing pipeline

---

## Conclusion

This project provided hands-on experience with Apache Spark and PySpark by implementing a complete data cleaning and transformation pipeline. It strengthened my understanding of distributed data processing, DataFrame operations, and analytical techniques used in modern data engineering workflows.
