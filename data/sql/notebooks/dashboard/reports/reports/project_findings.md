Household Energy Consumption — Key Findings

1. Project Overview

This project analyzes the UCI Individual Household Electric Power Consumption dataset to understand household electricity usage patterns over time. Python and pandas were used for data cleaning and analysis, and Matplotlib was used to create visualizations.

Dataset source : https://archive.ics.uci.edu/dataset/235/individual+household+electric+power+consumption

2. Data Cleaning

Original records: 2,075,259

Records removed due to missing measurement values: 25,979

Cleaned records: 2,049,280

Complete days used for daily energy analysis: 1,358

Incomplete days excluded from daily totals: 75

Rows with all seven measurement fields missing were removed. Daily energy comparisons were restricted to days containing all 1,440 minute-level readings.

3. Key Findings

Hourly consumption

Highest average active power occurred at 20:00 (8 PM), at 1.899 kW.

Lowest average active power occurred at 04:00 (4 AM), at 0.444 kW.

This indicates a clear difference between nighttime low-demand periods and evening high-demand periods.

Weekday versus weekend

Weekday average active power: 1.035 kW.

Weekend average active power: 1.234 kW.

Weekend average power was approximately 19.23% higher than weekday average power.

This is an observed association in the dataset and does not establish the cause of the difference.

Monthly patterns

December had the highest average active power: 1.490 kW.

August had the lowest average active power: 0.573 kW.

These are averages across the available observations for each calendar month. Seasonal effects or other causes cannot be established from these results alone.

Sub-metering

Sub-metering 1 average: 1.122 Wh/min.

Sub-metering 2 average: 1.299 Wh/min.

Sub-metering 3 average: 6.458 Wh/min.

Sub-metering 3, associated with the electric water heater and air conditioner, had the highest average reading among the three sub-metering categories.

Daily energy

Average daily energy across complete days: 25.98 kWh.

Highest observed daily energy: 79.56 kWh on 23 December 2006.

Lowest observed daily energy: 4.17 kWh on 25 August 2008.

These values are based on complete days only.

Yearly patterns

Average active power was 1.117 kW in 2007, 1.072 kW in 2008, 1.079 kW in 2009, and 1.061 kW in 2010. The 2006 and 2010 observations cover partial calendar years, so direct annual comparisons require caution.

4. Tools and Skills

Python

pandas

Matplotlib

Data cleaning and missing-value handling

Time-based grouping and aggregation

Exploratory data analysis (EDA)

KPI calculation and visualization

CSV export and GitHub version control

5. Limitations

The analysis covers one household's historical measurements and may not represent other households.

Incomplete measurement days were excluded from daily energy comparisons.

Monthly and yearly averages may be affected by uneven calendar coverage.

Observed patterns do not establish causation.

Sub-metering values are reported in the dataset's measurement units and should not be treated as percentages of total electricity consumption.

6. Conclusion

The analysis identified evening peak usage, lower early-morning usage, higher average weekend power, and variation across months and sub-metering categories. These findings demonstrate how time-based exploratory analysis can help characterize household electricity consumption and inform further investigation into energy-use patterns.
