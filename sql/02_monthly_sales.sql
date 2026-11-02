-- Monthly sales order amount and order count.
SELECT
    strftime('%Y-%m', order_date) AS sales_month,
    COUNT(*) AS order_count,
    ROUND(SUM(order_amount), 2) AS total_order_amount
FROM orders
GROUP BY strftime('%Y-%m', order_date)
ORDER BY sales_month;
