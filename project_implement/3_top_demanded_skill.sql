SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
INNER JOIN
    skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;

/* ============================================================
INSIGHTS: TOP DEMANDED SKILLS FOR DATA ANALYST ROLES

1) SQL is the undisputed core skill
   - Highest demand by a large margin (~92k postings).
   - Confirms SQL as the primary language for data retrieval,
     transformation, and analysis across industries.
   - Mandatory skill for entry-level to senior analyst roles.

2) Excel remains critically important
   - Second-highest demand (~67k).
   - Indicates continued reliance on spreadsheets for
     ad-hoc analysis, reporting, business operations,
     and stakeholder communication.
   - Especially important in non-tech and enterprise teams.

3) Python is the leading programming language for analysts
   - Strong demand (~57k), close to Excel.
   - Used for automation, advanced analysis, statistics,
     data cleaning, and integration with ML workflows.
   - Differentiator skill rather than a replacement for SQL.

4) BI & Visualization tools are essential for storytelling
   - Tableau (~46k) and Power BI (~39k) show very high demand.
   - Highlights the importance of dashboarding and
     data communication to business users.
   - Power BI’s strong presence reflects enterprise adoption.

5) Statistical languages still hold value
   - R (~30k) and SAS (~28k) remain relevant.
   - Common in finance, healthcare, research,
     and legacy enterprise environments.
   - SAS demand suggests continued use in regulated industries.

6) Presentation & documentation skills matter
   - PowerPoint (~13.8k) and Word (~13.6k).
   - Shows analysts are expected to present insights
     and produce formal documentation, not just code.

7) ERP & enterprise systems appear as niche requirements
   - SAP (~11k).
   - Indicates demand for analysts working close to
     business processes, finance, and operations.

OVERALL TAKEAWAY:
- Data Analyst roles are tool-diverse but SQL-centric.
- Core stack = SQL + Excel + Python + BI tool.
- Analysts are expected to both analyze data and
  communicate insights effectively to stakeholders.
- Enterprise and legacy tools remain relevant alongside
  modern analytics technologies.
============================================================ */
