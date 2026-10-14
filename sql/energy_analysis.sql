
-- ============================================================
-- PROJECT: Household Energy Consumption Analytics
-- DATABASE: energy_analytics
-- DATA SOURCE: UCI Individual Household Electric Power Consumption
--
-- NOTE:
-- These queries analyze precomputed summary tables imported
-- into MySQL, not the original minute-level dataset directly.
-- ============================================================


-- 1. HOURLY HOUSEHOLD POWER
-- View average active power for each hour.

SELECT
    Hour,
    Average_Power_kW
FROM hourly_usage
ORDER BY Hour;


-- 2. FIND THE HIGHEST AND LOWEST POWER HOURS

SELECT
    Hour,
    Average_Power_kW
FROM hourly_usage
ORDER BY Average_Power_kW DESC
LIMIT 5;

SELECT
    Hour,
    Average_Power_kW
FROM hourly_usage
ORDER BY Average_Power_kW ASC
LIMIT 5;


-- 3. MONTHLY AVERAGE HOUSEHOLD POWER
-- Display months in calendar order.

SELECT
    Month,
    MonthName,
    Average_Power_kW
FROM monthly_usage
ORDER BY Month;


-- 4. RANK MONTHS BY AVERAGE POWER
-- Identify the months with the highest average power.

SELECT
    MonthName,
    Average_Power_kW
FROM monthly_usage
ORDER BY Average_Power_kW DESC;


-- 5. WEEKDAY USAGE
-- Display average power for each weekday.

SELECT
    DayOfWeek,
    Average_Power_kW
FROM weekday_usage
ORDER BY Average_Power_kW DESC;


-- 6. WEEKDAY VS WEEKEND COMPARISON

SELECT
    Day_Type,
    Average_Power_kW
FROM weekend_comparison
ORDER BY Average_Power_kW DESC;


-- 7. WEEKDAY VS WEEKEND USING CASE WHEN
-- Convert the weekday and weekend rows into separate columns.

SELECT
    MAX(
        CASE
            WHEN Day_Type = 'Weekday'
            THEN Average_Power_kW
        END
    ) AS Weekday_Avg,

    MAX(
        CASE
            WHEN Day_Type = 'Weekend'
            THEN Average_Power_kW
        END
    ) AS Weekend_Avg,

    ROUND(
        MAX(
            CASE
                WHEN Day_Type = 'Weekend'
                THEN Average_Power_kW
            END
        )
        -
        MAX(
            CASE
                WHEN Day_Type = 'Weekday'
                THEN Average_Power_kW
            END
        ),
        3
    ) AS Difference_kW,

    ROUND(
        (
            MAX(
                CASE
                    WHEN Day_Type = 'Weekend'
                    THEN Average_Power_kW
                END
            )
            -
            MAX(
                CASE
                    WHEN Day_Type = 'Weekday'
                    THEN Average_Power_kW
                END
            )
        )
        /
        MAX(
            CASE
                WHEN Day_Type = 'Weekday'
                THEN Average_Power_kW
            END
        ) * 100,
        2
    ) AS Increase_Percent

FROM weekend_comparison;


-- 8. SUB-METERING ANALYSIS
-- Compare average readings across the three sub-metering categories.

SELECT *
FROM submeter_usage;


-- 9. YEARLY AVERAGE HOUSEHOLD POWER

SELECT
    Year,
    Average_Power_kW
FROM yearly_usage
ORDER BY Year;


-- 10. TOP 10 HIGHEST-CONSUMPTION DAYS

SELECT
    Date,
    Daily_Energy_kWh,
    Available_Readings,
    Missing_Readings
FROM top_10_days
ORDER BY Daily_Energy_kWh DESC
LIMIT 10;


-- 11. FILTER DAYS WITH ENERGY CONSUMPTION ABOVE 50 kWh
-- Use all complete days, not only the top 10 days.

SELECT
    Date,
    Daily_Energy_kWh
FROM complete_daily_usage
WHERE Daily_Energy_kWh > 50
ORDER BY Daily_Energy_kWh DESC;


-- 12. COUNT DAYS ABOVE 50 kWh

SELECT
    COUNT(*) AS Days_Above_50_kWh
FROM complete_daily_usage
WHERE Daily_Energy_kWh > 50;


-- 13. MAXIMUM AND MINIMUM ENERGY AMONG DAYS ABOVE 50 kWh

SELECT
    MAX(Daily_Energy_kWh) AS Highest_Energy_kWh,
    MIN(Daily_Energy_kWh) AS Lowest_Above_50_kWh
FROM complete_daily_usage
WHERE Daily_Energy_kWh > 50;


-- 14. SUMMARY STATISTICS FOR DAYS ABOVE 50 kWh
-- Count, maximum, minimum, and average in one result.

SELECT
    COUNT(*) AS Days_Above_50_kWh,
    MAX(Daily_Energy_kWh) AS Highest_Energy_kWh,
    MIN(Daily_Energy_kWh) AS Lowest_Above_50_kWh,
    ROUND(AVG(Daily_Energy_kWh), 2) AS Average_Energy_kWh
FROM complete_daily_usage
WHERE Daily_Energy_kWh > 50;


-- 15. AVERAGE ENERGY FOR ALL COMPLETE DAYS

SELECT
    ROUND(AVG(Daily_Energy_kWh), 2) AS Average_Daily_Energy_kWh
FROM complete_daily_usage;


-- 16. COUNT COMPLETE DAYS

SELECT
    COUNT(*) AS Total_Complete_Days
FROM complete_daily_usage;


-- 17. ROUND AVERAGE POWER BY MONTH
-- Demonstrate AVG() and ROUND() on the imported monthly summary.

SELECT
    MonthName,
    ROUND(Average_Power_kW, 2) AS Rounded_Average_Power_kW
FROM monthly_usage
ORDER BY Month;


-- 18. OVERALL PROJECT SUMMARY
-- Show the average power and highest hourly average.

SELECT
    ROUND(AVG(Average_Power_kW), 3) AS Mean_Of_Hourly_Averages_kW,
    MAX(Average_Power_kW) AS Highest_Hourly_Average_kW,
    MIN(Average_Power_kW) AS Lowest_Hourly_Average_kW
FROM hourly_usage;


-- END OF SQL ANALYSIS
