
\timing on

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




