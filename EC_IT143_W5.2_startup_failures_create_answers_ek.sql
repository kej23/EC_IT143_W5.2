/*****************************************************************************************************************
NAME:        startup_failures
PURPOSE:     My Communities Analysis- Create Answers.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/10/2025   JJAUSSI       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This script offers solutions to the questions that were presented in the previous assignment. It covers the startup_failures dataset.
 The tables related to this dataset are; startup_failures and finance_insurance.

******************************************************************************************************************/

-- Q1: Which sectors have the longest-running startups before failing?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT sector, AVG(years_of_operation) AS avg_lifespan
FROM (
    SELECT startup_name, sector, years_of_operation FROM startup_failures
    UNION ALL                                                                      --Combines data from both tables
    SELECT startup_name, sector, years_of_operation FROM finance_insurance
) combined_data
GROUP BY sector                                                                     
ORDER BY avg_lifespan DESC;                                                        --They're organized by average lifespan starting with the highest.

-- Q2:   What is the average lifespan of startups in each sector before they fail? 
-- A2: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT sector, AVG(years_of_operation) AS avg_years_before_failure
FROM (
    SELECT sector, years_of_operation FROM startup_failures
    UNION ALL
    SELECT sector, years_of_operation FROM finance_insurance
) combined_data
GROUP BY sector
ORDER BY avg_years_before_failure DESC;

-- Q3:   Which sectors have the highest number of failed startups with over 10 years of operation? 
-- A3: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT sector, COUNT(startup_name) AS num_failed_long_term_startups
FROM (
    SELECT startup_name, sector, years_of_operation FROM startup_failures WHERE years_of_operation >= 10
    UNION ALL
    SELECT startup_name, sector, years_of_operation FROM finance_insurance WHERE years_of_operation >= 10
) combined_data
GROUP BY sector
ORDER BY num_failed_long_term_startups DESC;

-- Q4:  Which startup sectors tend to fail fastest (within five years of founding)?
-- A4: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT sector, COUNT(startup_name) AS num_failed_short_term_startups
FROM (
    SELECT startup_name, sector, years_of_operation FROM startup_failures WHERE years_of_operation <= 5
    UNION ALL
    SELECT startup_name, sector, years_of_operation FROM finance_insurance WHERE years_of_operation <= 5
) combined_data
GROUP BY sector
ORDER BY num_failed_short_term_startups DESC;

--SELECT GETDATE() AS my_date;