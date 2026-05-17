/*
    QUESTION: What are the highest-paying skills for data engineers?
        Calculate the median salary for each skill required in DE positions
        Focus on remote positions with specified salaries
        Include skill frequency to identify both salary and demand

        WHY?
            -Helps identify which skills command the highest compensation while
             also showing how common those skill are, providing a more complete
             picture for skill development priorities.
            -The median is used instead of average to reduce the impact of 
             outlier salaries.
*/


SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
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
HAVING demand_count > 100
ORDER BY
    median_salary
    DESC
LIMIT 20;


/*

Here's the breakdown of the highest-paying skills for data engineers:
    Rust commands the highest median salary at ~210K, though demand is
    relatively low compared to mainstream technologies.
    Terraform and Golang stand out as the best balance between high salary
    and market demand, both offering median salaries around ~184K.
    Kubernetes and Airflow show strong demand while still maintaining
    impressive salaries above ~150K.
    Specialized technologies like Neo4j, GraphQL, and FastAPI also rank
    among the top-paying skills for DE roles.

    Takeaways:
    - Infrastructure and cloud engineering skills are highly rewarded
      in modern Data Engineering roles.
    - Terraform, Kubernetes, and Airflow provide strong career value
      because they combine high salaries with high market demand.
    - Specialized programming languages like Rust and Golang command
      premium compensation due to their niche expertise.
    - Modern DE roles increasingly require DevOps, orchestration, and
      distributed systems knowledge.
    - Big data and workflow orchestration tools continue to dominate
      enterprise data platforms and remain highly valued.

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ airflow    │      150000.0 │         9996 │
│ ruby       │      150000.0 │          736 │
│ node       │      150000.0 │          179 │
└────────────┴───────────────┴──────────────┘
  20 rows                         3 columns

*/



