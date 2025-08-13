-- Exploratory Analysis --

-- number of deaths by demographic groups --
-- race --
SELECT race, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY race
;

-- sex --
SELECT sex, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY sex
;

-- ethnicity --
SELECT ethnicity, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY ethnicity
;

-- average age --
SELECT AVG(age) AS avg_age
FROM drug_related_deaths
;

-- death between age groups --


-- deaths by year --
SELECT death_year, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY death_year
ORDER BY death_year ASC
;

-- where they died --
SELECT death_location, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY death_location
;

-- type of drug --
SELECT opioid_any, COUNT(*) AS num_of_deaths
FROM drug_related_deaths
GROUP BY opioid_any
;
-- if not opioids, which drug(s) should they look out for? --

 