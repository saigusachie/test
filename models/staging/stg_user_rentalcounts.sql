WITH rental_summary AS (
    SELECT
        user_id,
        COUNT(book_id) AS total_rentals_count,
        MAX(rental_date) AS latest_rental_date
    FROM
        {{ ref('stg_rental') }}
    GROUP BY 1
)
SELECT
    u.user_id,
    u.user_name,
    u.age,
    u.gender,
    COALESCE(r.total_rentals_count, 0) AS total_rentals_count,
    r.latest_rental_date
FROM
    {{ ref('stg_users') }} u
LEFT JOIN
    rental_summary r ON u.user_id = r.user_id