# Financial Data Analysis with SQL

**A Financial Data Analytics Project Using SQLite and SQL**

## 1. Project Overview

This project demonstrates the application of SQL in financial data analysis using simulated sales orders, invoices, and customer payment records.

The objective is to build a relational database using SQLite and perform financial data reconciliation, accounts receivable analysis, and customer sales analysis through SQL queries.

## 2. Project Objectives

- Analyze monthly sales order amounts and trends.
- Reconcile sales orders with issued invoices.
- Identify uninvoiced orders and invoice amount discrepancies.
- Analyze accounts receivable aging and outstanding balances.
- Evaluate customer sales concentration.
- Identify excess customer payments and potential reconciliation exceptions.

## 3. Technology Stack

- **Database:** SQLite
- **Query Language:** SQL
- **Data Analysis:** SQL aggregation, filtering, JOIN operations and conditional logic.
- **Database Tool:** DB Browser for SQLite

## 4. Database Structure

The project uses four relational tables:

| Table | Description |
|---|---|
| customers | Customer master data |
| orders | Sales order records |
| invoices | Sales invoice records |
| payments | Customer payment records |

## 5. Key Analysis Modules

### 5.1 Monthly Sales Analysis
Aggregate order amounts by month and analyze sales distribution.

### 5.2 Order-Invoice Reconciliation
Match orders with invoices and identify missing invoices and amount discrepancies.

### 5.3 Accounts Receivable Aging
Calculate outstanding receivables and classify balances by overdue periods.

### 5.4 Customer Concentration Analysis
Calculate customer-level sales contributions and identify major customer dependencies.

### 5.5 Payment Reconciliation
Compare invoice amounts with actual receipts and identify excess payments.

## 6. Project Structure

```text
financial-data-analysis-with-sql/
│
├── data/
│   ├── customers.csv
│   ├── orders.csv
│   ├── invoices.csv
│   └── payments.csv
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_monthly_sales.sql
│   ├── 03_order_invoice_reconciliation.sql
│   ├── 04_ar_aging.sql
│   └── 05_customer_concentration.sql
│
├── results/
│   └── analysis_outputs/
│
├── docs/
│   └── data_dictionary.md
│
└── README.md
```

## 7. Data & Methodology

All datasets in this project are simulated for educational and portfolio purposes. No real company financial information or confidential business records are used.

The analysis uses SQL queries to perform data aggregation, multi-table reconciliation, and financial exception identification.

**Analysis reference date:** June 30, 2026.

## 8. Expected Outcomes

This project aims to demonstrate practical SQL skills and the ability to translate financial business requirements into structured data analysis procedures.

The analysis results and SQL scripts will be documented and updated as the project develops.
