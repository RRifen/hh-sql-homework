-- Создать необходимые индексы (обосновать выбор столбцов)

-- Индекс, чтобы ускорить фильтрацию по названиям регионов
CREATE INDEX area_name_idx ON area (area_name);

-- Индекс, чтобы ускорить фильтрацию по названиям специализаций
CREATE INDEX specialization_name_idx ON specialization (specialization_name);

-- Индекс, чтобы ускорить фильтрацию по названиям работодателей
-- (На email, уже висит ограничение уникальности, а значит и индекс)
CREATE INDEX employer_name_idx ON employer (employer_name);

-- Индексы, чтобы ускорить фильтрацию по навзанию вакансии, по зарплате, а также по дате публикации вакансии
CREATE INDEX vacancy_title_idx ON vacancy (vacancy_title);
CREATE INDEX compensation_from_idx ON vacancy (compensation_from);
CREATE INDEX compensation_to_idx ON vacancy (compensation_to);
CREATE INDEX compensation_from_to_idx ON vacancy (compensation_from, compensation_to);
CREATE INDEX creation_timestamp_idx ON vacancy (creation_timestamp);

-- Индексы, чтобы фильтровать вакансии по специализациям и вакансиям
CREATE INDEX specialization_id_idx ON vacancy (specialization_id);
CREATE INDEX employer_id_idx ON vacancy (employer_id);

-- Индекс, чтобы ускорить фильтровать резюме по дате публикации
CREATE INDEX creation_timestamp_idx ON resume (creation_timestamp);

-- Индекс, чтобы ускорить фильтрацию резюме по специализации
CREATE INDEX specialization_id_idx ON resume (specialization_id);

-- Индекс, чтобы ускорить фильтрацию откликов по дате
CREATE INDEX creation_time_idx ON response(creation_timestamp);

-- Индекс, чтобы ускорить фильтрацию откликов по вакансии
CREATE INDEX vacancy_id_idx ON response(vacancy_id);
