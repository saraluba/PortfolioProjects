--------------------------------------------------------------------------------------------
--CLEANING DATA--


--remove dates that are not from 2017-2020 
delete
from "2017_taxi_trips" tt
where substring(tt.lpep_pickup_datetime,1,4) != '2017'

delete 
from "2018_taxi_trips" tt1
where substring(tt1.lpep_pickup_datetime,1,4) != '2018'

delete
from "2019_taxi_trips" tt2
where substring(tt2.lpep_pickup_datetime,1,4) != '2019'

delete 
from "2020_taxi_trips" tt3
where substring(tt3.lpep_pickup_datetime,1,4) != '2020'

--remove trips with pickups or drop-offs into unknown zones
select *
from taxi_zones tz 
where borough = 'Unknown'

delete
from "2017_taxi_trips" tt 
where pulocationid = 264 or pulocationid = 265 or dolocationid = 264 or dolocationid = 265

delete
from "2018_taxi_trips" tt 
where pulocationid = 264 or pulocationid = 265 or dolocationid = 264 or dolocationid = 265

delete
from "2019_taxi_trips" tt 
where pulocationid = 264 or pulocationid = 265 or dolocationid = 264 or dolocationid = 265

delete
from "2020_taxi_trips" tt 
where pulocationid = 264 or pulocationid = 265 or dolocationid = 264 or dolocationid = 265

--assume that any trips with no recorded passengers had 1 passenger

update "2017_taxi_trips"
set passenger_count = 1
where passenger_count = 0 or passenger_count is null

update "2018_taxi_trips"
set passenger_count = 1
where passenger_count = 0 or passenger_count is null

update "2019_taxi_trips"
set passenger_count = 1
where passenger_count = 0 or passenger_count is null

update "2020_taxi_trips"
set passenger_count = 1
where passenger_count = 0 or passenger_count is null

--swap date/time if pickup date/time is after the drop-off date/time

update "2017_taxi_trips" 
set lpep_pickup_datetime = lpep_dropoff_datetime, lpep_dropoff_datetime = lpep_pickup_datetime 
where lpep_pickup_datetime > lpep_dropoff_datetime 

update "2018_taxi_trips" 
set lpep_pickup_datetime = lpep_dropoff_datetime, lpep_dropoff_datetime = lpep_pickup_datetime 
where lpep_pickup_datetime > lpep_dropoff_datetime 

update "2019_taxi_trips" 
set lpep_pickup_datetime = lpep_dropoff_datetime, lpep_dropoff_datetime = lpep_pickup_datetime 
where lpep_pickup_datetime > lpep_dropoff_datetime 

update "2020_taxi_trips" 
set lpep_pickup_datetime = lpep_dropoff_datetime, lpep_dropoff_datetime = lpep_pickup_datetime 
where lpep_pickup_datetime > lpep_dropoff_datetime 

--remove trips longer than a day

delete 
from "2017_taxi_trips" 
where ((extract(epoch from lpep_dropoff_datetime::timestamp)-extract(epoch from lpep_pickup_datetime::timestamp))/3600)::integer > 24

delete 
from "2018_taxi_trips" 
where ((extract(epoch from lpep_dropoff_datetime::timestamp)-extract(epoch from lpep_pickup_datetime::timestamp))/3600)::integer > 24

delete 
from "2019_taxi_trips" 
where ((extract(epoch from lpep_dropoff_datetime::timestamp)-extract(epoch from lpep_pickup_datetime::timestamp))/3600)::integer > 24

delete 
from "2020_taxi_trips" 
where ((extract(epoch from lpep_dropoff_datetime::timestamp)-extract(epoch from lpep_pickup_datetime::timestamp))/3600)::integer > 24

--if fare, taces, surcharcharges are all negative, make it positive
update "2017_taxi_trips" 
set fare_amount = -fare_amount, improvement_surcharge = -improvement_surcharge, mta_tax = -mta_tax 
where fare_amount < 0 and improvement_surcharge <0 and mta_tax <0

update "2018_taxi_trips" 
set fare_amount = -fare_amount, improvement_surcharge = -improvement_surcharge, mta_tax = -mta_tax 
where fare_amount < 0 and improvement_surcharge <0 and mta_tax <0

update "2019_taxi_trips" 
set fare_amount = -fare_amount, improvement_surcharge = -improvement_surcharge, mta_tax = -mta_tax 
where fare_amount < 0 and improvement_surcharge <0 and mta_tax <0

update "2020_taxi_trips" 
set fare_amount = -fare_amount, improvement_surcharge = -improvement_surcharge, mta_tax = -mta_tax 
where fare_amount < 0 and improvement_surcharge <0 and mta_tax <0

--for any trips that have a fare amount but have a trip distance of 0, calculate distance by: 
--fare amount-2.5/2.5

update "2017_taxi_trips" 
set trip_distance = (fare_amount-2.5)/2.5
where trip_distance = 0 

update "2018_taxi_trips" 
set trip_distance = (fare_amount-2.5)/2.5
where trip_distance = 0 

update "2019_taxi_trips" 
set trip_distance = (fare_amount-2.5)/2.5
where trip_distance = 0 

update "2020_taxi_trips" 
set trip_distance = (fare_amount-2.5)/2.5
where trip_distance = 0 

--for any trips that have a trip distance but have a fare amount of 0, calculate fare by:
-- 2.5 + (trip distance * 2.5)

update "2017_taxi_trips" 
set fare_amount = 2.5 + (trip_distance * 2.5)
where trip_distance > 0 and fare_amount = 0

update "2018_taxi_trips" 
set fare_amount = 2.5 + (trip_distance * 2.5)
where trip_distance > 0 and fare_amount = 0

update "2019_taxi_trips" 
set fare_amount = 2.5 + (trip_distance * 2.5)
where trip_distance > 0 and fare_amount = 0

update "2020_taxi_trips" 
set fare_amount = 2.5 + (trip_distance * 2.5)
where trip_distance > 0 and fare_amount = 0
--------------------------------------------------------------------------------------------






