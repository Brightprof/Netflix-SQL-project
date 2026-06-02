-- ===============================
-- 01. DATA CLEANING
-- Netflix SQL Project
-- ===============================

-- Use database
USE Netflix;
GO

-- ===============================
-- STEP 1: Inspect staging data
-- ===============================
SELECT * 
FROM Netflix_staging;

-- ===============================
-- STEP 2: Remove leading/trailing spaces
-- (Handled during analysis using TRIM functions, but documented here)
-- ===============================
-- Example cleaning logic:
-- LTRIM(RTRIM(column_name))

-- ===============================
-- STEP 3: Standardize missing values
-- ===============================

-- Replace NULL directors with 'Unknown'
UPDATE Netflix_staging
SET director = 'Unknown'
WHERE director IS NULL;

-- Replace NULL country with 'Unknown'
UPDATE Netflix_staging
SET country = 'Unknown'
WHERE country IS NULL;

-- Replace NULL casts with 'Unknown'
UPDATE Netflix_staging
SET casts = 'Unknown'
WHERE casts IS NULL;

-- ===============================
-- STEP 4: Validate data consistency
-- ===============================

SELECT DISTINCT type FROM Netflix_staging;
SELECT DISTINCT rating FROM Netflix_staging;
