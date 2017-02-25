
\timing on

DELETE FROM Train;

VACUUM FULL;

 COPY Train
 FROM '/home/yannick/tmp/train10k.csv'
  CSV HEADER
;

