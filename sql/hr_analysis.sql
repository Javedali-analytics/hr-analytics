
-- ============================================================
-- HR Analytics — Employee Attrition Analysis
-- SQL Analysis Queries
-- Dataset: IBM HR Analytics Employee Attrition
-- Table: hr_data
-- ============================================================


-- ============================================================
-- Query 01: Overall Employee Attrition
-- ============================================================

SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Attrition;


-- ============================================================
-- Query 02: Department-wise Attrition Rate
-- ============================================================

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 03: Job Role-wise Attrition Rate
-- ============================================================

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 04: Overtime-wise Attrition Rate
-- ============================================================

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 05: Income Band-wise Attrition Rate
-- ============================================================

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome < 6000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Income_Band
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 06: Age Band-wise Attrition Rate
-- ============================================================

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Age_Band
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 07: Business Travel-wise Attrition Rate
-- ============================================================

SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 08: Job Satisfaction-wise Attrition Rate
-- ============================================================

SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- ============================================================
-- Query 09: Work-Life Balance-wise Attrition Rate
-- ============================================================

SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


-- ============================================================
-- Query 10: Tenure Band-wise Attrition Rate
-- ============================================================

SELECT
    CASE
        WHEN YearsAtCompany <= 1 THEN '0-1 Years'
        WHEN YearsAtCompany BETWEEN 2 AND 3 THEN '2-3 Years'
        WHEN YearsAtCompany BETWEEN 4 AND 5 THEN '4-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS Tenure_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Tenure_Band
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 11: Education Field-wise Attrition Rate
-- ============================================================

SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY EducationField
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 12: Gender-wise Attrition Rate
-- ============================================================

SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Gender
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 13: Environment Satisfaction-wise Attrition Rate
-- ============================================================

SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;


-- ============================================================
-- Query 14: Job Involvement-wise Attrition Rate
-- ============================================================

SELECT
    JobInvolvement,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobInvolvement
ORDER BY JobInvolvement;


-- ============================================================
-- Query 15: Marital Status-wise Attrition Rate
-- ============================================================

SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 16: Distance From Home-wise Attrition Rate
-- ============================================================

SELECT
    DistanceFromHome,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY DistanceFromHome
ORDER BY Attrition_Rate DESC;


-- ============================================================
-- Query 17: Years Since Last Promotion-wise Attrition Rate
-- ============================================================

SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;


-- ============================================================
-- Query 18: Years With Current Manager-wise Attrition Rate
-- ============================================================

SELECT
    YearsWithCurrManager,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsWithCurrManager
ORDER BY YearsWithCurrManager;


-- ============================================================
-- Query 19: Years In Current Role-wise Attrition Rate
-- ============================================================

SELECT
    YearsInCurrentRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsInCurrentRole
ORDER BY YearsInCurrentRole;


-- ============================================================
-- Query 20: Education-wise Attrition Rate
-- ============================================================

SELECT
    Education,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Education
ORDER BY Education;
