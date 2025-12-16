SELECT
    industry_name,
    year,
    avg_wage,
    avg_wage 
        - LAG(avg_wage) OVER (PARTITION BY industry_name ORDER BY year)
        AS wage_change
FROM t_natalie_jeszikova_project_SQL_primary_final
GROUP BY industry_name, year, avg_wage
ORDER BY industry_name, year;