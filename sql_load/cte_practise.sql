SELECT * FROM job_postings_fact LIMIT 10;

SELECT * FROM skills_job_dim LIMIT 10;

SELECT * FROM skills_dim LIMIT 10;



with remote_job as(
SELECT
    skill_to_job.skill_id,
    COUNT(*) AS skill_count
FROM  skills_job_dim as skill_to_job
INNER JOIN job_postings_fact as job
on job.job_id = skill_to_job.job_id
WHERE
job.job_work_from_home = TRUE
GROUP BY
skill_to_job.skill_id
)
SELECT
skill.skill_id,
skill.skills,
skill_count
FROM
    remote_job
INNER JOIN skills_dim as skill
ON
    remote_job.skill_id = skill.skill_id
ORDER BY
    skill_count DESC
LIMIT 10;

