-- ================================================================
-- BANK CUSTOMER CHURN ANALYSIS
-- Tool     : MySQL
-- Dataset  : Bank Customer Churn Prediction
-- Author   : Prateek Sharma
-- GitHub   : https://github.com/Beleiver7
-- ================================================================

-- ----------------------------------------------------------------
-- SETUP
-- ----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS bank_churn_db;
USE bank_churn_db;

-- Preview the dataset
SELECT * FROM bankcustomer LIMIT 10;

-- Total records in dataset
SELECT COUNT(*) AS total_customers FROM bankcustomer;

-- ================================================================
-- KPI 1: OVERALL CHURN RATE
-- ================================================================
-- Goal: Find what percentage of customers have left the bank
-- Formula: Churned Customers / Total Customers x 100
-- ----------------------------------------------------------------

SELECT 
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    COUNT(*) - SUM(churn)               AS retained_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer;

-- INSIGHT: ~20.37% churn rate
-- 1 out of every 5 customers is leaving the bank!

-- ================================================================
-- ANALYSIS 1: CHURN BY GENDER
-- ================================================================
-- Goal: Does gender influence a customer's decision to leave?
-- ----------------------------------------------------------------

SELECT 
    gender,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY gender
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Female churn rate (25.07%) is higher than Male (16.46%)
-- Female customers are significantly more likely to leave the bank!

-- ================================================================
-- ANALYSIS 2: CHURN BY COUNTRY (GEOGRAPHY)
-- ================================================================
-- Goal: Does the customer's country affect churn behavior?
-- ----------------------------------------------------------------

SELECT 
    country,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY country
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Germany (32.44%) has DOUBLE the churn rate of 
-- France (16.15%) and Spain (16.67%)!
-- Immediate attention needed for German market!

-- ================================================================
-- ANALYSIS 3: CHURN BY COUNTRY AND GENDER
-- ================================================================
-- Goal: Which country-gender combination has highest churn risk?
-- ----------------------------------------------------------------

SELECT 
    country,
    gender,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY country, gender
ORDER BY churn_rate_percent DESC;

-- INSIGHT: German Female customers (37.55%) are the 
-- HIGHEST RISK demographic in the entire dataset!

-- ================================================================
-- ANALYSIS 4: CHURNED VS RETAINED CUSTOMER PROFILE
-- ================================================================
-- Goal: What does the average churned vs retained customer look like?
-- ----------------------------------------------------------------

SELECT 
    CASE WHEN churn = 1 THEN 'Churned' ELSE 'Retained' END  AS customer_status,
    COUNT(*)                            AS total_customers,
    ROUND(AVG(balance), 2)              AS avg_balance,
    ROUND(AVG(credit_score), 2)         AS avg_credit_score,
    ROUND(AVG(age), 2)                  AS avg_age,
    ROUND(AVG(tenure), 2)               AS avg_tenure,
    ROUND(AVG(estimated_salary), 2)     AS avg_salary
FROM bankcustomer
GROUP BY churn
ORDER BY churn DESC;

-- INSIGHT: 
-- Churned customers have HIGHER average balance ($91,108 vs $72,745)
-- Churned customers are OLDER (44.84 vs 37.41 years)
-- Credit score is almost SAME — not a churn factor!

-- ================================================================
-- ANALYSIS 5: CHURN BY ACTIVE MEMBERSHIP
-- ================================================================
-- Goal: Do active customers churn less than inactive ones?
-- ----------------------------------------------------------------

SELECT 
    CASE WHEN active_member = 1 THEN 'Active' ELSE 'Inactive' END AS membership_status,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY active_member
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Inactive members churn at 26.85% vs Active at 14.27%
-- Inactive customers are TWICE as likely to leave the bank!

-- ================================================================
-- ANALYSIS 6: CHURN BY NUMBER OF PRODUCTS
-- ================================================================
-- Goal: Does using more bank products make customers more loyal?
-- ----------------------------------------------------------------

SELECT 
    products_number,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY products_number
ORDER BY products_number;

-- INSIGHT: 
-- 2 products = LOWEST churn (7.58%) — sweet spot!
-- 3 products = 82.71% churn (very high!)
-- 4 products = 100% churn (ALL customers left!)

