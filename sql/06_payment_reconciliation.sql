WITH payment_summary AS (
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
    c.customer_name,
    i.invoice_amount,
    COALESCE(p.total_paid, 0) AS total_paid,

    ROUND(MAX(
        i.invoice_amount -
        COALESCE(p.total_paid, 0), 0
    ), 2) AS outstanding_amount,

    ROUND(MAX(
        COALESCE(p.total_paid, 0) -
        i.invoice_amount, 0
    ), 2) AS excess_payment,

    CASE
        WHEN COALESCE(p.total_paid, 0) = 0
            THEN 'UNPAID'
        WHEN COALESCE(p.total_paid, 0) < i.invoice_amount
            THEN 'PARTIALLY_PAID'
        WHEN COALESCE(p.total_paid, 0) = i.invoice_amount
            THEN 'FULLY_PAID'
        ELSE 'EXCESS_PAYMENT'
    END AS payment_status

FROM invoices i

LEFT JOIN payment_summary p
    ON i.invoice_id = p.invoice_id

JOIN orders o
    ON i.order_id = o.order_id

JOIN customers c
    ON o.customer_id = c.customer_id

ORDER BY i.invoice_id;
