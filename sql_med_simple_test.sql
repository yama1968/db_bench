

select click, count(*) as nb from train group by click order by click;

select banner_pos, count(*) as nb, avg(click) as p
       from train
       group by banner_pos
       order by banner_pos;

select count(distinct device_type) from train;

select device_type, count(*) as nb, avg(click) as p
       from train
       group by device_type
       order by nb desc;

drop table device_id_type;
drop table device_id;

select count(distinct device_id) from train;

create view device_id_type
       as select device_id, device_type, count(*) as nb 
       from train
       group by device_id, device_type;

create view device_id
       as select device_id, count(*) as nnb, sum(nb) as snb
       from device_id_type
       group by device_id;

select nnb, count(*) as nb_device_id
       from device_id
       where nnb >= 2
       group by nnb
       order by nnb desc;


select device_id, count(*) as nb, avg(click) as p
       from train
       group by device_id
       order by nb desc
       limit 20;
