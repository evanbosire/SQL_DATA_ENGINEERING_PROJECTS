/*
QUESTION: What are the most in-demand skills for data engineers?
    - Identify the top 10 in-demand skills for demand
    - Focus on remote job postings

    WHY?
        * Retrieve the top 10 skills with the highest demand in the remote
          job market, providing insights into the most valuable skills for
          DE seeking remote work.

*/

SELECT
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
GROUP BY 
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 20;


/*

Here's the breakdown of the most demanded skills for data engineers:
    SQL and Python are by far the most in-demand skills, with around 29K
    jon postings each.
    Cloud platforms round out the top skills, with AWS leading at ~18K 
    postings, followed by Azure then GCP.
    Docker finishes at top 20 as in-demand skill with ~4K job postings.

    Takeaways:
    - SQL & Python remain the fundamental skills for DE
    - Cloud platforms (AWS & Azure) are critical for modern DE
    - Big data tools like Spark continue to dominate and highly valued
    - Data pipeline tools (Airflow, Snowflake, Databricks) show growing 
      demand too
    - Tableu and Docker round out the top 20 most requested skills.
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
│ kafka      │         6415 │
│ scala      │         6304 │
│ redshift   │         5737 │
│ hadoop     │         5447 │
│ pyspark    │         4898 │
│ git        │         4641 │
│ power bi   │         4600 │
│ nosql      │         4514 │
│ tableau    │         4402 │
│ docker     │         4316 │
└────────────┴──────────────┘
  20 rows         2 columns

*/



