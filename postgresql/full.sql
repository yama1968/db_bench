
\timing on

DELETE FROM Train;

set max_parallel_workers_per_gather = 8;

VACUUM FULL;

 COPY Train
 FROM '/home/yannick/tmp/train.csv'
  CSV HEADER
;
