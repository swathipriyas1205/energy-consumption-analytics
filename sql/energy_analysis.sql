-- 1. Average household power by hour
SELECT
    Hour,
    AVG(Average_Power_kW) AS average_power_kw
FROM hourly_usage
GROUP BY Hour
ORDER BY Hour;

-- 2. Monthly average household power
SELECT
    Month,
    MonthName,
    Average_Power_kW
FROM monthly_usage
ORDER BY Month;

-- 3. Compare weekday and weekend power
SELECT
    DayType,
    Average_Power_kW
FROM weekend_comparison
ORDER BY Average_Power_kW DESC;

-- 4. Rank the highest-consumption days
SELECT
    Date,
    Daily_Energy_kWh
FROM complete_daily_usage
ORDER BY Daily_Energy_kWh DESC
LIMIT 10;

-- 5. Compare average power by year
SELECT
    Year,
    Average_Power_kW
FROM yearly_usage
ORDER BY Year;