-- ================================================================
-- ANALYSIS 7: CHURN BY AGE GROUP
-- ================================================================
-- Goal: Which age group is most likely to leave the bank?
-- ----------------------------------------------------------------

SELECT 
    CASE 
        WHEN age <= 30 THEN '18-30'
        WHEN age <= 40 THEN '31-40'
        WHEN age <= 50 THEN '41-50'
        WHEN age <= 60 THEN '51-60'
        ELSE '60+'
    END                                 AS age_group,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY age_group
ORDER BY churn_rate_percent DESC;

-- INSIGHT: 51-60 age group has highest churn (56.21%)
-- Churn increases significantly with age!

-- ================================================================
-- ANALYSIS 8: CHURN BY AGE GROUP AND ACTIVE MEMBERSHIP
-- ================================================================
-- Goal: Find the HIGHEST RISK customer segment
-- ----------------------------------------------------------------

SELECT 
    CASE 
        WHEN age <= 30 THEN '18-30'
        WHEN age <= 40 THEN '31-40'
        WHEN age <= 50 THEN '41-50'
        WHEN age <= 60 THEN '51-60'
        ELSE '60+'
    END                                 AS age_group,
    CASE WHEN active_member = 1 THEN 'Active' ELSE 'Inactive' END AS membership_status,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY age_group, active_member
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Inactive customers aged 51-60 = 85.71% churn rate!
-- THIS IS THE HIGHEST RISK SEGMENT IN THE ENTIRE DATASET!

-- ================================================================
-- ANALYSIS 9: CHURN BY BALANCE RANGE
-- ================================================================
-- Goal: Does account balance influence churn behavior?
-- ----------------------------------------------------------------

SELECT 
    CASE 
        WHEN balance = 0           THEN 'Zero Balance'
        WHEN balance < 50000       THEN 'Low (< 50K)'
        WHEN balance < 100000      THEN 'Medium (50K-100K)'
        WHEN balance < 150000      THEN 'High (100K-150K)'
        ELSE                            'Very High (150K+)'
    END                                 AS balance_range,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY balance_range
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Higher balance customers churn more!
-- Bank is losing its most VALUABLE customers!

-- ================================================================
-- ANALYSIS 10: CHURN BY CREDIT SCORE RANGE
-- ================================================================
-- Goal: Does credit score predict churn?
-- ----------------------------------------------------------------

SELECT 
    CASE 
        WHEN credit_score < 500    THEN 'Poor (< 500)'
        WHEN credit_score < 600    THEN 'Fair (500-599)'
        WHEN credit_score < 700    THEN 'Good (600-699)'
        WHEN credit_score < 800    THEN 'Very Good (700-799)'
        ELSE                            'Excellent (800+)'
    END                                 AS credit_score_range,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY credit_score_range
ORDER BY churn_rate_percent DESC;

-- INSIGHT: Credit score has minimal impact on churn
-- All ranges show similar churn rates (~20%)

-- ================================================================
-- SUMMARY: TOP HIGH RISK SEGMENTS
-- ================================================================

SELECT 
    country,
    gender,
    CASE 
        WHEN age <= 30 THEN '18-30'
        WHEN age <= 40 THEN '31-40'
        WHEN age <= 50 THEN '41-50'
        WHEN age <= 60 THEN '51-60'
        ELSE '60+'
    END                                 AS age_group,
    CASE WHEN active_member = 1 THEN 'Active' ELSE 'Inactive' END AS membership_status,
    COUNT(*)                            AS total_customers,
    SUM(churn)                          AS churned_customers,
    ROUND(AVG(churn) * 100, 2)          AS churn_rate_percent
FROM bankcustomer
GROUP BY country, gender, age_group, active_member
HAVING churn_rate_percent > 50
   AND total_customers > 10
ORDER BY churn_rate_percent DESC;

-- INSIGHT: This shows ALL segments with >50% churn rate
-- These are the PRIORITY segments for retention campaigns!

-- ================================================================
-- END OF ANALYSIS
-- Author   : Prateek Sharma
-- GitHub   : https://github.com/Beleiver7
-- ================================================================
