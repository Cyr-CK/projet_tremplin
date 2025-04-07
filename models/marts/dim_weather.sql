select
  time,
  case
    when temperature_2m__C < -5 then 'Extremely cold'
    when temperature_2m__C <= 0 then 'Very cold'
    when temperature_2m__C <=10 then 'Cold'
    when temperature_2m__C <=17 then 'Cool'
    when temperature_2m__C <=22 then 'Temperate'
    when temperature_2m__C <=30 then 'Warm'
    else 'Hot'
    end as temperature_2m_cat,
  case
    when precipitation__mm = 0 then 'No precipitation'
    when precipitation__mm <= 5 then 'Light rain'
    else 'Moderate rain'
    end as precipitation_cat,
  case
    when cloudcover__perc <= 10 then 'Sunny'
    when cloudcover__perc <= 25 then 'Slightly cloudy'
    when cloudcover__perc <= 50 then 'Moderately cloudy'
    when cloudcover__perc <= 50 then 'Moderately cloudy'
    when cloudcover__perc <= 80 then 'Cloudy'
    when cloudcover__perc <= 95 then 'Very cloudy'
    else 'Overcast'
    end as cloudcover_cat,
  case
    when windspeed_10m__km_h <= 5 then 'still'
    when windspeed_10m__km_h <= 20 then 'Slightly windy'
    else 'Moderately windy'
    end as windspeed_10m_cat
from
  {{ ref('int_weather') }}