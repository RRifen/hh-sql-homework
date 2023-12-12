-- Написать запрос для получения id и title вакансий,
-- которые собрали больше 5 откликов в первую неделю после публикации

SELECT vacancy_id, vacancy_title
FROM vacancy
INNER JOIN response USING (vacancy_id)
WHERE vacancy.creation_timestamp + '1 week'::interval > response.creation_timestamp
GROUP BY vacancy_id, vacancy_title
HAVING count(*) > 5;
