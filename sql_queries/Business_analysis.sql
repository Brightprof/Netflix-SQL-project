-- ===============================
-- BUSINESS ANALYSIS
-- Netflix SQL Project
-- ===============================

USE Netflix;
GO

-- =========================================
-- 1. Movies vs TV Shows
-- =========================================
SELECT type, COUNT(*) AS total_count
FROM Netflix_table
GROUP BY type;

-- =========================================
-- 2. Find the most common rating for movies and TV shows
-- =========================================
SELECT *
FROM (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS rn
    FROM Netflix_table
    GROUP BY type, rating
) t
WHERE rn = 1;

-- =========================================
-- 3. Movies released in 2020
-- =========================================
SELECT *
FROM Netflix_table
WHERE release_year = 2020
AND type = 'Movie';

-- =========================================
-- 4. Top 5 countries with most content
-- =========================================
SELECT TOP 5
    LTRIM(RTRIM(c.value)) AS country,
    COUNT(*) AS total_content
FROM Netflix_table
CROSS APPLY STRING_SPLIT(country, ',') c
GROUP BY LTRIM(RTRIM(c.value))
ORDER BY total_content DESC;

-- =========================================
-- 5. Longest movie
-- =========================================
SELECT TOP 1
    title,
    release_year,
    CAST(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) AS duration_minutes
FROM Netflix_table
WHERE type = 'Movie'
ORDER BY duration_minutes DESC;

-- =========================================
-- 6. Content added in last 5 years
-- =========================================
SELECT *
FROM Netflix_table
WHERE DATEDIFF(YEAR, date_added, GETDATE()) <= 5;

-- =========================================
-- 7.Find all the movies/TV shows by director 'Bruno Garotti'
-- =========================================
SELECT show_id, title, LTRIM(RTRIM(d.value)) AS director
FROM Netflix_table
CROSS APPLY STRING_SPLIT(director, ',') d
WHERE LTRIM(RTRIM(d.value)) = 'Bruno Garotti';

-- =========================================
-- 8. TV shows with more than 5 seasons
-- =========================================
SELECT *
FROM Netflix_table
WHERE type = 'TV Show'
AND CAST(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) > 5;

-- ===================================================
-- 9. Count the number of content items in each genre
-- ===================================================
SELECT 
    LTRIM(RTRIM(g.value)) AS genre,
    COUNT(*) AS total_content
FROM Netflix_table
CROSS APPLY STRING_SPLIT(listed_in, ',') g
GROUP BY LTRIM(RTRIM(g.value));

-- ==========================================================================================
-- 10. Find each year and the average numbers of content release in United States on netflix.
-- ==========================================================================================
WITH US_content AS (
	SELECT 
		N.release_year,
		N.show_id
		FROM Netflix_table AS N 
		CROSS APPLY STRING_SPLIT(N.country, ',') AS C
	WHERE LTRIM(RTRIM(C.value)) = 'United States'
 )

 SELECT TOP 5 
	release_year,
	COUNT(show_id) AS total_content,
	AVG(COUNT(show_id) * 1.0) OVER() AS avg_content_per_year
 FROM US_content
 GROUP BY release_year
 ORDER BY total_content DESC;


-- ===========================================
-- 11. List all movies that are documentaries
-- ===========================================
SELECT show_id, title, country
FROM Netflix_table
CROSS APPLY STRING_SPLIT(listed_in, ',') g
WHERE LTRIM(RTRIM(g.value)) = 'Documentaries';

-- =========================================
-- 12. Find all content without director
-- =========================================
SELECT *
FROM Netflix_table
WHERE director = 'Unknown';

-- =========================================
-- 13. Find how many movies actor 'Toyin Abraham appeared in last 10 years!
-- =========================================
SELECT COUNT(*) AS no_of_appearance
FROM Netflix_table
CROSS APPLY STRING_SPLIT(casts, ',') c
WHERE LTRIM(RTRIM(c.value)) = 'Toyin Abraham'
AND release_year >= YEAR(GETDATE()) - 10;

-- ===================================================================================================
-- 14. . Find the top 10 actors who have appeared in the highest number of movies produced in Nigeria.
-- ===================================================================================================
SELECT TOP 10
    LTRIM(RTRIM(a.value)) AS actor,
    COUNT(*) AS total_movies
FROM Netflix_table n
CROSS APPLY STRING_SPLIT(n.casts, ',') a
CROSS APPLY STRING_SPLIT(n.country, ',') c
WHERE n.type = 'Movie'
AND LTRIM(RTRIM(c.value)) = 'Nigeria'
GROUP BY LTRIM(RTRIM(a.value))
ORDER BY total_movies DESC;

-- =======================================================================================
/*  15. Categorize the content based on the presence of the keywords 'kill' and 'violence 
in the description field. Label content containing these keywords as 'Bad' 
and all other content as 'Good". Count how many items fall into each category. */
-- =======================================================================================
SELECT  
    CASE
        WHEN LOWER(description) LIKE '%kill%' 
          OR LOWER(description) LIKE '%violence%'
        THEN 'Bad'
        ELSE 'Good'
    END AS content_category,
    COUNT(*) AS total_count
FROM Netflix_table
GROUP BY 
    CASE
        WHEN LOWER(description) LIKE '%kill%' 
          OR LOWER(description) LIKE '%violence%'
        THEN 'Bad'
        ELSE 'Good'
    END;