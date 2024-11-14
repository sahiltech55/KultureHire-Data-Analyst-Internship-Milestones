/*Question 1*/
select Gender, count(*)as Count
from cleaneddata
where Country = 'India'
group by Gender;

/*Question 2*/
SELECT
    ROUND(
        (SUM(CASE WHEN country = 'India' AND `Higher Education Aspiration` = 'Needs a sponsor' THEN 1 ELSE 0 END) * 1.0)
        / SUM(CASE WHEN country = 'India' AND `Higher Education Aspiration` IN ('Yes', 'Needs a sponsor') THEN 1 ELSE 0 END)
        * 100, 2
    ) AS percentage_needs_sponsorship_and_education_abroad
FROM cleaneddata;

/*Question 3*/
SELECT `Influencing Factors`, COUNT(*) AS influence_count
FROM cleaneddata
WHERE country = 'India'
GROUP BY `Influencing Factors`
ORDER BY influence_count DESC
LIMIT 6;

/*Question 4*/
SELECT 
    `Influencing Factors`, 
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS F,
    COUNT(CASE WHEN gender = 'M' THEN 1 END) AS M,
    COUNT(CASE WHEN gender = 'Other' THEN 1 END) AS `Other`
FROM cleaneddata
WHERE country = 'India'
GROUP BY `Influencing Factors`
ORDER BY `Influencing Factors`;

/*Question 5*/
SELECT
    ROUND(
        (COUNT(CASE WHEN `3 year tenurity` = 'Yes' THEN 1 END) * 1.0) 
        / COUNT(*) * 100, 2
    ) AS percentage_willing_to_stay_3_years
FROM cleaneddata;

/*Question 6*/
SELECT 
    COUNT(*) AS respondents_prefer_impactful_companies
FROM cleaneddata
WHERE `Work for a no-impact company?` BETWEEN 1 AND 5;

/*Question 7*/
SELECT 
    gender, 
    COUNT(CASE WHEN `Work for a no-impact company?` BETWEEN 1 AND 5 THEN 1 END) AS prefer_impactful
FROM cleaneddata
WHERE country = 'India'
GROUP BY gender
ORDER BY gender;

/*Question 8*/
SELECT 
    `Minimum salary for first 3 years?`, 
    COUNT(*) AS salary_count
FROM cleaneddata
WHERE `Minimum salary for first 3 years?` IS NOT NULL
GROUP BY `Minimum salary for first 3 years?`
ORDER BY `Minimum salary for first 3 years?`;

/*Question 9*/
SELECT 
    AVG(`Minimum starting salary expectation?`) AS expected_min_salary
FROM cleaneddata
WHERE `Minimum starting salary expectation?` IS NOT NULL;

/*Question 10*/
SELECT 
    ROUND(
        (COUNT(CASE WHEN `Ideal work environment` = 'Remote' THEN 1 END) * 1.0) 
        / COUNT(*) * 100, 2
    ) AS percentage_remote_working
FROM cleaneddata;

/*Question 11*/
SELECT 
    AVG(`How many hours would you work daily?`) AS preferred_daily_work_hours
FROM cleaneddata
WHERE `How many hours would you work daily?` IS NOT NULL;

/*Question 12*/
SELECT 
    `What frustrates you at work?`, 
    COUNT(*) AS frustration_count
FROM cleaneddata
WHERE `What frustrates you at work?` IS NOT NULL
GROUP BY `What frustrates you at work?`
ORDER BY frustration_count DESC;

/*Question 13*/
SELECT 
    gender,
    AVG(CASE 
        WHEN `How often a week off?` = 'Once in 12 months' THEN 1
        WHEN `How often a week off?` = 'Once in 6 months' THEN 2
        WHEN `How often a week off?` = 'Once in 3 months' THEN 3
        WHEN `How often a week off?` = 'Once in 2 months' THEN 4
        ELSE 0  -- If it's NULL or any other value
    END) AS average_weekly_time_off
FROM cleaneddata
WHERE `How often a week off?` IS NOT NULL
GROUP BY gender
ORDER BY gender;

/*Question 14*/
SELECT 
    COUNT(*) AS count_willing_to_work_under_abusive_manager
FROM cleaneddata
WHERE `Would you work for an abusive manager?` = 'Yes';

/*Question 15*/
SELECT 
    `Minimum salary after 5 years?`, 
    COUNT(*) AS salary_count
FROM cleaneddata
WHERE `Minimum salary after 5 years?` IS NOT NULL
GROUP BY `Minimum salary after 5 years?`
ORDER BY salary_count DESC;

/*Question 16*/
SELECT 
    gender,
    SUM(CASE WHEN `Work for a no-remote company?` = 1 THEN 1 ELSE 0 END) AS strongly_opposed,
    SUM(CASE WHEN `Work for a no-remote company?` = 3 THEN 1 ELSE 0 END) AS somewhat_opposed,
    SUM(CASE WHEN `Work for a no-remote company?` = 5 THEN 1 ELSE 0 END) AS neutral,
    SUM(CASE WHEN `Work for a no-remote company?` = 7 THEN 1 ELSE 0 END) AS somewhat_prefer_remote,
    SUM(CASE WHEN `Work for a no-remote company?` = 9 THEN 1 ELSE 0 END) AS strongly_prefer_remote,
    SUM(CASE WHEN `Work for a no-remote company?` = 10 THEN 1 ELSE 0 END) AS very_strongly_prefer_remote
FROM cleaneddata
WHERE `Work for a no-remote company?` IS NOT NULL
GROUP BY gender
ORDER BY gender;

/*Question 17*/
SELECT 
    `What frustrates you at work?`,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS F,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS M,
    SUM(CASE WHEN gender = 'Other' THEN 1 ELSE 0 END) AS Other
FROM cleaneddata
WHERE `What frustrates you at work?` IS NOT NULL
GROUP BY `What frustrates you at work?`
ORDER BY F DESC, M DESC, Other DESC;

/*Question 18*/
SELECT 
    `What boosts your work happiness and productivity?`, 
    COUNT(*) AS factor_count
FROM cleaneddata
WHERE `What boosts your work happiness and productivity?` IS NOT NULL
GROUP BY `What boosts your work happiness and productivity?`
ORDER BY factor_count DESC;

/*Question 19*/
SELECT 
    (COUNT(CASE WHEN `Higher Education Aspiration` = 'Needs a sponsor' THEN 1 END) / COUNT(*)) * 100 AS percentage_needing_sponsorship
FROM cleaneddata
WHERE `Higher Education Aspiration` IS NOT NULL;