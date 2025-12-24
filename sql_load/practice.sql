/*
SELECT
    job_posted_date
    AT TIME ZONE 'UTC'
    AT TIME ZONE 'EST'
    AS date_time
    FROM job_postings_fact;

SELECT * FROM job_postings_fact LIMIT 10;


SELECT
    job_title_short as jobs,
    count(*) as Number_of_jobs,
    EXTRACT(MONTH FROM job_posted_date) as Months
FROM
    job_postings_fact
GROUP BY
    job_title_short,
    Months
ORDER BY
    Months;
*/

/*select job_title_short,
    CASE
    when job_location = 'Anywhere' then 'Remote'
    WHEN job_location = 'New York, NY' then 'Local'
    else 'onsite'
    END as job_categories
FROM job_postings_fact;



SELECT * from job_postings_fact limit 10;


SELECT job_title_short as job,
    count(*) as Number_of_jobs,
    job_country as country 
FROM
    job_postings_fact
GROUP BY
    country,
    job
HAVING
    job_country = 'India'
ORDER BY
    Number_of_jobs DESC;
*/


SELECT * 
    FROM(
SELECT * FROM job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) =1
    ) as jan_jobs;

SELECT *
FROM (
    SELECT * FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'

) as Data_analyst_job;

WITH jann as(
    SELECT * from job_postings_fact
    WHERE
        EXTRACT(MONTH from job_posted_date) = 1
)

SELECT * FROM jann;



WITH feb as(
    SELECT *
    FROM job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 2
)

SELECT * FROM feb;








 
