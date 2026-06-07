WITH BIKE as (

    SELECT
    DISTINCT
    start_statio_id AS station_id,
    start_station_name AS station_name,
    start_lat as station_lat,
    start_lng as station_lng
    FROM {{ source('demo', 'BIKE') }}

    WHERE RIDE_ID != 'ride_id'
    limit 10
)

SELECT * FROM BIKE