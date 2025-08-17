# Drug-Related Deaths in Connecticut (2012–2024)
*Click here to view the full GitHub Repository*
</p>

<p align = "center">
  <img src = "images/ct-drug-deaths-dashboard.png">
</p>

## **Project Background**
This project analyzes accidental drug-related mortalities in Connecticut from 2012–2024 to determine the most common settings for overdoses, and ultimately set up future research to decrease the number of deaths from overdoses in Connecticut.
<br>

## **Objectives**
1. Identify at-risk demographic groups within Connecticut's population.
2. Identify where fatal overdoses are most likley to occur.
3. Identify the drugs that most frequently lead to fatal overdoses.
4. Form recommendations to shape future research and support initiatives to reduce drug-related mortalities at the state level.

## **Data Overview**
The data used in this project was published by the State of Connecticut via [data.gov](https://catalog.data.gov/dataset/accidental-drug-related-deaths-2012-2018). The dataset includes a single table containing 12,963 records, each representing a drug-related death. Each record contains information regarding the deceased's demographics, location of death, and drugs identified in the autopsy. This dataset separates *Ethnicity* and *Race* into distinct variables. Ethnicity indicates whether the individual was Hispanic/Latino, while Race does not include a Hispanic/Latino category. This distinction is important when comparing these results to other state-level demographic data sources, which may classify Hispanic/Latino within *Race*. As a result, the large proportion of individuals identified as White in this dataset may appear inflated relative to other sources that do not distinguish between *Ethnicity* and *Race*. 

## **Executive Summary**
Drug-related mortalities rose steadily each year from 2012–2020, before peaking in 2021 at 1,524. Total deaths have decreased each year since 2022, dropping to 982 deaths in 2024. <br>
Whites 83% and males 74%. <br>
Over half of deaths occurred in the deceased's residence (53%), while the second-most common place of death was hospitals, accounting for 33% of deaths. <br>
Over 79% of the deceased tested positive for more than one type of drug, suggesting that combining drugs increases the likelihood of a fatal overdose. Opioids were present in 75% of deaths. The most prevalent drug was fentanyl, a type of opioid, used by 68% of deceased individuals.

## **Key Insights**
### **At-Risk Demographics**
* The majority of deceased individuals were White, accounting for over 83% of all deaths in the dataset.
* 74% of the deceased were males.
* The 30–49 age bracket suffered the most mortalities, accounting for 48% of total deaths. The next most common age range was 50–64 at 33%.

### **Prevalent Overdose Locations**
* most overdoses related to cities with greatest populations.
* About 97% of deceased resided in in state - adjust to include nulls
* The deceased's residence , 53%. Second most common Hospital
* Despite people spending more time at home during the COVID pandemic, there was no notable rise in deaths at residences.

### **Leading Drug Types**
* More than 80% of deceased tested positive for more than one type of drug.
* 75% of overdoses involved an opioid.
* Fentanyl was the most commonly found drug, in 68% of individuals.

## **Recommendations**
1. Investigate first responder response times to house calls in [most common cities and remote areas].
2. opioids, specifically fentanyl. Laced or taking it straight?
3. 