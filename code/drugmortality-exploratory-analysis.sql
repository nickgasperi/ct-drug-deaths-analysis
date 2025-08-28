-- Exploratory Analysis --
-- deaths by year --
SELECT
	death_year,
	COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY death_year
ORDER BY death_year ASC
;

-- create year brackets --
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

-- number and pct of deaths by demographic groups --
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
;

-- age --
SELECT
	AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age
FROM drug_related_deaths
;

-- create age brackets --
SELECT
	CASE
		WHEN age < 18 THEN '0-18'
		WHEN age BETWEEN 18 AND 29 THEN '18-29'
		WHEN age BETWEEN 30 AND 49 THEN '30-49'
		WHEN age BETWEEN 50 AND 64 THEN '50-64'
        WHEN age > 64 THEN '65+'
        ELSE 'n/a'
	END AS age_bracket,
	COUNT(*) AS census,
    COUNT(*) / (
				SELECT COUNT(*)
                FROM drug_related_deaths
                ) AS pct_of_total
FROM drug_related_deaths
GROUP BY age_bracket
ORDER BY age_bracket ASC
;

-- identify common  --
-- location of death --
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

-- type of drug --
SELECT
	opioid_any,
	COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY opioid_any
;

-- heroin presence --
SELECT COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE heroin = 'Y'
;

-- fentanyl presence --
SELECT COUNT(*) AS num_of_deaths
FROM drug_related_deaths
WHERE
	fentanyl = 'Y' OR
    fentanyl_analogue = 'Y'
;

-- location --
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