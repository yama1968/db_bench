
drop view if exists device_id_ip_seq;
drop view if exists train2;

create view train2
       as select *, substring(hour, 1, 6) as day from train;

create view device_id_ip_seq
  as select device_id, device_ip, day, hour, 
   	    row_number() over (partition by device_id, device_ip, day order by device_id, device_ip, hour) as row_number
       from train2;
