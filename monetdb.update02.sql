
start transaction;

#drop table device_id_nb_tmp;

create table device_id_nb_tmp
       as select * from 
          (select device_id, count(*) as nnb, avg(click) as p
           from train
           group by device_id) as foo
       where foo.nnb > 1
       with data;

#create index device_id_nb_tmp1 on device_id_nb_temp(device_id);

#drop index train1;
#create index train1 on train(device_id);

#alter table train 
#      drop column nnb;

alter table train
      add nnb integer;

update train
       set nnb = (select dt.nnb from device_id_nb_tmp dt
                             where train.device_id = dt.device_id);

select annb, count(*)
       from (select device_id, max(nnb) as annb
                    from train
                    group by device_id) as foo
       group by annb
       order by annb asc;

drop table device_id_nb_tmp;

#drop index train1;

alter table train 
      drop column nnb;

commit;
