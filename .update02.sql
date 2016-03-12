
drop table device_id_nb_tmp;

create table device_id_nb_tmp
       as select device_id, count(*) as nnb, avg(click) as p
       from train
       group by device_id
       with data;

alter table train 
      drop column nnb;

alter table train
      add nnb integer;

update train
       set nnb = (select dt.nnb from device_id_nb_tmp dt
                             where train.device_id = dt.device_id);

select annb, count(*)
       from (select device_id, avg(nnb) as annb
                    from train
                    group by device_id) as foo
       group by annb
       order by annb asc;

drop table device_id_nb_tmp;

alter table train 
      drop column nnb;

