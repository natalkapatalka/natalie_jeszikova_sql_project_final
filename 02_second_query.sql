WITH bounds AS (
    SELECT MIN(year) AS first_year, MAX(year) AS last_year
    FROM t_natalie_jeszikova_project_SQL_primary_final
),
yearly_wage AS (
    SELECT
        year,
        AVG(avg_wage) AS avg_wage_year
    FROM t_natalie_jeszikova_project_SQL_primary_final
    GROUP BY year
)
SELECT
    p.year,
    p.food_category,
    ROUND(w.avg_wage_year / p.food_price, 2) AS purchasable_amount
FROM t_natalie_jeszikova_project_SQL_primary_final p
JOIN yearly_wage w USING (year)
JOIN bounds b ON p.year IN (b.first_year, b.last_year)
WHERE p.food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY p.year, p.food_category, w.avg_wage_year, p.food_price
ORDER BY p.food_category, p.year;