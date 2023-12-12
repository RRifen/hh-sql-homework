-- Написать запрос для получения месяца с наибольшим количеством вакансий и месяца с наибольшим количеством резюме

-- Запрос месяца с наибольшим количеством вакансий
WITH months_count AS (SELECT count(creation_timestamp)                 AS vacancy_count,
                             to_char(creation_timestamp, 'Month YYYY') AS month_year
                      FROM vacancy
                      GROUP BY month_year)
SELECT month_year
FROM months_count
WHERE vacancy_count = (SELECT max(vacancy_count) FROM months_count);

-- Запрос месяца с наибольшим количеством резюме
WITH months_count AS (SELECT count(creation_timestamp)                 AS resume_count,
                             to_char(creation_timestamp, 'Month YYYY') AS month_year
                      FROM resume
                      GROUP BY month_year)
SELECT month_year
FROM months_count
WHERE resume_count = (SELECT max(resume_count) FROM months_count);
