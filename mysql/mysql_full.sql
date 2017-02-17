

DELETE FROM Train;

LOAD DATA LOCAL INFILE '/home/yannick/tmp/train.csv'
  REPLACE
     INTO TABLE Train 
   FIELDS TERMINATED BY ','
   IGNORE 1 LINES;
