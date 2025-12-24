WITH qrt_1 AS 

(SELECT * 
FROM
    january_jobs
UNION

SELECT *
FROM
    february_jobs
UNION

SELECT *
FROM
    march_jobs
)
SELECT *
FROM    
    qrt_1
WHERE
    salary_year_avg >70000;