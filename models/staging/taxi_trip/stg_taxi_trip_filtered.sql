select 
  tpep_pickup_datetime,
  tpep_dropoff_datetime,
  passenger_count,
  trip_distance,
  RatecodeID,
  PULocationID,
  DOLocationID,
  payment_type,
  tip_amount
from 
  {{ ref('stg_taxi_trip') }}
where
  vendorID in (1,2) 
  and
  tpep_pickup_datetime between '2019-01-01' and '2020-06-30'
  and
  tpep_dropoff_datetime between '2019-01-01' and '2020-06-30'
  and
  passenger_count > 0
  and
  trip_distance between 0.1 and 40
  and
  RatecodeID != 99
  and
  PULocationID < 264
  and 
  DOLocationID < 264
  and
  payment_type in (1,2)
  and
  fare_amount between 1 and 300
  and
  extra in (0,0.5,1)
  and 
  mta_tax = 0.5
  and
  tip_amount between 0 and 50
  and
  tolls_amount between 0 and 50
  and
  improvement_surcharge = 0.3
  and
  total_amount between 1 and 400
  
