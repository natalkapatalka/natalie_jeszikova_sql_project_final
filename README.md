# SQL projekt – Analýza dostupnosti potravin v ČR

## Popis projektu
Cílem tohoto projektu je analyzovat vývoj mezd a cen vybraných potravin v České republice v čase a posoudit jejich vzájemné vztahy. Projekt dále zkoumá souvislost mezi vývojem HDP a změnami mezd a cen potravin.

Analýza vychází z veřejně dostupných dat Českého statistického úřadu a mezinárodních ekonomických databází.

---

## Použité databázové tabulky
Projekt využívá následující zdrojové tabulky:
- `czechia_payroll`
- `czechia_payroll_value_type`
- `czechia_payroll_industry_branch`
- `czechia_price`
- `czechia_price_category`
- `economies`
- `countries`

Data nebyla v původních tabulkách nijak upravována. Veškeré transformace probíhaly až v nově vytvořených tabulkách.

---

## Výstupní tabulky

### Primární tabulka
`t_natalie_jeszikova_project_sql_primary_final`

Obsahuje sjednocená data o:
- průměrných mzdách podle odvětví,
- cenách potravin podle kategorií,
- společném časovém období (rok),
- názvech odvětví a potravin,
- jednotkách a množstvích potravin.

Tabulka slouží k odpovědi na první čtyři výzkumné otázky.

---

### Sekundární tabulka
`t_natalie_jeszikova_project_sql_secondary_final`

Obsahuje ekonomické ukazatele evropských států:
- HDP,
- GINI koeficient,
- populaci,
- rok.

Tabulka slouží k analýze vztahu mezi HDP, mzdami a cenami potravin.

---

## Výzkumné otázky
1. Rostou mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik litrů mléka a kilogramů chleba je možné si koupit za první a poslední sledované období?
3. Která kategorie potravin zdražuje nejpomaleji?
4. Existuje rok, kdy byl růst cen potravin výrazně vyšší než růst mezd?
5. Má vývoj HDP vliv na růst mezd a cen potravin?

---
##  Odpovědi na výzkumné otázky
1. Mzdy obecně časem rostou, ale některá odvětví zažívají stagnaci nebo pokles v určitých letech.
2. V prvním sledovaném roce bylo možné si z průměrné mzdy koupit přibližně 1437 litrů mléka a 1287 kilogramů chleba.
   V posledním sledovaném roce se toto množství změnilo na přibližně 1641 litrů mléka a 1342 kilogramů chleba.
3. Nejpomaleji zdražuje cukr krystalový s poklesem ceny -0.09%
4. Takový rok neexistuje.
5. Z výsledků analýzy nevyplývá jednoznačná závislost mezi růstem HDP a růstem mezd či cen potravin. 
V některých letech se tyto ukazatele vyvíjejí stejným směrem, v jiných však nikoliv, a proto nelze potvrdit přímý vliv HDP na jejich vývoj.

