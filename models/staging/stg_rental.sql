{{ config(materialized='view') }}

SELECT
    rental_id,
    user_id,
    book_id,
    rental_date,
    due_date,
    return_date
FROM
    {{ source('PUBLIC', 'BOOK_RENTAL')}}