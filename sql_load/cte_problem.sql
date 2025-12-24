select * from job_postings_fact limit 10;

SELECT * FROM skills_job_dim LIMIT 10;

SELECT * FROM skills_dim LIMIT 10;


WITH remote_job_skills AS(
SELECT
    skill_id,
    count(*) as skill_count
FROM
    skills_job_dim AS skill_to_job
INNER JOIN
    job_postings_fact as job_posting
ON
    job_posting.job_id = skill_to_job.job_id
WHERE
    job_posting.job_work_from_home = TRUE
    AND
    job_posting.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)
SELECT

skill.skill_id,
skill.skills as skill_name,
skill_count
FROM remote_job_skills
INNER JOIN skills_dim as skill 
ON remote_job_skills.skill_id = skill.skill_id
ORDER BY skill_count DESC
LIMIT 5;


select * from skills_dim;