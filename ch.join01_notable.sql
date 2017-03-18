

SELECT click, count(*)
  FROM (
        SELECT id, hour as my_jour, t.click, t.device_id, DID.p, DID.nnb
          FROM Train AS t
          JOIN (
                SELECT device_id, count(*) as nnb, avg(click) as p
                  FROM Train
                 GROUP BY device_id
            ) AS DID
            USING (device_id)
    ) AS A
 GROUP BY click
 ORDER BY click;
