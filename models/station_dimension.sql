WITH BIKE as (

    SELECT
    DISTINCT
    start_statio_id AS station_id,
    start_station_name AS station_name,
    start_lat as station_lat,
    start_lng as station_lng
    FROM {{ ref('stg_bike') }}

    WHERE RIDE_ID != 'ride_id'

)

SELECT * FROM BIKE