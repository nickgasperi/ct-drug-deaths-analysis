-- Data Cleaning --
-- Delete column --
ALTER TABLE drug_related_deaths
	DROP COLUMN `Heroin death certificate (DC)`
;

-- Rename columns --
ALTER TABLE drug_related_deaths
	RENAME COLUMN `Date` to `date`,
	RENAME COLUMN `Date Type` to `date_type`,
	RENAME COLUMN `Age` to `age`,
	RENAME COLUMN `Sex` to `sex`,
	RENAME COLUMN `Race` to `race`,
	RENAME COLUMN `Ethnicity` to `ethnicity`,
	RENAME COLUMN `Residence City` to `residence_city`,
	RENAME COLUMN `Residence County` to `residence_county`,
	RENAME COLUMN `Residence State` to `residence_state`,
	RENAME COLUMN `Injury City` to `injury_city`,
	RENAME COLUMN `Injury County` to `injury_county`,
	RENAME COLUMN `Injury State` to `injury_state`,
    RENAME COLUMN `Injury Place` to `injury_place`,
	RENAME COLUMN `Description of Injury` to `injury_description`,
	RENAME COLUMN `Death City` to `death_city`,
	RENAME COLUMN `Death County` to `death_county`,
	RENAME COLUMN `Death State` to `death_state`,
	RENAME COLUMN `Location` to `death_location`,
	RENAME COLUMN `Location if Other` to `death_location_other`,
	RENAME COLUMN `Cause of Death` to `cause_of_death`,
	RENAME COLUMN `Manner of Death` to `manner_of_death`,
	RENAME COLUMN `Other Significant Conditions` to `other_conditions`,
	RENAME COLUMN `Heroin` to `heroin`,
	RENAME COLUMN `Cocaine` to `cocaine`,
	RENAME COLUMN `Fentanyl` to `fentanyl`,
	RENAME COLUMN `Fentanyl Analogue` to `fentanyl_analogue`,
	RENAME COLUMN `Oxycodone` to `oxycodone`,
	RENAME COLUMN `Oxymorphone` to `oxymorphone`,
	RENAME COLUMN `Ethanol` to `ethanol`,
	RENAME COLUMN `Hydrocodone` to `hydrocodone`,
	RENAME COLUMN `Benzodiazepine` to `benzodiazepine`,
	RENAME COLUMN `Methadone` to `methadone`,
	RENAME COLUMN `Meth/Amphetamine` to `methamphetamine`,
	RENAME COLUMN `Amphet` to `amphet`,
	RENAME COLUMN `Tramad` to `tramadol`,
	RENAME COLUMN `Hydromorphone` to `hydromorphone`,
	RENAME COLUMN `Morphine (Not Heroin)` to `morphine_not_heroin`,
	RENAME COLUMN `Xylazine` to `xylazine`,
	RENAME COLUMN `Gabapentin` to `gabapentin`,
	RENAME COLUMN `Opiate NOS` to `opiate_nos`,
	RENAME COLUMN `Heroin/Morph/Codeine` to `heroin_morphine_codeine`,
	RENAME COLUMN `Other Opioid` to `opioid_other`,
	RENAME COLUMN `Any Opioid` to `opioid_any`,
	RENAME COLUMN `Other` to `other`,
	RENAME COLUMN `ResidenceCityGeo` to `residence_geo_location`,
	RENAME COLUMN `InjuryCityGeo` to `injury_geo_location`,
	RENAME COLUMN `DeathCityGeo` to `death_geo_location`
;

-- Replace blank and inconsistent values --
-- two missing age values, using median value to replace missing data --
UPDATE drug_related_deaths
SET age = 44
WHERE age = ''
;

UPDATE drug_related_deaths
SET sex = 'Unknown'
WHERE sex NOT IN ('Male', 'Female')
;

UPDATE drug_related_deaths
SET death_location = CASE
	WHEN death_location = 'Hiospital' THEN 'Hospital'
    WHEN death_location = 'Hospital - ER/Outpatient' THEN 'Hospital'
    WHEN death_location = 'Hospital - Inpatient' THEN 'Hospital'
    WHEN death_location = 'Hospital - Dead on Arrival' THEN 'Hospital'
    WHEN death_location = 'Nursing Home' THEN 'Assisted Living'
    WHEN death_location = 'Hospice Facility' THEN 'Assisted Living'
    WHEN death_location = 'Hospice' THEN 'Assisted Living'
    WHEN death_location = 'Convalescent Home' THEN 'Assisted Living'
	WHEN death_location = 'Shelter' THEN 'Assisted Living'
    WHEN death_location = 'Decedentâ€™s Home' THEN 'Residence'   
    WHEN death_location = 'Decedent''s Home' THEN 'Residence'
	WHEN death_location = 'Other (Specify)' THEN 'Other'
    ELSE death_location
END
;

