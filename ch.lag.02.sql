/*

*/


drop table if exists Dt_distrib;
drop table Dt_per_day;
drop table Device_plus_dt;
drop table Device_plus_dt_1;
drop table Train3;


create view Train3
  as select *,
            cast(substring(hour, 5, 2) as Int32) as int_day,
            cast(substring(hour, 7, 2) as Int32) as int_hour,
            sipHash64(device_id) as hash_id,
            sipHash64(device_ip) as hash_ip
       from Train;


create view Device_plus_dt_1
  as select device_id,
            device_ip,
            int_day,
            int_hour,
            runningDifference(int_hour) as dt_hour,
            runningDifference(int_day) as dt_day,
            runningDifference(hash_id) as dt_id,
            runningDifference(hash_ip) as dt_ip
       from (
         select
            *
          from default.Train3 order by device_id, device_ip, int_day, int_hour
         ) AS A;

create view Device_plus_dt
  as select device_id,
            device_ip,
            int_day,
            int_hour,
            if(dt_id = 0 AND dt_ip = 0 AND dt_day = 0, dt_hour, NULL) as dt_hour
       from Device_plus_dt_1;


create view Dt_per_day
  as select int_day,
            sum(dt_hour) as sum_dt_hour,
            count(dt_hour) as num_per_day,
            sum(dt_hour) / count(dt_hour) as avg_per_day
       from Device_plus_dt
      where dt_hour is not NULL
   group by int_day;


     select *
       from Dt_per_day
   order by int_day;


create view Dt_distrib
  as select dt_hour,
     	    count(*) as num_dt
       from Device_plus_dt
      where dt_hour is not NULL
   group by dt_hour;


     select *
       from Dt_distrib
   order by dt_hour;
