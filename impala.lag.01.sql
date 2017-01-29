
drop view if exists numbers_per_day;
drop view if exists device_id_ip_number;
drop view if exists device_id_ip_seq;
drop view if exists train2;


create view train2
       as select *, substring(hour, 1, 6) as day from train;

create view device_id_ip_seq
  as select device_id, device_ip, day, hour, 
   	    row_number() over (partition by device_id, device_ip, day order by device_id, device_ip, hour) as row_number
       from train2;

select count(*)
  from device_id_ip_seq;

select * from device_id_ip_seq limit 10;


create view device_id_ip_number
  as select device_id, device_ip, day, max(row_number) as number
       from device_id_ip_seq
   group by device_id, device_ip, day;

select * from device_id_ip_number limit 10;


create view numbers_per_day
  as select day, number, count(*) as count_devices
       from device_id_ip_number
   group by day, number;

  select * 
    from numbers_per_day
order by day, number;

