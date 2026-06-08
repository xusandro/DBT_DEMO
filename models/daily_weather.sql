WITH daily_weather as(


    SELECT

    DATE(TIME) AS DAILY_WEATHER,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS

    FROM {{ source('demo', 'WEATHER')}}



),

daily_weather_agg as(

    SELECT

    daily_weather,

    weather,

    ROUND(AVG(temp),2) as avg_temp,
    ROUND(AVG(PRESSURE),2) as avg_pressure,
    ROUND(AVG(HUMIDITY),2) as avg_humidity,
    ROUND(AVG(CLOUDS),2) as avg_cloud

    FROM daily_weather

    group by daily_weather, weather

    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1

)


SELECT
*
FROM daily_weather_agg

