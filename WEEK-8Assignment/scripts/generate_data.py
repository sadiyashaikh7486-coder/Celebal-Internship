import pandas as pd
from faker import Faker
import random
import os

# Create Faker object
fake = Faker()

# Create folder if it doesn't exist
os.makedirs("data/raw", exist_ok=True)

customers = []

# Generate 1000 customers
for i in range(1, 1001):
    customers.append({
        "customer_id": i,
        "name": fake.name(),
        "email": fake.email(),
        "city": fake.city(),
        "state": fake.state(),
        "country": fake.country(),
        "signup_date": fake.date_between(start_date='-3y', end_date='today')
    })

# Convert to DataFrame
customers_df = pd.DataFrame(customers)

# Save CSV
customers_df.to_csv("data/raw/customers.csv", index=False)

print("customers.csv created successfully!")
print(customers_df.head())

# -----------------------------
# Generate Products Dataset
# -----------------------------

categories = [
    "Electronics",
    "Fashion",
    "Books",
    "Home",
    "Beauty",
    "Sports",
    "Grocery"
]

products = []

for i in range(1, 301):
    products.append({
        "product_id": i,
        "product_name": fake.word().capitalize() + " Product",
        "category": random.choice(categories),
        "price": round(random.uniform(100, 5000), 2),
        "stock": random.randint(10, 500)
    })

products_df = pd.DataFrame(products)

products_df.to_csv("data/raw/products.csv", index=False)

print("products.csv created successfully!")
print(products_df.head())

# -----------------------------
# Generate Orders Dataset
# -----------------------------

orders = []

order_status = [
    "Delivered",
    "Pending",
    "Cancelled",
    "Returned"
]

payment_methods = [
    "Credit Card",
    "Debit Card",
    "UPI",
    "Net Banking",
    "Cash on Delivery"
]

for i in range(1, 5001):

    customer_id = random.randint(1, 1000)

    orders.append({
        "order_id": i,
        "customer_id": customer_id,
        "order_date": fake.date_between(start_date='-2y', end_date='today'),
        "status": random.choice(order_status),
        "payment_method": random.choice(payment_methods)
    })

orders_df = pd.DataFrame(orders)

orders_df.to_csv("data/raw/orders.csv", index=False)

print("orders.csv created successfully!")
print(orders_df.head())

# -----------------------------
# Generate Order Items Dataset
# -----------------------------

order_items = []

item_id = 1

for order_id in range(1, 5001):

    # Each order has 1 to 5 products
    number_of_items = random.randint(1, 5)

    selected_products = random.sample(range(1, 301), number_of_items)

    for product_id in selected_products:

        price = round(random.uniform(100, 5000), 2)

        order_items.append({
            "item_id": item_id,
            "order_id": order_id,
            "product_id": product_id,
            "quantity": random.randint(1, 5),
            "unit_price": price
        })

        item_id += 1

order_items_df = pd.DataFrame(order_items)

order_items_df.to_csv("data/raw/order_items.csv", index=False)

print("order_items.csv created successfully!")
print(order_items_df.head())