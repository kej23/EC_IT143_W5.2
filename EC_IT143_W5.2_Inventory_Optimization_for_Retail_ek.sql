/*****************************************************************************************************************
NAME:    Inventory Optimization for Retail
PURPOSE: My Communities Analysis- Create Answers.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/10/2025   ELVIS KIRUNDA       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This script offers solutions to the questions that were presented in the previous assignment. It covers the Inventory Optimization for Retail dataset.
 The tables related to this dataset are; demand_forecasting and pricing_optimization.

******************************************************************************************************************/

-- Q1: How do price elasticity and competitor pricing affect the success of promotions across different customer segments?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT                                       --Columns to be shown included
    d.[Product_ID],
    d.[Store_ID],
    d.[Promotions],
    d.[Customer_Segments],
    p.[Elasticity_Index],
    p.[Competitor_Prices],
    d.[Sales_Quantity]
FROM                                            --Specifies the primary table, and gives it the alias d
    demand_forecasting d
JOIN                                            --Combines rows from PricingOptimization using a common key.
    pricing_optimization p
    ON d.[Product_ID] = p.[Product_ID]          --Tells SQL how to match the rows—here, it's using both Product ID and Store ID.           
    AND d.[Store_ID] = p.[Store_ID]
WHERE                                           --Filters the results to include only the rows where a promotion was active (Yes)
    d.[Promotions] = '1';

	--Q2: What is the relationship between sales volume trends and discount strategies during seasonal events?

	SELECT                                    --Columns to be shown included
    d.[Product_ID],
    d.[Store_ID],
    d.[Promotions],
    d.[Customer_Segments],
    p.[Elasticity_Index],
    p.[Competitor_Prices],
    d.[Sales_Quantity]
FROM                                            --Specifies the primary table, and gives it the alias d
    demand_forecasting d
JOIN                                            --Combines rows from PricingOptimization using a common key.
    pricing_optimization p
    ON d.[Product_ID] = p.[Product_ID]        
    AND d.[Store_ID] = p.[Store_ID]
WHERE                                           --Filters only for records that have some seasonal factor listed
    d.[Seasonality_Factors] IS NOT NULL;

	--Q3: Which products with high storage costs and return rates also show increasing demand trends across locations?

	SELECT                                       --Columns to be shown included
    d.[Product_ID],
    d.[Store_ID],
    d.[Promotions],
    d.[Customer_Segments],
    p.[Elasticity_Index],
    p.[Competitor_Prices],
    d.[Sales_Quantity]
FROM                                             --Specifies the primary table, and gives it the alias d
    demand_forecasting d
JOIN                                             --Combines rows from PricingOptimization using a common key.
    pricing_optimization p
    ON d.[Product_ID] = p.[Product_ID]
    AND d.[Store_ID] = p.[Store_ID]
WHERE                                            --Filters products with increasing demand,storage cost greater than 8.0 (assumed to be high),return rate higher than 10%.
    d.[Demand_Trend] = 'Increasing'
    AND p.[Storage_Cost] > 8.0                    -- Adjust threshold as needed
    AND p.[Return_Rate] > 10.0;

	--Q4 How do promotions and customer sentiment (reviews) interact to influence return rates?

	SELECT                                   --Columns to be shown included
    d.[Product_ID],
    d.[Store_ID],
    d.[Promotions],
    d.[Customer_Segments],
    p.[Elasticity_Index],
    p.[Competitor_Prices],
    d.[Sales_Quantity]
FROM                                          --Specifies the primary table, and gives it the alias d
    demand_forecasting d
JOIN                                           --Combines rows from PricingOptimization using a common key.
    pricing_optimization p
    ON d.[Product_ID] = p.[Product_ID]
    AND d.[Store_ID] = p.[Store_ID]
WHERE 
    d.[Promotions] = '1';
