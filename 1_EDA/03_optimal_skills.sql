/*
    QUESTION: What are the most optimal skills for DE - Balancing both
              demand and salary?
            
            Create a ranking column that combines demand count and median
            salary to identify the most valuable skills.
            Focus only on remote DE positions with specifid annual salaries

            Why?
                This approach highlights skills that balance market demans 
                and financial reward.
                It weights core skills appropriately, rather than letting rare,
                outlier skills distort the results. 
*/


SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    COUNT(jpf.salary_year_avg) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * ROUND(LN(COUNT(jpf.*)), 2)) /1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING demand_count > 100
ORDER BY
    optimal_score
    DESC
LIMIT 20;


/*

Here's the breakdown of the most optimal skills for data engineers,
balancing both salary potential and market demand:
    Terraform ranks as the most optimal DE skill with the highest
    combined score (~0.97), offering both premium salaries and
    strong market demand.
    Python and SQL remain foundational technologies, combining very
    high demand with strong salaries, making them among the safest
    long-term investments for DE careers.
    Cloud and orchestration technologies such as AWS, Airflow, and
    Spark dominate the top rankings, reflecting the industry's shift
    toward scalable cloud-native data platforms.
    Kafka, Snowflake, and Kubernetes also perform strongly, showing
    that distributed systems and modern data infrastructure skills
    are increasingly valuable in DE roles.

    Takeaways:
    - Terraform emerges as one of the strongest career leverage skills
      because it balances high compensation with growing adoption.
    - Python and SQL continue to be the backbone of Data Engineering,
      offering both stability and extensive job opportunities.
    - Cloud ecosystem skills (AWS, Azure, GCP) are now essential for
      modern DE positions and consistently appear among the most
      valuable skills.
    - Data pipeline and orchestration tools like Airflow, Spark,
      Kafka, and Snowflake remain highly demanded across the industry.
    - The optimal ranking approach avoids overvaluing rare niche skills
      by balancing salary against real market demand.
    - Modern Data Engineering increasingly overlaps with DevOps,
      distributed systems, and infrastructure engineering.

┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ aws        │      137320.0 │          783 │             6.7 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.82 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │             5.5 │          0.76 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ git        │      140000.0 │          208 │             5.3 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.71 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ docker     │      135000.0 │          144 │             5.0 │          0.67 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
  20 rows                                                           5 columns

*/