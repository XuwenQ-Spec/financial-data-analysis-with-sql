# Financial Data Analysis with SQL

**A Practical Financial Data Analytics Project Using SQLite and SQL**

## 1. Project Overview

This project demonstrates how SQL can be applied to financial data analysis using a simulated relational database containing customer information, sales orders, invoices, and payment records.

The project focuses on financial data reconciliation, accounts receivable analysis, customer sales concentration, and payment exception identification.

All datasets are simulated and created for educational and portfolio purposes.

## 2. Project Objectives

- Analyze monthly sales order amounts and trends.
- Reconcile sales orders with issued invoices.
- Identify uninvoiced orders and invoice amount discrepancies.
- Analyze accounts receivable aging and outstanding balances.
- Evaluate customer sales concentration and cumulative sales contribution.
- Identify unpaid invoices, partial payments, and excess customer payments.

## 3. Technology Stack

| Technology | Application |
|---|---|
| SQLite | Relational database management |
| SQL | Data querying and financial analysis |
| DB Browser for SQLite | Database management and query execution |
| Excel | Data review and result validation |

### SQL Techniques

- SELECT, WHERE and ORDER BY
- GROUP BY and aggregate functions (SUM, COUNT)
- INNER JOIN and LEFT JOIN
- Common Table Expressions (CTEs)
- CASE WHEN and COALESCE
- Window Functions (OVER)
- Date calculations and conditional aggregation

## 4. Database Structure

The database consists of four relational tables:

| Table | Description |
|---|---|
| customers | Customer master information |
| orders | Sales order records |
| invoices | Sales invoice records |
| payments | Customer payment records |

Dataset overview:

- 8 simulated customers
- 24 sales orders
- 21 sales invoices
- 18 payment records

## 5. Key Analysis Modules and Results

### 5.1 Monthly Sales Order Analysis

Aggregated sales order amounts and order counts by month.

**Key result:**
- Total orders: 24
- Total order amount: 2,102,000
- Analysis period: January–June 2026

### 5.2 Order-Invoice Reconciliation

Used LEFT JOIN and conditional logic to identify missing invoices and discrepancies between order amounts and invoiced amounts.

**Key findings:**
- 3 uninvoiced orders, totaling 197,000
- 1 under-invoiced order, with a difference of 5,000
- 4 exception records identified

### 5.3 Accounts Receivable Aging Analysis

Calculated outstanding receivables and classified balances by overdue periods as of June 30, 2026.

| Aging Category | Outstanding Amount |
|---|---:|
| Not Due | 463,000 |
| 1–30 Days | 55,000 |
| 31–60 Days | 119,000 |
| 61–90 Days | 0 |
| Over 90 Days | 103,000 |
| **Total** | **740,000** |

### 5.4 Customer Sales Concentration Analysis

Calculated customer-level order amounts, sales contribution percentages, and cumulative sales concentration using SQL window functions.

**Key findings:**
- Largest customer's sales share: 29.02%
- Top three customers' cumulative sales share: 62.70%

### 5.5 Payment Reconciliation and Exception Identification

Compared invoice amounts with cumulative customer receipts to identify payment statuses and excess receipts.

| Payment Status | Invoice Count |
|---|---:|
| Fully Paid | 8 |
| Partially Paid | 4 |
| Unpaid | 6 |
| Excess Payment | 3 |
| **Total** | **21** |

**Key finding:**

Three excess payment records were identified, with a combined excess amount of 9,000.

## 6. Repository Structure

```text
financial-data-analysis-with-sql/
│
├── data/
│   ├── customers.csv
│   ├── orders.csv
│   ├── invoices.csv
│   └── payments.csv
│
├── database/
│   └── financial_analysis.db
│
├── docs/
│   ├── data_dictionary.md
│   └── setup_guide_zh.md
│
├── results/
│   ├── 02_monthly_sales.csv
│   ├── 03_order_invoice_reconciliation.csv
│   ├── 04_ar_aging.csv
│   ├── 05_customer_concentration.csv
│   └── 06_payment_reconciliation.csv
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_monthly_sales.sql
│   ├── 03_order_invoice_reconciliation.sql
│   ├── 04_ar_aging.sql
│   ├── 05_customer_concentration.sql
│   └── 06_payment_reconciliation.sql
│
└── README.md
```

## 7. How to Run

1. Download or clone this repository.
2. Open `database/financial_analysis.db` using DB Browser for SQLite.
3. Navigate to the Execute SQL tab.
4. Run the SQL scripts in the `sql/` directory.
5. Review the query results and compare them with the sample outputs in `results/`.

Alternatively, create a new SQLite database, execute `01_create_tables.sql`, and import the four CSV files from `data/`.

**Note:** `01_create_tables.sql` contains DROP TABLE statements for initializing a database. Run it only on a new or disposable database, not on an existing database containing records.

## 8. Skills Demonstrated

- Relational database design and data management
- SQL querying and multi-table data integration
- Financial data aggregation and reconciliation
- Accounts receivable aging analysis
- Customer sales concentration analysis
- Financial exception identification and reporting

## 9. Data Disclaimer

All customer names, transaction records, dates, and monetary amounts are fictional and generated for educational and portfolio demonstration purposes.

No actual company financial information, confidential business records, or client data are included.

**Reference date:** June 30, 2026.
