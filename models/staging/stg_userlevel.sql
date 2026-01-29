SELECT
    user_id,
    user_name,
    age,
    gender,
    total_rentals_count,
    latest_rental_date,
    CASE
        WHEN total_rentals_count = 0 THEN '初心者'
        WHEN total_rentals_count = 1 THEN '中級者'
        ELSE '上級者'
    END AS user_attribute,
    CURRENT_TIMESTAMP() AS updated_at
FROM
    {{ ref('stg_user_rentalcounts') }}