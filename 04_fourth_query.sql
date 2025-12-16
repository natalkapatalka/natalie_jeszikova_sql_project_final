WITH growth AS (
    SELECT
        year,
        AVG(food_price) AS avg_food_price,
        AVG(avg_wage) AS avg_wage
    FROM t_natalie_jeszikova_project_SQL_primary_final
    GROUP BY year
),
yoy AS (
    SELECT
        year,
        (avg_food_price - LAG(avg_food_price) OVER (ORDER BY year))
            / LAG(avg_food_price) OVER (ORDER BY year) * 100 AS food_growth,
        (avg_wage - LAG(avg_wage) OVER (ORDER BY year))
            / LAG(avg_wage) OVER (ORDER BY year) * 100 AS wage_growth
    FROM growth
)
SELECT *
FROM yoy
WHERE food_growth - wage_growth > 10;