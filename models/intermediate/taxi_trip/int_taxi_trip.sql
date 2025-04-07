select 
  tpep_pickup_datetime,
  tpep_dropoff_datetime,
  format_datetime('%A', tpep_pickup_datetime) as day_of_week,
  datetime_trunc(tpep_pickup_datetime, hour) as pickup_hour,
  datetime_trunc(tpep_dropoff_datetime, hour) as dropoff_hour,
  passenger_count,
  trip_distance,
  RatecodeID,
  PULocationID,
  DOLocationID,
  payment_type,
  tip_amount,
  total_amount
from 
  {{ ref('stg_taxi_trip') }}
where
  vendorID in (1,2) 
  and
  tpep_pickup_datetime between '2019-01-01' and '2020-06-30'
  and
  tpep_dropoff_datetime between '2019-01-01' and '2020-06-30'
--   and
--   passenger_count > 0
  and
  trip_distance >= 0
  and
--   RatecodeID != 99
--   and
--   PULocationID < 264
--   and 
--   DOLocationID < 264
--   and
--   payment_type = 1-- between 1 and 6
  and
  fare_amount >= 0
  and
  extra in (0,0.5,1)
  and 
  mta_tax = 0.5
  and
  tip_amount >= 0
  and
  tolls_amount >= 0
  and
  improvement_surcharge = 0.3
  and
  total_amount >= 0
