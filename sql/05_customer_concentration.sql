-- Customer sales concentration based on order amount.
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.order_amount) AS customer_order_amount,
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
),
sales_total AS (
    SELECT SUM(customer_order_amount) AS total_sales
    FROM customer_sales
)
SELECT
    cs.customer_id,
    cs.customer_name,
    cs.order_count,
    ROUND(cs.customer_order_amount, 2) AS customer_order_amount,
    ROUND(cs.customer_order_amount * 100.0 / st.total_sales, 2) AS sales_share_pct,
    ROUND(
        SUM(cs.customer_order_amount) OVER (
            ORDER BY cs.customer_order_amount DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) * 100.0 / st.total_sales,
        2
    ) AS cumulative_sales_share_pct
FROM customer_sales cs
CROSS JOIN sales_total st
ORDER BY cs.customer_order_amount DESC;
