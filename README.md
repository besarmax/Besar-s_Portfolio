# Besar's Portfolio

# [Project 1: Data Cleaning in SQL](https://github.com/besarmax/Besar-s_Portfolio/blob/bfafd8413ecfa260fd0415f8724cddd8c5de719a/Portfolio%20Project%20-%20Data%20Cleaning%20in%20SQL.sql)

In this project, I cleaned a layoffs dataset using the following steps:
 
* Created a Staging Table: I created a staging table (layoffs_staging) as a backup of the raw data for safe processing.
* Removed Duplicates: I identified and removed duplicate entries based on key fields like company, industry, and date, ensuring only unique records remained.
* Standardized Data: I handled issues such as empty strings, inconsistencies in the industry column (e.g., standardizing "Crypto" variants), and fixed formatting in the country and date columns to ensure uniformity.
* Dealt with Missing Data: I left NULL values in certain columns (like layoffs data) for easier future analysis and deleted rows with missing critical information.
* Dropped Unnecessary Columns: After cleaning, I removed the temporary row_num column used for detecting duplicates, leaving a clean dataset.
 
This process ensured the data was accurate, consistent, and ready for analysis.


# [Project 2: Exploratory Data Analysis in SQL](https://github.com/besarmax/Besar-s_Portfolio/blob/88b75cd35b5c267a7754ba1b6c16b0ced6316c2c/Portfolio%20Project%20-%20Exploratory%20Data%20Analysis.sql)

In this project, I analyzed global tech layoffs using SQL to uncover trends, outliers, and company-specific insights.

* Conducted EDA on layoff data to explore patterns by company, country, industry, and year.
* Identified companies with 100% layoffs and compared them by funding raised.
* Used GROUP BY, aggregate functions, and filtering to extract key metrics.
* Applied CTEs and window functions to rank top companies by layoffs per year.
* Created rolling monthly totals to visualize layoff trends over time.


