
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
select avg(trip_distance)
from 
"2017_taxi_trips" tt 

select avg(trip_distance)
from 
"2018_taxi_trips" tt 

select avg(trip_distance)
from 
"2019_taxi_trips" tt 

select avg(trip_distance)
from 
"2020_taxi_trips" tt 
---------------------------------------------------------------------------------------------------
--the busiest days of the week

select nameofdays, numberofdays 
from (select to_char(lpep_pickup_datetime::date, 'day')  as nameofdays, count(*) as numberofdays
from "2017_taxi_trips" tt
group by nameofdays) nd
order by numberofdays desc

select nameofdays, numberofdays 
from (select to_char(lpep_pickup_datetime::date, 'day')  as nameofdays, count(*) as numberofdays
from "2018_taxi_trips" tt
group by nameofdays) nd
order by numberofdays desc

select nameofdays, numberofdays 
from (select to_char(lpep_pickup_datetime::date, 'day')  as nameofdays, count(*) as numberofdays
from "2019_taxi_trips" tt
group by nameofdays) nd
order by numberofdays desc

select nameofdays, numberofdays 
from (select to_char(lpep_pickup_datetime::date, 'day')  as nameofdays, count(*) as numberofdays
from "2020_taxi_trips" tt
group by nameofdays) nd
order by numberofdays desc

---------------------------------------------------------------------------------------------------
--most popular pick-up and drop-off locations

select tz."Zone", count(*) as pickupzonenumber
from "2017_taxi_trips" tt 
left join taxi_zones tz 
on tt.pulocationid = tz.locationid 
group by tz."Zone" 
order by pickupzonenumber desc

select tz."Zone", count(*) as dropoffzonenumber
from "2017_taxi_trips" tt 
left join taxi_zones tz 
on tt.dolocationid  = tz.locationid 
group by tz."Zone" 
order by dropoffzonenumber desc

select tz."Zone", count(*) as pickupzonenumber
from "2018_taxi_trips" tt 
left join taxi_zones tz 
on tt.pulocationid = tz.locationid 
group by tz."Zone" 
order by pickupzonenumber desc

select tz."Zone", count(*) as dropoffzonenumber
from "2018_taxi_trips" tt 
left join taxi_zones tz 
on tt.dolocationid  = tz.locationid 
group by tz."Zone" 
order by dropoffzonenumber desc

select tz."Zone", count(*) as pickupzonenumber
from "2019_taxi_trips" tt 
left join taxi_zones tz 
on tt.pulocationid = tz.locationid 
group by tz."Zone" 
order by pickupzonenumber desc

select tz."Zone", count(*) as dropoffzonenumber
from "2019_taxi_trips" tt 
left join taxi_zones tz 
on tt.dolocationid  = tz.locationid 
group by tz."Zone" 
order by dropoffzonenumber desc

select tz."Zone", count(*) as pickupzonenumber
from "2020_taxi_trips" tt 
left join taxi_zones tz 
on tt.pulocationid = tz.locationid 
group by tz."Zone" 
order by pickupzonenumber desc

select tz."Zone", count(*) as dropoffzonenumber
from "2020_taxi_trips" tt 
left join taxi_zones tz 
on tt.dolocationid  = tz.locationid 
group by tz."Zone" 
order by dropoffzonenumber desc
