{{ config(materialized='view') }}

SELECT
    id AS user_id,
    name AS user_name,
    age,
    gender,
    CURRENT_TIMESTAMP() AS loaded_at
FROM
    {{ source('PUBLIC', 'USER_TEST') }}