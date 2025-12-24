SELECT job_posted_date FROM job_postings_fact
limit 10;


SELECT 
    job_title_short as title,
    job_location as Loacation,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH from job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) as year
FROM
    job_postings_fact

LIMIT 5;




SELECT
EXTRACT(MONTH FROM job_posted_date) as Months,
COUNT(*) AS job_count
FROM
    job_postings_fact
GROUP BY
    Months
ORDER BY
    job_count;
