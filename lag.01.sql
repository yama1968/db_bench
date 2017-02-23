
drop view  numbers_per_day;
drop view  device_id_ip_number;
drop view  device_id_ip_seq;
drop view  train2;


create view train2
       as select *, substring(my_hour, 1, 6) as my_day from train;

create view device_id_ip_seq
  as select device_id, device_ip, my_day, my_hour, 
   	    row_number() over (partition by device_id, device_ip, my_day order by device_id, device_ip, my_hour) as row_number
       from train2;

select count(*)
  from device_id_ip_seq;

select * from device_id_ip_seq limit 10;


create view device_id_ip_number
  as select device_id, device_ip, my_day, max(row_number) as number
       from device_id_ip_seq
   group by device_id, device_ip, my_day;

select * from device_id_ip_number limit 10;


create view numbers_per_my_day
  as select my_day, number, count(*) as count_devices
       from device_id_ip_number
   group by my_day, number;

  select * 
    from numbers_per_my_day
order by my_day, number;

