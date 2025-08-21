-- Exploratory Analysis --

-- # basic exploration --
-- residence state of deceased --
SELECT
	residence_state,
	COUNT(*) AS residents,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY residence_state
;

-- total deaths by year --
SELECT
	death_year,
	COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY death_year
ORDER BY death_year ASC
;

-- num & pct of deaths by year ranges --
SELECT
	CASE
		WHEN death_year BETWEEN 2012 AND 2015 THEN '2012-2015'
        WHEN death_year BETWEEN 2016 AND 2019 THEN '2016-2019'
        WHEN death_year BETWEEN 2020 AND 2023 THEN '2020-2023'
        ELSE 'other'
	END AS death_year_bracket,
    COUNT(*) as census,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY death_year_bracket
ORDER BY death_year_bracket ASC
;

-- # demographics: num & pct of deaths by demo groups --
-- race --
SELECT
	race,
    COUNT(*) AS num_of_deaths,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY race
;

-- gender --
SELECT
	sex,
    COUNT(*) AS num_of_deaths,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY sex
;

-- ethnicity --
SELECT
	ethnicity,
    COUNT(*) as num_of_deaths,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY ethnicity
ORDER BY num_of_deaths DESC
;

-- age --
SELECT
	AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age
FROM drug_related_deaths
;

-- num & pct of deaths by age brackets --
SELECT
	CASE
		WHEN age < 18 THEN '0-18'
		WHEN age BETWEEN 18 AND 29 THEN '18-29'
		WHEN age BETWEEN 30 AND 49 THEN '30-49'
		WHEN age BETWEEN 50 AND 64 THEN '50-64'
        WHEN age > 64 THEN '65+'
        ELSE 'n/a'
	END AS age_bracket,
	COUNT(*) AS num_of_deaths,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY age_bracket
ORDER BY age_bracket ASC
;

-- only people under 30 --
-- gender --
SELECT
    sex,
    COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE age < 30
GROUP BY sex
;

-- race --
SELECT
	race,
    COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE age < 30
GROUP BY race
;

-- # identify prevalent death locations --
-- where the overdose occurred --
SELECT
	death_location,
    COUNT(*) AS num_of_deaths,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
				) AS pct_of_total
FROM drug_related_deaths
GROUP BY death_location
;

-- residential deaths by year --
SELECT
	death_year,
    COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE death_location = 'Residence'
GROUP BY death_year
ORDER BY death_year ASC
;

-- # deaths by city --
SELECT
	death_city,
    COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY death_city
ORDER BY num_of_deaths DESC
;

-- # identify leading drug types --
-- num of deaths involving any opioid --
SELECT
	opioid_any,
	COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY opioid_any
;

-- num of deaths involving heroin --
SELECT COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE heroin = 'Y'
;

-- num of deaths involving fentanyl --
SELECT COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE
	fentanyl = 'Y' OR
    fentanyl_analogue = 'Y'
;