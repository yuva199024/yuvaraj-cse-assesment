WITH orders AS (
    SELECT
        user_id AS customer_id,
        MIN(order_date) AS first_order,
        MAX(order_date) AS most_recent_order,
        COUNT(*) AS number_of_orders
    FROM raw_orders
    GROUP BY user_id
),
payments AS (
    SELECT
        user_id AS customer_id,
        SUM(amount) AS customer_lifetime_value
    FROM raw_payments
    JOIN raw_orders ON raw_payments.order_id = raw_orders.id
    GROUP BY user_id
)
SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    o.first_order,
    o.most_recent_order,
    o.number_of_orders,
    p.customer_lifetime_value
FROM raw_customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN payments p ON c.id = p.customer_id
