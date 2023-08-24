
---------------------------------------------------------------------------------------------------
--the average number of trips per week

select avg(tripsperweek) as averagetripsperweek
from (
select date_part('week', lpep_pickup_datetime::date) as numberofweek, count(*) as tripsperweek 
from "2017_taxi_trips" 
group by numberofweek) pw

select avg(tripsperweek) as averagetripsperweek
from (
select date_part('week', lpep_pickup_datetime::date) as numberofweek, count(*) as tripsperweek 
from "2018_taxi_trips" 
group by numberofweek) pw

select avg(tripsperweek) as averagetripsperweek
from (
select date_part('week', lpep_pickup_datetime::date) as numberofweek, count(*) as tripsperweek 
from "2019_taxi_trips" 
group by numberofweek) pw

select avg(tripsperweek) as averagetripsperweek
from (
select date_part('week', lpep_pickup_datetime::date) as numberofweek, count(*) as tripsperweek 
from "2020_taxi_trips" 
group by numberofweek) pw


select date_part('week', lpep_pickup_datetime::date) as numberofweek, date_part('year', lpep_pickup_datetime::date) as numberofyear, count(*) as tripsperweek 
from "2017_taxi_trips" 
group by numberofweek, numberofyear 
union all
select date_part('week', lpep_pickup_datetime::date) as numberofweek,date_part('year', lpep_pickup_datetime::date) as numberofyear, count(*) as tripsperweek 
from "2018_taxi_trips"
group by numberofweek, numberofyear 
union all
select date_part('week', lpep_pickup_datetime::date) as numberofweek, date_part('year', lpep_pickup_datetime::date) as numberofyear, count(*) as tripsperweek 
from "2019_taxi_trips" 
group by numberofweek, numberofyear 
union all
select date_part('week', lpep_pickup_datetime::date) as numberofweek, date_part('year', lpep_pickup_datetime::date) as numberofyear, count(*) as tripsperweek 
from "2020_taxi_trips"
group by numberofweek, numberofyear) pw


---------------------------------------------------------------------------------------------------
--the average distance traveled per trip


---------------------------------------------------------------------------------------------------
--the busiest days of the week

---------------------------------------------------------------------------------------------------
--most popular pick-up and drop-off locations