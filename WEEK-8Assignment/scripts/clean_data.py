import pandas as pd

# Load Raw CSV Files
customers = pd.read_csv("data/raw/customers.csv")
products = pd.read_csv("data/raw/products.csv")
orders = pd.read_csv("data/raw/orders.csv")
order_items = pd.read_csv("data/raw/order_items.csv")

print("Customers :", customers.shape)
print("Products :", products.shape)
print("Orders :", orders.shape)
print("Order Items :", order_items.shape)

# -----------------------------
# Clean Customers Data
# -----------------------------

# Remove duplicate customer IDs
customers.drop_duplicates(subset="customer_id", inplace=True)

# Remove duplicate emails
customers.drop_duplicates(subset="email", inplace=True)

# Fill missing city values
customers["city"].fillna("Unknown", inplace=True)

# Convert signup_date to datetime
customers["signup_date"] = pd.to_datetime(
    customers["signup_date"],
    errors="coerce"
)

print("\nCustomers cleaned successfully!")

# -----------------------------
# Clean Products Data
# -----------------------------

# Remove duplicate products
products.drop_duplicates(subset="product_id", inplace=True)

# Remove negative prices
products = products[products["price"] > 0]

# Fill missing category
products["category"].fillna("Unknown", inplace=True)

print("Products cleaned successfully!")

# -----------------------------
# Clean Orders Data
# -----------------------------

orders.drop_duplicates(subset="order_id", inplace=True)

orders["order_date"] = pd.to_datetime(
    orders["order_date"],
    errors="coerce"
)
# Remove future dates
today = pd.Timestamp.today()

orders = orders[
    orders["order_date"] <= today
]

print("Future dates removed.")

# Keep only orders whose customer_id exists in customers
orders = orders[
    orders["customer_id"].isin(customers["customer_id"])
]

print("Invalid customer IDs removed from orders.")
print("Orders cleaned successfully!")

# -----------------------------
# Clean Order Items
# -----------------------------

order_items.drop_duplicates(inplace=True)

order_items = order_items[
    order_items["quantity"] > 0
]
# Remove invalid prices
order_items = order_items[
    order_items["unit_price"] > 0
]

print("Invalid prices removed.")
# Keep only order_items whose order_id exists
order_items = order_items[
    order_items["order_id"].isin(orders["order_id"])
]

# Keep only order_items whose product_id exists
order_items = order_items[
    order_items["product_id"].isin(products["product_id"])
]

print("Referential integrity validated.")

print("Order Items cleaned successfully!")

# -----------------------------
# Save Cleaned Data
# -----------------------------

customers.to_csv(
    "data/cleaned/customers_clean.csv",
    index=False
)

products.to_csv(
    "data/cleaned/products_clean.csv",
    index=False
)

orders.to_csv(
    "data/cleaned/orders_clean.csv",
    index=False
)

order_items.to_csv(
    "data/cleaned/order_items_clean.csv",
    index=False
)

print("\nAll cleaned files saved successfully!")
