# Delta Lake Incremental Data Processing Assignment

## Author

**Name:** Sadiya Shaikh

## Objective

The objective of this assignment is to perform incremental data processing using Delta Lake in Databricks Free Edition. The project demonstrates loading data into a Delta table, cleaning the data, processing incremental records using the MERGE operation, and validating the final dataset.

---

## Tools & Technologies

- Databricks Free Edition
- Apache Spark (PySpark)
- Delta Lake
- Python
- Git & GitHub

---

## Project Structure

```
delta-lake-assignment/
│
├── data/
│   ├── customer_master.csv
│   └── customer_incremental.csv
│
├── notebooks/
│   └── delta_scd_assignment.ipynb
│
├── screenshots/
│   ├── data_loading/
│   ├── data_cleaning/
│   ├── merge/
│   ├── validation/
│   └── final_output/
│
└── README.md
```

---

## Assignment Workflow

### 1. Data Loading
- Uploaded the datasets to Databricks Unity Catalog Volume.
- Loaded the CSV files into PySpark DataFrames.

### 2. Data Cleaning
- Removed duplicate records.
- Handled missing (null) values.
- Removed invalid records where required.

### 3. Delta Table Creation
- Converted the cleaned master dataset into a Delta table.

### 4. Incremental Data Processing
- Loaded the incremental customer dataset.
- Performed the Delta Lake **MERGE** operation.
- Updated existing customer records.
- Inserted new customer records.

### 5. Validation
- Verified the final row count.
- Checked for duplicate customer IDs.
- Validated the final Delta table.

---

## Delta Lake MERGE Logic

- **Matched Records** → Existing customer information is updated.
- **Non-Matched Records** → New customer records are inserted.

---

## Output

The project includes:

- Databricks Notebook (.ipynb)
- Customer datasets
- Screenshots of each major step
- Final Delta table output

---

## Screenshots Included

- Data Loading
- Data Cleaning
- Delta Table Creation
- MERGE Operation
- Validation
- Final Output

---

## Conclusion

This project successfully demonstrates incremental data processing using Delta Lake in Databricks Free Edition. The MERGE operation efficiently updates existing records and inserts new records while maintaining data consistency and eliminating duplicate records.