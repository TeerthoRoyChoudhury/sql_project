SELECT 
    skills,
    ROUND(Avg(salary_year_avg),0) as Avg_salary
    FROM job_postings_fact
INNER JOIN
    skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
Avg_salary DESC
LIMIT 25;


/* ============================================================
INSIGHTS FROM SKILL vs AVG_SALARY DATA (USD)

1) Extremely high outlier
   - SVN shows an unusually high average salary (~400k).
   - Likely driven by very low sample size or niche legacy contracts.
   - Should be treated as an outlier, not a market benchmark.

2) Blockchain & Systems skills pay premium
   - Solidity (~179k) and Golang (~155k) indicate strong demand
     for blockchain, backend, and systems-level engineering.

3) DevOps & Cloud skills are consistently high-paying
   - Terraform, Ansible, Puppet, VMware, GitLab, Bitbucket
   - Salaries cluster between ~120k–147k
   - Reflects high demand for infrastructure automation
     and cloud reliability engineering.

4) Data Engineering & Distributed Systems remain valuable
   - Kafka, Airflow, Cassandra, Scala
   - Salaries ~115k–130k
   - Indicates strong compensation for scalable data pipelines
     and distributed data systems expertise.

5) AI / ML frameworks show solid but not top-tier pay
   - PyTorch, TensorFlow, Keras, MXNet, Hugging Face
   - Salaries mostly ~120k–149k
   - Suggests ML is valuable, but premium pay often comes
     from combining ML with production, infra, or domain expertise.

6) Enterprise & Collaboration tools show moderate-high pay
   - Atlassian, Notion
   - Salaries ~118k
   - Typically associated with product, platform,
     or internal tooling roles rather than pure engineering.

7) Legacy / niche technologies still command strong pay
   - Perl, Couchbase
   - Indicates organizations pay well to maintain or modernize
     critical legacy systems.

OVERALL TAKEAWAY:
- Highest salaries align with niche, infra-heavy, or low-supply skills.
- General-purpose ML skills pay well, but infra + scale skills pay more.
- For career growth, combining Data/ML with DevOps or Backend
  significantly improves earning potential.
============================================================ */
