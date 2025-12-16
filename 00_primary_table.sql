CREATE TABLE t_natalie_jeszikova_project_SQL_primary_final AS
WITH wages AS (
    SELECT 
        p.payroll_year AS year,
        ib.name AS industry_name,
        ROUND(AVG(p.value)::numeric, 2) AS avg_wage
    FROM czechia_payroll p
    JOIN czechia_payroll_industry_branch ib
        ON p.industry_branch_code = ib.code
    WHERE p.value_type_code = 5958
    GROUP BY p.payroll_year, ib.name
),
prices AS (
    SELECT
        DATE_PART('year', pr.date_from)::int AS year,
        pc.name AS food_category,
        pc.price_value,
        pc.price_unit,
        ROUND(AVG(pr.value)::numeric, 2) AS food_price
    FROM czechia_price pr
    JOIN czechia_price_category pc
        ON pr.category_code = pc.code
    WHERE pr.date_from IS NOT NULL
    GROUP BY DATE_PART('year', pr.date_from), pc.name, pc.price_value, pc.price_unit
)
SELECT 
    w.year,
    w.industry_name,
    w.avg_wage,
    p.food_category,
    p.price_value,
    p.price_unit,
    p.food_price
FROM wages w
JOIN prices p USING (year)
ORDER BY w.year, w.industry_name, p.food_category;