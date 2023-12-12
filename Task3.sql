-- Написать запрос для получения средних значений по регионам (area_id) следующих величин:
-- compensation_from, compensation_to, среднее_арифметическое_from_и_to

WITH compensation_data(area_id, compensation_from, compensation_to) AS (
    SELECT area_id,
        CASE
            WHEN compensation_gross IS TRUE
                THEN compensation_from * 0.87
            ELSE compensation_from
            END AS compensation_from,
        CASE
            WHEN compensation_gross IS TRUE
                THEN compensation_to * 0.87
            ELSE compensation_to
            END AS compensation_to
    FROM vacancy
)
SELECT area_id,
       avg(compensation_from)                         AS avg_compensation_from,
       avg(compensation_to)                           AS avg_compensation_to,
       avg((compensation_from + compensation_to) / 2) AS avg_compensation_from_to
FROM compensation_data
GROUP BY area_id
ORDER BY area_id;
