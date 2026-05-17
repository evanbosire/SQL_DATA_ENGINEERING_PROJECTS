# Exploratory Data Analysis w/SQL: Job Market Analysis

![Project 1 Overview](../1_EDA/assets/1_1_Project1_EDA.png)

A SQL project analyzing the data engineer job market using real world job posting data. It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into data-driven insights.**


## Excutive Summary

    - Project scope: Built 3 analytical queries that answer key questions about the data engineer job market
    - Data modeling: Used multi-table joins across fact and dimension tables to extract insights
    - Analytics: Applied aggregations, filtering, and sorting to find top skills by demand, salary, and overall value
    - Outcomes: Delivered actionable insights on SQL/Python dominance, cloud trends, and salary patterns

If you only have a minute, review these:

1. **[01_top_demanded_skills.sql](01_top_demanded_skills.sql)** – demand analysis with multi-table joins  
2. **[02_top_paying_skills.sql](02_top_paying_skills.sql)** – salary analysis with aggregations  
3. **[03_optimal_skills.sql](03_optimal_skills.sql)** – combined demand/salary optimization query

## Problem & Context

Job market analysts need to answer questions like:  

 - **Most in-demand:** Which skills are most in-demand for data engineers?  

 - **Highest paid:** Which skills command the highest salaries? 

 - **Best trade-off:** What is the optimal skill set balancing demand and compensation? 


This project analyzes a **data warehouse** built using a star schema design. The warehouse structure consists of:

![Data Warehouse](../1_EDA/assets/1_2_Data_Warehouse.png)  


- **Fact Table:** job_postings_fact - Central table containing job posting details (job titles, locations, salaries, dates, etc.)
Dimension Tables:

- **Dimension Tables:**
    - **company_dim** - Company information linked to job postings
    - **skills_dim** - Skills catalog with skill names and types
- **Bridge Table:** 
    - **skills_job_dim** - Resolves the many-to-many relationship between job postings and skills  


By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.



## Tech Stack

- **Language:** SQL (ANSI-style with analytical functions)
- **Query Engine:** DuckDB for fast OLAP-style analytical queries
- **Data Model:** Star schema with fact + dimension + bridge tables
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL scripts


## Repository Structure

 ```folder
        1_EDA/
    |-- assets/                       # Images
    ├── 01_top_demanded_skills.sql    # Demand analysis query
    ├── 02_top_paying_skills.sql      # Salary analysis query
    ├── 03_optimal_skills.sql         # Combined demand/salary   
    └── README.md                     # You are here
```

## Analysis Overview

This project analyzes the remote Data Engineering job market to identify the
most valuable technical skills based on three key dimensions:

1. **Skill Demand** – Which skills appear most frequently in remote Data
   Engineering job postings.
2. **Salary Potential** – Which skills command the highest median salaries.
3. **Skill Optimization** – Which skills provide the best balance between
   market demand and financial reward.

The analysis was performed using SQL on job posting datasets containing
information about job titles, salaries, remote work availability, and required
technical skills.

### Key Questions Explored

#### 1. What are the most in-demand skills for Data Engineers?

This analysis identified the skills most frequently requested in remote
Data Engineering roles.

**Main Findings:**
- SQL and Python dominate the market with nearly 29K job postings each.
- Cloud technologies such as AWS, Azure, and GCP are heavily demanded.
- Big data and orchestration tools including Spark, Airflow, Snowflake,
  and Databricks continue to grow in importance.
- Docker, Git, Tableau, and NoSQL technologies also remain highly relevant
  in modern DE workflows.

**Insight:**
Modern Data Engineering increasingly combines software engineering,
cloud computing, distributed systems, and data platform management.

---

#### 2. What are the highest-paying skills for Data Engineers?

This section focused on identifying skills associated with the highest
median salaries in remote DE roles.

```
**Main Findings:**
- Rust recorded the highest median salary (~210K), though demand was
  relatively low.
- Terraform and Golang achieved an excellent balance of both salary
  and market demand.
- Kubernetes and Airflow showed strong compensation while maintaining
  high industry adoption.
- Specialized technologies such as GraphQL, Neo4j, and FastAPI also
  ranked among the top-paying skills.
```
**Insight:**
Infrastructure engineering, cloud-native tooling, orchestration, and
distributed systems expertise are increasingly rewarded in the Data
Engineering market.

---

#### 3. What are the most optimal skills for Data Engineers?

This analysis combined salary and demand into a single ranking metric
(`optimal_score`) to identify the most strategically valuable skills.

The score was calculated using:
- Median salary
- Demand frequency
- Logarithmic weighting of demand counts

This approach prevents rare outlier skills from dominating the rankings
while still rewarding high-paying technologies.

**Main Findings:**
- Terraform emerged as the top overall skill based on the balance of
  compensation and demand.
- Python and SQL remained foundational career skills with extremely
  high demand and strong salary potential.
- AWS, Spark, Kafka, Snowflake, and Airflow consistently ranked among
  the most valuable technologies.
- Cloud, orchestration, and infrastructure engineering skills dominate
  modern DE hiring trends.

**Insight:**
The most effective career strategy for Data Engineers is to combine:
- Core programming skills
- Cloud platform expertise
- Distributed systems knowledge
- Workflow orchestration tools
- Infrastructure automation technologies



### Overall Conclusion

The analysis reveals that modern Data Engineering is evolving beyond
traditional ETL and database management into a highly cloud-oriented,
infrastructure-driven discipline.

While SQL and Python remain essential foundations, the strongest career
opportunities increasingly come from combining those core skills with:
- Cloud computing
- Data orchestration
- DevOps practices
- Big data technologies
- Infrastructure automation

Technologies such as Terraform, Airflow, Spark, Kubernetes, and AWS
represent some of the highest-value skills in today's remote Data
Engineering market.

## SQL Skills Demonstrated  

**Query Design & Optimization**  
    - **Complex Joins:** Multi-table INNER JOIN operations across       job_postings_fact, skills_job_dim, and skills_dim 
    - **Aggregations:** COUNT(), MEDIAN(), ROUND() for statistical analysis  
    - **Filtering:** Boolean logic with WHERE clauses and multiple conditions (job_title_short, job_work_from_home, salary_year_avg IS NOT NULL)  
    - **Sorting & Limiting:** ORDER BY with DESC and LIMIT for top-N analysis 


**Data Analysis Techniques**  
        - **Grouping:** GROUP BY for categorical analysis by skill  
        - **Mathematical Functions:** LN() for natural logarithm transformation to normalize demand metrics  
        - **Calculated Metrics:** Derived optimal score combining log-transformed demand with median salary  
        - **HAVING Clause:** Filtering aggregated results (skills with >= 100 postings)  
        -**NULL Handling:** Proper filtering of incomplete records (salary_year_avg IS NOT NULL)
        
