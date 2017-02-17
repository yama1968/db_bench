
drop view device_id_nb_tmp;

create view device_id_nb_tmp
       as select device_id, count(*) as nnb, avg(click) as p
       from train
       group by device_id;

drop table train_features;

create table train_features
       (id varchar(20), hour varchar(20), click integer, device_id varchar(20), p float, nb integer)
distributed by (hour);

insert into train_features
       select t.id, t.hour, t.click, t.device_id, p, nnb
       from train as t, device_id_nb_tmp
       where t.device_id = device_id_nb_tmp.device_id;

select click, count(*) from train_features group by click order by click;

drop table train_features;
drop view device_id_nb_tmp;


