# Besar's Portfolio

# [Project 1: Data Cleaning in SQL](https://github.com/besarmax/Besar-s_Portfolio/blob/bfafd8413ecfa260fd0415f8724cddd8c5de719a/Portfolio%20Project%20-%20Data%20Cleaning%20in%20SQL.sql)

In this project, I cleaned a layoffs dataset using the following steps:
 
*Created a Staging Table: I created a staging table (layoffs_staging) as a backup of the raw data for safe processing.
*Removed Duplicates: I identified and removed duplicate entries based on key fields like company, industry, and date, ensuring only unique records remained.
*Standardized Data: I handled issues such as empty strings, inconsistencies in the industry column (e.g., standardizing "Crypto" variants), and fixed formatting in the country and date columns to ensure uniformity.
*Dealt with Missing Data: I left NULL values in certain columns (like layoffs data) for easier future analysis and deleted rows with missing critical information.
*Dropped Unnecessary Columns: After cleaning, I removed the temporary row_num column used for detecting duplicates, leaving a clean dataset.
 
This process ensured the data was accurate, consistent, and ready for analysis.


