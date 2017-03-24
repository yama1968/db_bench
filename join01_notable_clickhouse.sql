

SELECT click, count(*)
  FROM (
        SELECT id, hour as my_hour, click, device_id, p, nnb
          FROM Train AS t
          ALL INNER JOIN (
                SELECT device_id, count(*) as nnb, avg(click) as p
                  FROM Train
                 GROUP BY device_id
            ) AS DID
            USING(device_id)
    ) AS A
 GROUP BY click
 ORDER BY click;


 SELECT id, hour as my_hour, click, device_id, p, nnb
   FROM Train AS t
   ALL INNER JOIN (
         SELECT device_id, count(*) as nnb, avg(click) as p
           FROM Train
          GROUP BY device_id
     ) AS DID
     USING(device_id)
     ORDER BY p DESC
     LIMIT 20;
