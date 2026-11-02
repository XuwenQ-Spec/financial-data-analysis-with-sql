-- Compare invoice amounts with cumulative customer receipts as of 2026-06-30.
WITH payment_by_invoice AS (
    SELECT
        invoice_id,
        SUM(payment_amount) AS total_paid
    FROM payments
    WHERE payment_date <= '2026-06-30'
    GROUP BY invoice_id
)
SELECT
    i.invoice_id,
    i.order_id,
    i.invoice_amount,
    COALESCE(p.total_paid, 0) AS total_paid,
    ROUND(i.invoice_amount - COALESCE(p.total_paid, 0), 2) AS outstanding_amount,
    ROUND(COALESCE(p.total_paid, 0) - i.invoice_amount, 2) AS excess_payment,
    CASE
        WHEN COALESCE(p.total_paid, 0) = 0 THEN 'UNPAID'
        WHEN COALESCE(p.total_paid, 0) < i.invoice_amount THEN 'PARTIALLY_PAID'
        WHEN COALESCE(p.total_paid, 0) = i.invoice_amount THEN 'FULLY_PAID'
        ELSE 'EXCESS_PAYMENT'
    END AS payment_status
FROM invoices i
LEFT JOIN payment_by_invoice p ON p.invoice_id = i.invoice_id
ORDER BY i.invoice_id;
