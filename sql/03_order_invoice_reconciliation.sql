-- Compare each order with the total invoice amount linked to it.
WITH invoice_by_order AS (
    SELECT
        order_id,
        COUNT(*) AS invoice_count,
        SUM(invoice_amount) AS total_invoiced
    FROM invoices
    GROUP BY order_id
)
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_amount,
    COALESCE(i.invoice_count, 0) AS invoice_count,
    COALESCE(i.total_invoiced, 0) AS total_invoiced,
    ROUND(o.order_amount - COALESCE(i.total_invoiced, 0), 2) AS order_invoice_difference,
    CASE
        WHEN i.order_id IS NULL THEN 'UNINVOICED'
        WHEN ABS(o.order_amount - COALESCE(i.total_invoiced, 0)) < 0.01 THEN 'MATCHED'
        WHEN o.order_amount > COALESCE(i.total_invoiced, 0) THEN 'UNDER_INVOICED'
        ELSE 'OVER_INVOICED'
    END AS reconciliation_status
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
LEFT JOIN invoice_by_order i ON i.order_id = o.order_id
ORDER BY o.order_date, o.order_id;
