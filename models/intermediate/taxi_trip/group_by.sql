-- ################# GROUP BY LOCATION

select 
  PULocationID,
  DOLocationID,
  round(sum(tip_amount),2) as total_tips
from
  {{ ref('int_taxi_trip') }}
where
  PULocationID = 186
group by
  PULocationID,
  DOLocationID

-- ################# GROUP BY HOUR

-- select 
--   extract(hour from pickup_hour) as pick_hour,
--   extract(hour from dropoff_hour) as drop_hour,
--   round(sum(tip_amount),2) as total_tips
-- from
--   {{ ref('int_taxi_trip') }}
-- group by
--   pick_hour,
--   drop_hour

-- ################# GROUP BY DAY OF WEEK

-- select 
--   day_of_week,
--   extract(hour from pickup_hour) as pick_hour,
--   extract(hour from dropoff_hour) as drop_hour,
--   round(sum(tip_amount),2) as total_tips
-- from
--   {{ ref('int_taxi_trip') }}
-- group by
--   day_of_week,
--   pick_hour,
--   drop_hour

-- select 
--   RatecodeID,
--   round(sum(tip_amount),2) as total_tips,
--   count(tip_amount) as count_tips
-- from
--   {{ ref('int_taxi_trip') }}
-- group by
--   RatecodeID