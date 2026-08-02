DROP TABLE IF EXISTS customers;

CREATE TABLE customers (

    customer_id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    email TEXT UNIQUE,

    city TEXT,

    state TEXT,

    country TEXT,

    signup_date DATE

);

DROP TABLE IF EXISTS products;

CREATE TABLE products (

    product_id INTEGER PRIMARY KEY,

    product_name TEXT NOT NULL,

    category TEXT,

    price REAL NOT NULL,

    stock INTEGER

);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (

    order_id INTEGER PRIMARY KEY,

    customer_id INTEGER NOT NULL,

    order_date DATE,

    status TEXT,

    payment_method TEXT,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)

);

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (

    item_id INTEGER PRIMARY KEY,

    order_id INTEGER NOT NULL,

    product_id INTEGER NOT NULL,

    quantity INTEGER,

    unit_price REAL,

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
        REFERENCES products(product_id)

);