# Stats-68-MP2
# Exploratory Data Analysis of Athlete Performance Data

## Project Overview
This project focuses on the exploratory data analysis (EDA) of athlete performance data spanning 11 seasons. The dataset includes information on 50 players across 7 variables, such as player value, sport, age, and weekly training hours. The goal of this project was to identify trends and relationships between player value and various factors like age, injuries, training hours, and demographic characteristics.

## Dataset
- **Seasons:** 11
- **Players:** 50
- **Variables:** 7 (Player Value, Sport, Age, Gender, Location, Weekly Training Hours, Injuries)
- **Missing Data:**
  - Weekly training data: 3 missing
  - Age: 3 missing
  - Injuries: 4 missing
  - Location: 1 missing
  - Gender: 3 missing
  - Sport: 1 missing

## Objectives
- Investigate how player value changes over seasons.
- Explore correlations between player value and age, injuries, and training hours.
- Examine distribution of athletes by gender, sport, and location.
- Identify any interesting trends or outliers.

## Key Findings
- **Player Value:** A negative relationship between age and player value, suggesting older athletes tend to have lower values.
- **Injuries:** Surprisingly, a positive correlation was observed between the number of injuries and player value.
- **Training Hours:** A slight positive relationship between weekly training hours and player value.
- **Demographics:**
  - Soccer had the highest number of athletes.
  - Gender distribution was imbalanced, with 37 male, 10 female, and 3 unspecified athletes.
  - Saudi Arabia had the highest average player value, while the UK had the lowest.

## Methods
- **Data Cleaning:** Addressed missing data and ensured categorical variables were properly labeled.
- **Visualization:** Used scatter plots, histograms, and box plots to explore relationships between variables.
- **Statistical Analysis:** Applied least squares regression to uncover relationships between player value and other factors.

## Tools Used
- **Programming Language:** R
- **Libraries:** ggplot2, dplyr, tidyr

## Next Steps
- Incorporate additional data, such as specific years for each season, to better understand context (e.g., global events like the pandemic).
- Explore more sports categories like Badminton, Swimming, and Rowing.
- Develop predictive models for player value based on key variables.

## How to Run the Code
1. Clone the repository:
   ```bash
   git clone <your-repo-link>
   ```
2. Open the R script and ensure all required libraries are installed.
3. Run the analysis by executing the scripts in order.

---

