/*

*/


drop view if exists dt_distrib;
drop view if exists dt_per_day;
drop view if exists device_plus_dt;
drop view if exists train3;


create view train3
  as select *, 
            cast(substring(hour, 5, 2) as int) as int_day, 
            cast(substring(hour, 7, 2) as int) as int_hour
       from train;


create view device_plus_dt
  as select device_id, 
            device_ip, 
            int_day, 
            int_hour, 
            int_hour - lag(int_hour) over (partition by device_id, device_ip, int_day order by int_hour) as dt_hour
       from train3;


create view dt_per_day
  as select int_day,
            sum(dt_hour) as sum_dt_hour,
            count(dt_hour) as num_per_day,
            sum(dt_hour) / count(dt_hour) as avg_per_day
       from device_plus_dt
      where dt_hour is not NULL
   group by int_day;


     select *
       from dt_per_day
   order by int_day;


create view dt_distrib
  as select dt_hour,
     	    count(*) as num_dt
       from device_plus_dt
      where dt_hour is not NULL
   group by dt_hour;


     select *
       from dt_distrib
   order by dt_hour;
