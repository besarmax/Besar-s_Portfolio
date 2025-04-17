-- EXPLORATORY DATA ANALYSIS (EDA)

-- Begin by examining the data to identify trends, patterns, or noteworthy observations such as outliers.

-- I'm conducting a general exploration to uncover any insights within the dataset.

SELECT * 
FROM world_layoffs.layoffs_staging2;

-- SIMPLE AGGREGATE QUERIES

SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;

-- Examining the range of layoff percentages to understand the severity of layoffs

SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;

-- Identifying companies that laid off 100% of their workforce

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1;

-- These are primarily startups that appear to have shut down during this time period

-- Sorting companies that laid off 100% of staff by the amount of funding they had raised

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Notable example: BritishVolt (an EV company) and Quibi, which raised ~$2 billion but ultimately failed


-- MODERATELY COMPLEX QUERIES USING GROUP BY ----------------------------------------------------------------------------------

-- Companies with the largest single-day layoffs

SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging
ORDER BY 2 DESC
LIMIT 5;
-- This represents layoffs that occurred on a single date

-- Companies with the highest total layoffs across all records

SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;

-- Breakdown of total layoffs by location

SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

-- This represents total layoffs over the dataset’s time span (approximately the past 3 years)

SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Yearly breakdown of total layoffs

SELECT YEAR(date), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 ASC;

-- Total layoffs by industry

SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Total layoffs by company stage

SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;



-- MORE ADVANCED QUERIES -------------------------------------------------------------------------------------------------------

-- Previously, we looked at total layoffs by company. Now, we’ll analyze the top companies by layoffs each year.

WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;



-- Monthly total of layoffs

SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;

-- Use the monthly total in a CTE to calculate the rolling total over time

WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;



















































