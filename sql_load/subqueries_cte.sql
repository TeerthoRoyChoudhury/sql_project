SELECT *
FROM (
    SELECT * from job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;



with january AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
from january;


SELECT *
FROM(
    SELECT * 
    FROM job_postings_fact
    WHERE
        EXTRACT(MONTH from job_posted_date)=2
) as February_jobs;


WITH feb AS(
    SELECT * FROM 
     job_postings_fact
    WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2
)

SELECT * FROM feb;




















SELECT 
company_id,
name as company_name
FROM company_dim
WHERE company_id IN
    (SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
)






SELECT
    job.job_id,
    company.name
FROM job_postings_fact as job
INNER JOIN company_dim as company
on job.company_id = company.company_id
WHERE
    job_no_degree_mention = true;



WITH company_job_count AS(
SELECT
    COUNT(*) AS jobs_count,
    company_id
FROM
    job_postings_fact
GROUP BY
    company_id
ORDER BY
    jobs_count DESC
LIMIT 10
)

SELECT * FROM company_job_count;


SELECT company_dim.name as company_name
FROM company_dim
LEFT JOIN company_job_count
ON company_job_count.company_id = company_dim.company_id;