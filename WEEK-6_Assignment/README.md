# Week 6 — Spark Transaction Processing Pipeline

A PySpark pipeline that reads transaction data, transforms it, filters out invalid rows, and saves the cleaned result as a CSV file.

**Author:** Sadiya Shaikh
**Assignment:** Week 6 — Spark Architecture & Efficient Data Processing
**Dataset:** `synthetic_transactions_5000.csv` (5,000 rows, 20 columns)

## Overview

This project demonstrates core Apache Spark concepts — architecture, lazy evaluation, schema handling, transformations, filtering, wide vs narrow operations, and file format optimization — applied to a real transaction dataset using PySpark.

## Folder Structure

```
WEEK-6_Assignment/
│
├── README.md                          # This file
├── week6_pipeline.py                  # Main pipeline script (read → transform → filter → save)
├── Week6_Spark_Pipeline.md            # Step-by-step write-up: explanations, code, and execution output
├── synthetic_transactions_5000.csv    # Source dataset (input)
│
└── output/
    └── cleaned_transactions.csv       # Final cleaned output (generated after running the script)
```

## What this does

1. Reads `synthetic_transactions_5000.csv` with an explicit schema (no `inferSchema` overhead).
2. Renames `sell_amount` → `total_amount`.
3. Casts `price` to `double`.
4. Adds a new column `final_price` = `base_price` × 1.18 (18% tax).
5. Filters out rows with null `userid` or `total_amount`.
6. Saves the cleaned data to `output/cleaned_transactions.csv`.

## Requirements

- Python 3.11
- Java 17 (JDK)
- PySpark (`pip install pyspark`)
- pandas (`pip install pandas`)

## Environment setup (Windows)

These environment variables must be set under **System Properties → Environment Variables**, then your terminal/Jupyter kernel restarted:

| Variable | Example value |
|---|---|
| `JAVA_HOME` | `C:\Program Files\Java\jdk-17` |
| `SPARK_HOME` | `<path to your pyspark install>\Lib\site-packages\pyspark` |
| `PYSPARK_PYTHON` | `<path to>\python.exe` |
| `PYSPARK_DRIVER_PYTHON` | `<path to>\python.exe` |

Find your pyspark install path with:
```bash
python -c "import pyspark, os; print(os.path.dirname(pyspark.__file__))"
```

> **Note on Hadoop/winutils:** this pipeline deliberately avoids `df.write.csv(...)` because Spark's native write path requires Hadoop's `winutils.exe` on Windows. Instead, the final result is converted with `.toPandas()` and saved using pandas' `.to_csv()`, which needs no Hadoop setup. This is fine at this dataset's size (5,000 rows); for very large datasets, use Spark's native `.write.csv()` on a properly configured Hadoop/Linux environment instead.

## How to run

1. Update `input_path` in the script to point to your local copy of `synthetic_transactions_5000.csv`.
2. Run the script top to bottom in a single kernel session (or use "Run All" in Jupyter).
3. Output appears at:
   ```
   output/cleaned_transactions.csv
   ```

## Common issues

| Symptom | Cause | Fix |
|---|---|---|
| `ConnectionRefusedError` on `getOrCreate()` | JVM never started | Check `JAVA_HOME`/`SPARK_HOME` are set correctly, restart terminal |
| `Missing Python executable 'python3'` | Windows only has `python.exe` | Set `PYSPARK_PYTHON` explicitly |
| `AnalysisException: PATH_NOT_FOUND` | Wrong/relative file path, or file not created yet | Use full path or run the write step before the read step |
| `NameError: name 'col' is not defined` | Missing import | `from pyspark.sql.functions import col` |
| `NameError: name 'df_clean' is not defined` | Kernel restarted, losing variables | Re-run all cells top to bottom |
| Hadoop/`winutils` errors on write | Spark's native CSV/Parquet writer needs Hadoop on Windows | Use `.toPandas().to_csv(...)` instead (already done in this script) |

---
**Author:** Sadiya Shaikh