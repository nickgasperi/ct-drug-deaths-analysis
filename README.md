# Drug-Related Deaths in Connecticut (2012–2024)

## **Project Background**
This analysis examines accidental drug-related deaths in Connecticut from 2012–2024 to identify demographic groups, geographic areas, and substance-related patterns most commonly associated with fatal overdoses. These findings will provide a foundation for future research and support initiatives aimed at reducing drug-related deaths at the state level.

- To download an interactive Power BI dashboard, click [*here*](https://github.com/nickgasperi/ct-drug-deaths-analysis/raw/main/powerbi/ct-drug-deaths-analysis_public.pbix).<br>
- To view the SQL queries utilized to clean the dataset, click [*here*](https://github.com/nickgasperi/ct-drug-deaths-analysis/blob/main/code/drugmortality-data-cleaning.sql).<br>
- To view the SQL queries utilized to perform exploratory data analysis, click [*here*](https://github.com/nickgasperi/ct-drug-deaths-analysis/blob/main/code/drugmortality-exploratory-analysis.sql).

## **Objectives**
1. Identify at-risk demographic groups within Connecticut's population.
2. Identify where fatal overdoses are most likely to occur.
3. Identify the types of drugs most frequently involved in fatal overdoses.

## **Data Overview**
The data used in this project was published by the State of Connecticut via [data.gov](https://catalog.data.gov/dataset/accidental-drug-related-deaths-2012-2018). The dataset includes a single table containing 12,963 records, each representing a drug-related death. Each record contains information regarding the deceased's demographics, location of death, and types of drugs identified in the autopsy. This dataset separates *Ethnicity* and *Race* into distinct variables. *Ethnicity* indicates whether the individual was Hispanic/Latino, while *Race* does not include a Hispanic/Latino category. This distinction is important when comparing these results to other demographic data sources, which may classify Hispanic/Latino within *Race*.

## **Executive Summary**
The number of fatal overdoses in Connecticut rose steadily each year from 2012–2020, peaking in 2021 at 1,524 deaths. Total deaths have decreased each year since 2022, dropping to 982 in 2024. The majority of decedents were White (83%) and male (74%). The most common overdose location was the deceased's residence, while hospitals were the second-most common location. Over 79% of decedents tested positive for more than one type of drug. The most prevalent class of drug was opioids, present in 75% of cases. The most common individual drug was fentanyl, a type of opioid, found in 68% of decedents.

<div align="center">
  <img src="images/ct-drug-deaths-dashboard.png"><br>
  <a href="https://github.com/nickgasperi/ct-drug-deaths-analysis/raw/main/powerbi/ct-drug-deaths-analysis_public.pbix"
  style="font-size:12px; font-style:italic;">
    Download Interactive Dashboard
  </a>
</div>

## **Key Insights**
### **At-Risk Demographics**
* The majority of decedents were White, accounting for over 83% of total deaths.
* 74% were male, and 61% were both White and male.
* The average age at death was 44 years. The 30–49 age group accounted for the greatest number of deaths with 6,192 (48% of total), followed by the 50–64 age group with 4,295 deaths (33% of total).
* Teenagers accounted for <1% of cases, with 87 total deaths.

### **Prevalent Overdose Locations**
* The most common place of death was the decedent's residence (43%), followed by hospitals (24%).
* The largest cities generally experienced the greatest number of fatal overdoses. Hartford, New Haven, Waterbury, and Bridgeport—four of five most populous cities in Connecticut—were also among the top five cities in total deaths.
* Stamford, despite having the second-highest population in Connecticut, accounted for just the 15th most deaths with 136.

### **Leading Drug Types**
* 79% of decedents tested positive for more than one type of drug.
* Opioids were present in 75% of overdoses. Fentanyl was the most prevalent drug, detected in 68% of cases.
* Other common substances included cocaine, present in 40% of deaths, and heroin in 28% of deaths.

## **Recommendations**
1. Compare the significant presence of White and male decedents in the dataset to statewide demographic figures to determine whether these groups are overrepresented in fatal overdoses. 
2. Measure the proximity of residences where overdoses occurred to the nearest hospital to explore whether access to timely emergency care affects overdose mortality. 
3. Investigate why Stamford, despite a large population, had relatively few overdose deaths by examining additional demographic, socioeconomic, and public health factors.
4. Conduct further analysis of polysubstance use to determine whether certain drug combinations are associated with higher risk of a fatal overdose.
5. Compare the significant presence of opioids in Connecticut fatal overdoses to national trends to evaluate whether state-level policies should prioritize reducing opioid presence.

## **Caveats & Limitations**
* Approximately 18% of records did not include a death location, resulting in understated proportions of deaths at key locations. With null values excluded, the share of deaths occurring at residences increased from 43% to 53%, and hospitals from 24% to 29%.
* *Ethnicity* was not included in demographic analysis, as 74% of records contained null values.
* Percentages of specific substances reflect cases where a drug was present, and are not mutually exclusive as multiple types of drugs can be present in the same individual.

