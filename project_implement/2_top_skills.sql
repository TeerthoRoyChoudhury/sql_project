WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name as company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.*,
    skills_dim.skills as skill_name
    FROM
    top_paying_jobs
INNER JOIN skills_job_dim AS skill ON
top_paying_jobs.job_id = skill.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skill.skill_id
ORDER BY salary_year_avg DESC;
