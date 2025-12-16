CREATE TABLE t_natalie_jeszikova_project_SQL_secondary_final AS
SELECT
    e.country,
    e.year,
    ROUND(e.gdp::numeric, 2) AS gdp,
    e.population,
    ROUND(e.gini::numeric, 2) AS gini
FROM economies e
JOIN countries c
    ON e.country = c.country
WHERE c.continent = 'Europe'
  AND e.gdp IS NOT NULL
  AND e.year IS NOT NULL
ORDER BY e.country, e.year;