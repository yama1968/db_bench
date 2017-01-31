
drop view if exists device_id_nb_tmp;

create view device_id_nb_tmp
       as select device_id, cast(count(*) as integer) as nnb, avg(click) as p
       from train
       group by device_id;

drop table if exists train_features;

create table train_features
       (id string, hour string, click integer, device_id string, p double, nb integer);

insert into train_features
       select t.id, t.hour, t.click, t.device_id, p, nnb
       from train as t, device_id_nb_tmp
       where t.device_id = device_id_nb_tmp.device_id;

select click, count(*) from train_features group by click order by click;

drop table train_features;
drop view device_id_nb_tmp;


