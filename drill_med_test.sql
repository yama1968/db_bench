

select click, count(*) as nb from dfs.`/home/yannick/tmp/train.parquet` group by click order by click;

select banner_pos, count(*) as nb, avg(click) as p
       from dfs.`/home/yannick/tmp/train.parquet`
       group by banner_pos
       order by banner_pos;

select count(distinct device_type) from train;

select device_type, count(*) as nb, avg(click) as p
       from dfs.`/home/yannick/tmp/train.parquet`
       group by device_type
       order by nb desc;



select count(distinct device_id) from dfs.`/home/yannick/tmp/train.parquet`;


select nnb, count(*) as nb_device_id
       from (
         select device_id, count(*) as nnb, sum(nb) as snb
         from (
           select device_id, device_type, count(*) as nb
           from dfs.`/home/yannick/tmp/train.parquet`
           group by device_id, device_type
           )
         group by device_id
         ) AS device_id
       where nnb >= 2
       group by nnb
       order by nnb desc;


select device_id, count(*) as nb, avg(click) as p
       from dfs.`/home/yannick/tmp/train.parquet`
       group by device_id
       order by nb desc
       limit 20;
