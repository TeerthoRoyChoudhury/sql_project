SELECT * FROM job_postings_fact limit 10;


SELECT count(job_title_short),
job_title_short,
EXTRACT(MONTH FROM job_posted_date) as Months,
CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'

END as job_categories
from job_postings_fact
GROUP BY
    Months,
    job_categories
ORDER BY
    Months DESC; 