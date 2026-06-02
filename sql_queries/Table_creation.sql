-- ===============================
-- 02. TABLE CREATION
-- Netflix SQL Project
-- ===============================

-- Create Database
CREATE DATABASE Netflix;
GO

USE Netflix;
GO

-- ===============================
-- STEP 1: Create Staging Table
-- ===============================

DROP TABLE IF EXISTS Netflix_staging;

CREATE TABLE Netflix_staging (
    show_id VARCHAR(20),
    type VARCHAR(50),
    title VARCHAR(300),
    director VARCHAR(300),
    casts VARCHAR(MAX),
    country VARCHAR(300),
    date_added DATE,
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(100),
    listed_in VARCHAR(300),
    description VARCHAR(MAX)
);

-- ===============================
-- STEP 2: Load data into staging
-- ===============================

BULK INSERT Netflix_staging
FROM 'C:\Users\topea\Desktop\SQL Portfolio\Netflix project\netflix_titles.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    TABLOCK
);

-- ===============================
-- STEP 3: Create Production Table
-- ===============================

DROP TABLE IF EXISTS Netflix_table;

CREATE TABLE Netflix_table (
    show_id VARCHAR(20),
    type VARCHAR(50),
    title VARCHAR(300),
    director VARCHAR(300),
    casts VARCHAR(MAX),
    country VARCHAR(300),
    date_added DATE,
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(100),
    listed_in VARCHAR(300),
    description VARCHAR(MAX)
);

-- ===============================
-- STEP 4: Move data to production table
-- ===============================

INSERT INTO Netflix_table
SELECT *
FROM Netflix_staging;