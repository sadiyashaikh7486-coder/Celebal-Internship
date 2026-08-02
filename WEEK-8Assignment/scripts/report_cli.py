import argparse
import sqlite3
from tabulate import tabulate

# -----------------------------
# Database Connection
# -----------------------------
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB_PATH = os.path.join(BASE_DIR, "database", "ecommerce.db")

try:
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
except sqlite3.Error as e:
    print("Database Connection Error:", e)
    exit()


# -----------------------------
# Function to Run Query
# -----------------------------
def run_query(query):
    try:
        cursor.execute(query)
        rows = cursor.fetchall()

        if not rows:
            print("No data found.")
            return

        headers = [desc[0] for desc in cursor.description]
        print(tabulate(rows, headers=headers, tablefmt="grid"))

    except sqlite3.Error as e:
        print("Query Error:", e)


# -----------------------------
# Command Line Arguments
# -----------------------------
parser = argparse.ArgumentParser(
    description="E-Commerce Analytics Reporting Tool"
)

parser.add_argument(
    "--report",
    required=True,
    choices=["revenue", "top_products", "retention"],
    help="Choose report: revenue, top_products, retention"
)

args = parser.parse_args()


# -----------------------------
# Revenue Report
# -----------------------------
if args.report == "revenue":

    query = """
    SELECT
        c.customer_id,
        c.name,
        ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.name
    ORDER BY total_revenue DESC
    LIMIT 10;
    """

    print("\nTOP 10 CUSTOMERS BY REVENUE\n")
    run_query(query)


# -----------------------------
# Top Products Report
# -----------------------------
elif args.report == "top_products":

    query = """
    SELECT
        p.product_name,
        SUM(oi.quantity) AS quantity_sold
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_name
    ORDER BY quantity_sold DESC
    LIMIT 10;
    """

    print("\nTOP 10 PRODUCTS\n")
    run_query(query)


# -----------------------------
# Retention Report
# -----------------------------
elif args.report == "retention":

    query = """
    WITH customer_orders AS (
        SELECT
            customer_id,
            strftime('%Y-%m', order_date) AS order_month
        FROM orders
    )

    SELECT
        order_month,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM customer_orders
    GROUP BY order_month
    ORDER BY order_month;
    """

    print("\nMONTHLY RETENTION REPORT\n")
    run_query(query)


# -----------------------------
# Close Connection
# -----------------------------
conn.close()