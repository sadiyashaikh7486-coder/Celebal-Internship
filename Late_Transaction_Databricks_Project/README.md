# Late Transaction Data Processing Pipeline Using Databricks

**Project Name:**
Late Arriving Transaction Data Processing Pipeline Using Databricks

**Author:**  
Your Name

**Technology Stack:**  
Databricks | PySpark | Delta Lake | Auto Loader | Structured Streaming


## Project Description

This project implements an end-to-end data engineering pipeline using Databricks for processing transaction data.

The pipeline ingests CSV transaction data using Databricks Auto Loader, stores raw data in the Bronze layer, performs cleaning and transformation in the Silver layer, and creates business-level aggregation in the Gold layer.

The project also handles late-arriving transactions by identifying delayed records and updating affected data using Delta MERGE. Structured Streaming Watermark is implemented to process late-arriving events efficiently.

## Architecture

CSV Transaction File  
↓  
Databricks Auto Loader  
↓  
Bronze Delta Table  
(bronze_transactions)  
↓  
Silver Transformation  
(Data Cleaning & Validation)  
↓  
Silver Delta Table  
(silver_transactions)  
↓  
Gold Aggregation + Late Transaction Detection  
↓  
gold_daily_revenue + Delta MERGE Update  
↓  
Watermark Streaming  
↓  
watermark_gold_revenue


## Technologies Used

- Databricks
- Apache Spark
- PySpark
- Delta Lake
- Auto Loader
- Structured Streaming
- Watermark


## Data Source

Input File:

sales_2000_rows.csv

The transaction data contains:

- txn_id
- user_id
- txn_date
- amount
- ingestion_date


## Pipeline Implementation

The pipeline contains the following notebooks:

1. 01_Bronze_AutoLoader
2. 02_Silver
3. 03_Gold
4. 04_Late_Transaction
5. 05_Data_Quality
6. 06_Watermark


## Bronze Layer

The Bronze layer is responsible for raw data ingestion.

Databricks Auto Loader is used to automatically detect and load CSV files from the Volume location.

Implemented features:

- CSV ingestion
- Schema inference
- Schema location
- Checkpoint management
- Delta table creation

Bronze Table:

bronze_transactions


## Silver Layer

The Silver layer performs data cleaning and transformation.

Operations performed:

- Data type conversion
- Duplicate removal
- Data validation
- Invalid record handling

Silver Table:

silver_transactions


## Gold Layer

The Gold layer creates analytical data for reporting.

Daily revenue is calculated by aggregating transaction amounts based on transaction date.

Gold Table:

gold_daily_revenue


## Late Transaction Handling

Late transactions are identified by comparing transaction date and ingestion date.

Condition:

txn_date < ingestion_date


The process includes:

- Detecting late transactions
- Recalculating affected revenue
- Updating Gold data using Delta MERGE


## Watermark Streaming

Structured Streaming Watermark is implemented to handle late-arriving events.

Implementation includes:

- Streaming data processing
- Event time handling
- Watermark configuration
- Window aggregation
- Delta output storage


Watermark Table:

watermark_gold_revenue


## Data Quality Checks

The following checks were performed on Silver data:

| Check | Result |
|---|---|
| Total Records | 2000 |
| Null Transaction IDs | 0 |
| Duplicate Transaction IDs | 0 |
| Invalid Amount Records | 0 |


## Delta Tables Created

- bronze_transactions
- silver_transactions
- gold_daily_revenue
- watermark_gold_revenue


## Execution Flow

Run notebooks in this order:

01_Bronze_AutoLoader  
→ 02_Silver  
→ 03_Gold  
→ 04_Late_Transaction  
→ 05_Data_Quality  
→ 06_Watermark


## Project Outcome

This project successfully demonstrates an end-to-end Databricks data engineering pipeline using Medallion Architecture.

The solution provides:

- Automated data ingestion
- Data cleaning and transformation
- Business reporting
- Late transaction processing
- Delta MERGE updates
- Streaming watermark handling
- Data quality validation


## Conclusion

The project demonstrates practical implementation of modern data engineering concepts using Databricks, Spark, and Delta Lake. The pipeline is scalable, reliable, and suitable for real-world transaction data processing.