
\timing on

DELETE FROM Train;

VACUUM FULL;

 COPY Train
 FROM '/mnt/home/yannick/tmp/train.csv'
  CSV HEADER
  LOG ERRORS INTO Train_load_errors KEEP
SEGMENT REJECT LIMIT 10 ROWS;
