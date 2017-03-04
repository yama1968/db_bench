
drop table if exists device_id_nb_tmp;

create view device_id_nb_tmp
       as select device_id, cast(count(*) as Int32) as nnb, avg(click) as p
       from train
       group by device_id;

drop table if exists train_features;

create table train_features
	ENGINE = Log
	as
       select id, hour, click, device_id, p, nnb
       from train
       all left join device_id_nb_tmp
       using (device_id)
       ;

select click, count(*) from train_features group by click order by click;

drop table train_features;
drop table device_id_nb_tmp;