UPDATE drug_related_deaths
SET race = CASE
	WHEN race = '' THEN 'Unknown'
    WHEN race = 'Asian Indian' THEN 'Asian'
    WHEN race = 'Asian/Indian' THEN 'Asian'
    WHEN race = 'Other Asian (Specify)' THEN 'Asian'
    WHEN race = 'Other Asian' THEN 'Asian'
    WHEN race = 'Asian, Other' THEN 'Asian'
    WHEN race = 'Chinese' THEN 'Asian'
    WHEN race = 'Korean' THEN 'Asian'
    WHEN race = 'Korean' THEN 'Asian'
    WHEN race = 'Japanese' THEN 'Asian'
    WHEN race = 'Black or African American' THEN 'Black'
    WHEN race = 'Black or African American / American Indian Lenni Lenape' THEN 'Other'
    WHEN race = 'Hawaiian' THEN 'Other'
    WHEN race = 'Other (Specify)' THEN 'Other'
    WHEN race = 'Other (Specify) portugese, Cape Verdean' THEN 'Other'
    WHEN race = 'Other (Specify) Puerto Rican' THEN 'Other'
    WHEN race = 'Other (Specify) Haitian' THEN 'Other'
    WHEN race = 'Native American, Other' THEN 'Native American'
    WHEN race = 'American Indian or Alaska Native' THEN 'Native American'
    ELSE race
END
;

UPDATE drug_related_deaths
SET death_city = CASE
	WHEN death_city = '6340' THEN 'Unknown'
    WHEN death_city = 'N HAVEN' THEN 'NORTH HAVEN'
    WHEN death_city = 'NEW CANNAN' THEN 'NEW CANAAN'
    WHEN death_city = 'NO HAVEN' THEN 'NORTH HAVEN'
    WHEN death_city = 'NORTH WINDAM' THEN 'NORTH WINDHAM'
    WHEN death_city = 'STAFFORD SPGS' THEN 'STAFFORD SPRINGS'
    WHEN death_city = 'W HAVEN' THEN 'WEST HAVEN'
    WHEN death_city = 'WILLIAMNTIC' THEN 'WILLIMANTIC'
    WHEN death_city = 'S GLASTONBURY' THEN 'SOUTH GLASTONBURY'
    ELSE death_city
END
;

UPDATE drug_related_deaths
SET ethnicity = CASE
	WHEN ethnicity = 'No, not Spanish/Hispanic/Latino' THEN 'Not Hispanic/Latino'
    WHEN ethnicity = 'n' THEN 'Not Hispanic/Latino'
    WHEN ethnicity = 'Not Spanish/Hispanic/Latino' THEN 'Not Hispanic/Latino'
    WHEN ethnicity = 'Unknown' THEN 'Unknown'
    WHEN ethnicity = '' THEN 'Unknown'
    ELSE 'Hispanic/Latino'
END
;

UPDATE drug_related_deaths
SET
	`residence_city` = NULLIF(`residence_city`, ''),
	`residence_county` = NULLIF(`residence_county`, ''),
	`residence_state` = NULLIF(`residence_state`, ''),
	`injury_city` = NULLIF(`injury_city`, ''),
	`injury_county` = NULLIF(`injury_county`, ''),
	`injury_state` = NULLIF(`injury_state`, ''),
    `injury_place` = NULLIF(`injury_place`, ''),
	`injury_description` = NULLIF(`injury_description`, ''),
	`death_city` = NULLIF(`death_city`, ''),
	`death_county` = NULLIF(`death_county`, ''),
	`death_state` = NULLIF(`death_state`, ''),
	`death_location` = NULLIF(`death_location`, ''),
	`death_location_other` = NULLIF(`death_location_other`, ''),
	`cause_of_death` = NULLIF(`cause_of_death`, ''),
	`manner_of_death` = NULLIF(`manner_of_death`, ''),
	`other_conditions` = NULLIF(`other_conditions`, ''),
	`other` = NULLIF(`other`, ''),
	`residence_geo_location` = NULLIF(`residence_geo_location`, ''),
	`injury_geo_location` = NULLIF(`injury_geo_location`, ''),
	`death_geo_location` = NULLIF(`death_geo_location`, '')
;

