CREATE DATABASE kpmg_financials;

USE kpmg_financials;

CREATE TABLE financials_cleaned (
    Client_ID INT,
    Client_Industry VARCHAR(50),
    Region VARCHAR(50),
    Month DATE,
    Revenue_ZAR DECIMAL(15,2),
    Operating_Cost_ZAR DECIMAL(15,2),
    Transactions INT,
    Source_System VARCHAR(50)
);

-- Check for NULLs

SELECT
  COUNT(*) AS total_rows,
  SUM(Revenue_ZAR IS NULL) AS null_revenue,
  SUM(Operating_Cost_ZAR IS NULL) AS null_cost,
  SUM(Transactions IS NULL) AS null_transactions
FROM kpmg_cleaned_financials;

-- Validate Value Ranges
SELECT
  MIN(Revenue_ZAR) AS min_revenue,
  MAX(Revenue_ZAR) AS max_revenue,
  MIN(Operating_Cost_ZAR) AS min_cost,
  MAX(Operating_Cost_ZAR) AS max_cost
FROM kpmg_cleaned_financials;


-- CREATE BUSINESS METRICS
-- PROFIT
SELECT
  *,
  (Revenue_ZAR - Operating_Cost_ZAR) AS Profit_ZAR
FROM kpmg_cleaned_financials
LIMIT 10;

-- Profit Margin (%)
SELECT
  Client_ID,
  Client_Industry,
  Revenue_ZAR,
  Operating_Cost_ZAR,
  (Revenue_ZAR - Operating_Cost_ZAR) AS Profit_ZAR,
  ROUND(
    (Revenue_ZAR - Operating_Cost_ZAR) / Revenue_ZAR * 100,
    2
  ) AS Profit_Margin_Pct
FROM kpmg_cleaned_financials
LIMIT 10;

-- Industry Summary

SELECT
  Client_Industry,
  COUNT(*) AS Records,
  ROUND(SUM(Revenue_ZAR), 2) AS Total_Revenue,
  ROUND(SUM(Operating_Cost_ZAR), 2) AS Total_Cost,
  ROUND(SUM(Revenue_ZAR - Operating_Cost_ZAR), 2) AS Total_Profit
FROM kpmg_cleaned_financials
GROUP BY Client_Industry
ORDER BY Total_Profit DESC;

-- REGIONAL ANALYSIS
SELECT
  Region,
  COUNT(*) AS Clients,
  ROUND(AVG(Revenue_ZAR), 2) AS Avg_Revenue,
  ROUND(AVG(Operating_Cost_ZAR), 2) AS Avg_Cost
FROM kpmg_cleaned_financials
GROUP BY Region
ORDER BY Avg_Revenue DESC;


-- FIRST VIEW (Core Analytics View)

-- Profit_ZAR = Revenue_ZAR - Operating_Cost_ZAR
ALTER TABLE kpmg_cleaned_financials
ADD COLUMN Profit_ZAR DECIMAL(15,2);

UPDATE kpmg_cleaned_financials
SET Profit_ZAR = Revenue_ZAR - Operating_Cost_ZAR;


CREATE VIEW vw_financials_core AS
SELECT
    Client_ID,
    Client_Industry,
    Region,
    Month,
    Revenue_ZAR,
    Operating_Cost_ZAR,
    Profit_ZAR,
    Transactions,
    ROUND(Revenue_ZAR / NULLIF(Transactions, 0), 2) AS Revenue_per_Transaction
FROM kpmg_cleaned_financials;

-- Industry Performance View

CREATE VIEW vw_industry_performance AS
SELECT
    Client_Industry,
    SUM(Revenue_ZAR) AS Total_Revenue,
    SUM(Operating_Cost_ZAR) AS Total_Cost,
    SUM(Profit_ZAR) AS Total_Profit,
    ROUND(SUM(Profit_ZAR) / NULLIF(SUM(Revenue_ZAR), 0) * 100, 2) AS Profit_Margin_Percent
FROM kpmg_cleaned_financials
GROUP BY Client_Industry;


-- Regional Performance View

CREATE VIEW vw_region_performance AS
SELECT
    Region,
    SUM(Revenue_ZAR) AS Total_Revenue,
    SUM(Profit_ZAR) AS Total_Profit,
    COUNT(DISTINCT Client_ID) AS Number_of_Clients
FROM kpmg_cleaned_financials
GROUP BY Region;

-- Monthly Trends View

CREATE VIEW vw_monthly_trends AS
SELECT
    Month,
    SUM(Revenue_ZAR) AS Monthly_Revenue,
    SUM(Profit_ZAR) AS Monthly_Profit
FROM kpmg_cleaned_financials
GROUP BY Month
ORDER BY Month;

-- Loss-Making Clients

CREATE VIEW vw_loss_making_clients AS
SELECT
    Client_ID,
    Client_Industry,
    Region,
    Revenue_ZAR,
    Operating_Cost_ZAR,
    Profit_ZAR
FROM kpmg_cleaned_financials
WHERE Profit_ZAR < 0;



