WITH TRIPS as (

    SELECT
    ride_id,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    member_csual as member_casual,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS trip_duration_seconds


    FROM {{ ref('stg_bike') }}

    WHERE RIDE_ID != 'ride_id'

    limit 10

)

SELECT * FROM TRIPS