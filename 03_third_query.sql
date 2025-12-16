WITH price_growth AS (
    SELECT
        food_category,
        year,
        food_price,
        (food_price - LAG(food_price) OVER (
            PARTITION BY food_category ORDER BY year
        )) / LAG(food_price) OVER (
            PARTITION BY food_category ORDER BY year
        ) * 100 AS yoy_growth
    FROM t_natalie_jeszikova_project_SQL_primary_final
)
SELECT
    food_category,
    ROUND(AVG(yoy_growth), 2) AS avg_yearly_growth
FROM price_growth
WHERE yoy_growth IS NOT NULL
GROUP BY food_category
ORDER BY avg_yearly_growth;