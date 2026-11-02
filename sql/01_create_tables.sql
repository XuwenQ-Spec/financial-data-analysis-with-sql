-- Create the four relational tables for the simulated finance dataset.
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    industry TEXT,
    region TEXT
);

CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT NOT NULL,
    order_date TEXT NOT NULL,
    order_amount NUMERIC NOT NULL CHECK (order_amount >= 0),
    order_status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE invoices (
    invoice_id TEXT PRIMARY KEY,
    order_id TEXT NOT NULL,
    invoice_date TEXT NOT NULL,
    due_date TEXT NOT NULL,
    invoice_amount NUMERIC NOT NULL CHECK (invoice_amount >= 0),
    invoice_status TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments (
    payment_id TEXT PRIMARY KEY,
    invoice_id TEXT NOT NULL,
    payment_date TEXT NOT NULL,
    payment_amount NUMERIC NOT NULL CHECK (payment_amount >= 0),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id)
);

CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_invoices_order ON invoices(order_id);
CREATE INDEX idx_payments_invoice ON payments(invoice_id);
