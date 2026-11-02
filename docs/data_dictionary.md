# Data Dictionary

All records are fictional. Monetary values are expressed in the same unspecified currency unit for demonstration purposes.

## customers
| Field | Type | Description |
|---|---|---|
| customer_id | TEXT | Unique customer identifier |
| customer_name | TEXT | Fictional customer name |
| industry | TEXT | Customer industry |
| region | TEXT | Broad region |

## orders
| Field | Type | Description |
|---|---|---|
| order_id | TEXT | Unique order identifier |
| customer_id | TEXT | Links to customers.customer_id |
| order_date | TEXT | Order date, YYYY-MM-DD |
| order_amount | NUMERIC | Total order amount |
| order_status | TEXT | Simulated order status |

## invoices
| Field | Type | Description |
|---|---|---|
| invoice_id | TEXT | Unique invoice identifier |
| order_id | TEXT | Links to orders.order_id |
| invoice_date | TEXT | Invoice issue date |
| due_date | TEXT | Contractual payment due date |
| invoice_amount | NUMERIC | Invoice amount |
| invoice_status | TEXT | Simulated invoice status |

## payments
| Field | Type | Description |
|---|---|---|
| payment_id | TEXT | Unique receipt identifier |
| invoice_id | TEXT | Links to invoices.invoice_id |
| payment_date | TEXT | Date cash was received |
| payment_amount | NUMERIC | Amount received |

## Notes
- `orders` to `invoices` is modeled as one-to-many to support partial invoicing in future extensions.
- `invoices` to `payments` is one-to-many to support installment receipts.
- The AR aging analysis uses 2026-06-30 as its reference date.
- Overpayments are shown as negative outstanding balances in payment reconciliation and are excluded from positive AR aging balances.
