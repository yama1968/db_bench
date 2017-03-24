
SELECT
    hour,
    runningAccumulate(s) AS acc,
    runningAccumulate(t) as acct,
    clicked,
    runningDifference(clicked) as diff,
    cnt
FROM
(
    SELECT
        hour,
        sumState(click) AS s,
        sumState(1) AS t,
        sum(click) AS clicked,
        count(*) AS cnt
    FROM Train
    GROUP BY hour
    ORDER BY hour ASC
)
ORDER BY hour ASC;
