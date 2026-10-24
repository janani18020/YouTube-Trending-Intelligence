
-- YouTube Trending Intelligence
-- Project 4: YouTube Trending Video Analytics

-- 1. Count records in each country
SELECT 'USA' AS country, COUNT(*) AS total_records
FROM USA_Videos
UNION ALL
SELECT 'India', COUNT(*) FROM India_Videos
UNION ALL
SELECT 'Great Britain', COUNT(*) FROM GB_Videos;


-- 2. Top 10 categories by number of trending records in the USA
SELECT category_name, COUNT(*) AS total_records
FROM USA_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name
ORDER BY total_records DESC
LIMIT 10;


-- 3. Average views by category in the USA
SELECT category_name, ROUND(AVG(views), 0) AS average_views
FROM USA_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name
ORDER BY average_views DESC;


-- 4. Average engagement rate by category in the USA
SELECT category_name,
       ROUND(AVG(engagement_rate), 2) AS average_engagement_rate
FROM USA_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name
ORDER BY average_engagement_rate DESC;


-- 5. Top 10 unique videos by maximum views in the USA
SELECT video_id, title, channel_title, MAX(views) AS highest_views
FROM USA_Videos
GROUP BY video_id, title, channel_title
ORDER BY highest_views DESC
LIMIT 10;


-- 6. Average views by category across all three countries
SELECT 'USA' AS country, category_name, ROUND(AVG(views), 0) AS average_views
FROM USA_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name

UNION ALL

SELECT 'India', category_name, ROUND(AVG(views), 0)
FROM India_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name

UNION ALL

SELECT 'Great Britain', category_name, ROUND(AVG(views), 0)
FROM GB_Videos
WHERE category_name IS NOT NULL
GROUP BY category_name;


-- 7. Average engagement rate across all three countries
SELECT 'USA' AS country,
       ROUND(AVG(engagement_rate), 2) AS average_engagement_rate
FROM USA_Videos
UNION ALL
SELECT 'India', ROUND(AVG(engagement_rate), 2)
FROM India_Videos
UNION ALL
SELECT 'Great Britain', ROUND(AVG(engagement_rate), 2)
FROM GB_Videos;