UPDATE drug_related_deaths
SET
	`heroin` = CASE WHEN `heroin` = '' THEN 'N' ELSE `heroin` END,
	`cocaine` = CASE WHEN `cocaine` = '' THEN 'N' ELSE `cocaine` END,	
	`fentanyl` = CASE WHEN `fentanyl` = '' THEN 'N' ELSE `fentanyl` END,
	`fentanyl_analogue` = CASE WHEN `fentanyl_analogue` = '' THEN 'N' ELSE `fentanyl_analogue` END,
	`oxycodone` = CASE WHEN `oxycodone` = '' THEN 'N' ELSE `oxycodone` END,
	`oxymorphone` = CASE WHEN `oxymorphone` = '' THEN 'N' ELSE `oxymorphone` END,
	`ethanol` = CASE WHEN `ethanol` = '' THEN 'N' ELSE `ethanol` END,
	`hydrocodone` = CASE WHEN `hydrocodone` = '' THEN 'N' ELSE `hydrocodone` END,
	`benzodiazepine` = CASE WHEN `benzodiazepine` = '' THEN 'N' ELSE `benzodiazepine` END,
	`methadone` = CASE WHEN `methadone` = '' THEN 'N' ELSE `methadone` END,
	`methamphetamine` = CASE WHEN `methamphetamine` = '' THEN 'N' ELSE `methamphetamine` END,
	`amphet` = CASE WHEN `amphet` = '' THEN 'N' ELSE `amphet` END,
	`tramadol` = CASE WHEN `tramadol` = '' THEN 'N' ELSE `tramadol` END,
	`morphine_not_heroin` = CASE WHEN `morphine_not_heroin` = '' THEN 'N' ELSE `morphine_not_heroin` END,
	`xylazine` = CASE WHEN `xylazine` = '' THEN 'N' ELSE `xylazine` END,
	`gabapentin` = CASE WHEN `gabapentin` = '' THEN 'N' ELSE `gabapentin` END,
	`opiate_nos` = CASE WHEN `opiate_nos` = '' THEN 'N' ELSE `opiate_nos` END,
	`hydromorphone` = CASE WHEN `hydromorphone` = '' THEN 'N' ELSE `hydromorphone` END,
	`heroin_morphine_codeine` = CASE WHEN `heroin_morphine_codeine` = '' THEN 'N' ELSE `heroin_morphine_codeine` END,
	`opioid_other` = CASE WHEN `opioid_other` = '' THEN 'N' ELSE `opioid_other` END,
	`opioid_any` = CASE WHEN `opioid_any` = '' THEN 'N' ELSE `opioid_any` END
;

-- continue cleaning same columns, standardizing all records that indicate Yes --
UPDATE drug_related_deaths
SET
	`fentanyl` = CASE WHEN `fentanyl` LIKE 'Y%' THEN 'Y' ELSE `fentanyl` END,
    `ethanol` = CASE WHEN `ethanol` = 'P' THEN 'N' ELSE `ethanol` END,
    `morphine_not_heroin` = CASE WHEN 
		`morphine_not_heroin` LIKE 'N%' OR
        `morphine_not_heroin` LIKE 'P%' OR
        `morphine_not_heroin` LIKE 'S%'
	THEN 'N' ELSE `morphine_not_heroin` END
;

-- Split columns --
-- extract year from `date` into new column --
ALTER TABLE drug_related_deaths
ADD COLUMN death_year INT
;

UPDATE drug_related_deaths
SET death_year = SUBSTRING_INDEX(date, '/', -1)
;

-- extract coordinates from geo columns -- 
ALTER TABLE drug_related_deaths
ADD COLUMN residence_coord VARCHAR(255),
ADD COLUMN injury_coord VARCHAR(255),
ADD COLUMN death_coord VARCHAR(255)
;

UPDATE drug_related_deaths
SET residence_coord = CASE
	WHEN residence_geo_location IS NULL THEN NULL
    WHEN residence_geo_location LIKE '%(%' THEN SUBSTRING_INDEX(residence_geo_location, '(', -1)
    ELSE NULL
END
;

UPDATE drug_related_deaths
SET residence_coord = LEFT(residence_coord, LENGTH(residence_coord) - 1)
WHERE residence_coord IS NOT NULL
;

UPDATE drug_related_deaths
SET injury_coord = CASE
	WHEN injury_geo_location IS NULL THEN NULL
    WHEN injury_geo_location LIKE '%(%' THEN SUBSTRING_INDEX(injury_geo_location, '(', -1)
    ELSE NULL
END
;

UPDATE drug_related_deaths
SET injury_coord = LEFT(injury_coord, LENGTH(injury_coord) - 1)
WHERE injury_coord IS NOT NULL

;
UPDATE drug_related_deaths
SET death_coord = CASE
	WHEN death_geo_location IS NULL THEN NULL
    WHEN death_geo_location LIKE '%(%' THEN SUBSTRING_INDEX(death_geo_location, '(', -1)
    ELSE NULL
END
;

UPDATE drug_related_deaths
SET death_coord = LEFT(death_coord, LENGTH(death_coord) - 1)
WHERE death_coord IS NOT NULL
;

-- extract latitude and longitude from death location for future viz --
ALTER TABLE drug_related_deaths
	ADD COLUMN death_latitude DECIMAL(10, 6),
	ADD COLUMN death_longitude DECIMAL(10,6)
;

UPDATE drug_related_deaths
SET
	death_latitude = TRIM(SUBSTRING_INDEX(death_coord, ',', 1)),
    death_longitude = TRIM(SUBSTRING_INDEX(death_coord, ',', -1))
;