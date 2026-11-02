-- Accounts receivable aging as of 2026-06-30.
WITH payment_by_invoice AS (
    SELECT invoice_id, SUM(payment_amount) AS total_paid
    FROM payments
    WHERE payment_date <= '2026-06-30'
    GROUP BY invoice_id
),
invoice_balance AS (
    SELECT
        i.invoice_id,
        i.order_id,
        i.invoice_date,
        i.due_date,
        i.invoice_amount,
        COALESCE(p.total_paid, 0) AS total_paid,
        ROUND(i.invoice_amount - COALESCE(p.total_paid, 0), 2) AS outstanding_amount,
        CASE
            WHEN julianday('2026-06-30') <= julianday(i.due_date) THEN 0
            ELSE CAST(julianday('2026-06-30') - julianday(i.due_date) AS INTEGER)
        END AS days_overdue
    FROM invoices i
    LEFT JOIN payment_by_invoice p ON p.invoice_id = i.invoice_id
)
SELECT
    invoice_id,
    order_id,
    invoice_date,
    due_date,
    invoice_amount,
    total_paid,
    outstanding_amount,
    days_overdue,
    CASE
        WHEN days_overdue = 0 THEN 'Not Due'
        WHEN days_overdue <= 30 THEN '1-30 days'
        WHEN days_overdue <= 60 THEN '31-60 days'
        WHEN days_overdue <= 90 THEN '61-90 days'
        ELSE '90+ days'
    END AS aging_bucket
FROM invoice_balance
WHERE outstanding_amount > 0
ORDER BY days_overdue DESC, outstanding_amount DESC;
