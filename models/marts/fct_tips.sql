-- with
--   taxi_trip as (
--     select
--       *
--     from
--       {{ ref('int_taxi_trip') }}
--   ),
--   weather as (
--     select
--       *,
--       as hour
--     from
--       {{ ref('int_weather') }}
--   )

-- select
--   * except(weather.hour)
-- from
--   taxi_trip
--   left join weather on taxi_trip. (hour)
select
  *
from
  {{ ref('int_taxi_trip') }}
where
  payment_type = 1