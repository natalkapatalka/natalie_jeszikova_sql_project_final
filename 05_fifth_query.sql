WITH gdp_growth AS (
    SELECT
        country,
        year,
        (gdp - LAG(gdp) OVER (PARTITION BY country ORDER BY year))
            / LAG(gdp) OVER (PARTITION BY country ORDER BY year) * 100
            AS gdp_growth
    FROM t_natalie_jeszikova_project_SQL_secondary_final
),
cz_growth AS (
    SELECT
        year,
        (AVG(avg_wage) - LAG(AVG(avg_wage)) OVER (ORDER BY year))
            / LAG(AVG(avg_wage)) OVER (ORDER BY year) * 100 AS wage_growth,
        (AVG(food_price) - LAG(AVG(food_price)) OVER (ORDER BY year))
            / LAG(AVG(food_price)) OVER (ORDER BY year) * 100 AS food_growth
    FROM t_natalie_jeszikova_project_SQL_primary_final
    GROUP BY year
)
SELECT
    g.year,
    g.gdp_growth,
    c.wage_growth,
    c.food_growth
FROM gdp_growth g
JOIN cz_growth c USING (year)
WHERE g.country = 'Czech Republic';