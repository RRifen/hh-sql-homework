-- Спроектировать базу данных hh (основные таблицы: вакансии, резюме, отклики, специализации).
-- По необходимым столбцам ориентироваться на сайт hh.ru

CREATE TABLE area
(
    area_id   SERIAL PRIMARY KEY,
    area_name VARCHAR(100) NOT NULL
);

CREATE TABLE employer
(
    employer_id    SERIAL PRIMARY KEY,
    employer_name  VARCHAR(100) NOT NULL,
    employer_email VARCHAR(100) NOT NULL UNIQUE,
    area_id        INTEGER REFERENCES area (area_id)
);

CREATE TABLE applicant
(
    applicant_id    SERIAL PRIMARY KEY,
    applicant_name  VARCHAR(100) NOT NULL,
    applicant_email VARCHAR(100) NOT NULL UNIQUE,
    area_id         INTEGER REFERENCES area (area_id)
);

CREATE TABLE specialization
(
    specialization_id   SERIAL PRIMARY KEY,
    specialization_name VARCHAR(100) NOT NULL
);

CREATE TABLE vacancy
(
    vacancy_id          SERIAL PRIMARY KEY,
    vacancy_title       VARCHAR(100) NOT NULL,
    vacancy_description TEXT         NOT NULL,
    compensation_from   INTEGER      NOT NULL,
    compensation_to     INTEGER      NOT NULL,
    compensation_gross  BOOLEAN      NOT NULL,
    creation_timestamp  TIMESTAMP    NOT NULL DEFAULT NOW(),
    area_id             INTEGER REFERENCES area (area_id),
    specialization_id   INTEGER REFERENCES specialization (specialization_id),
    employer_id         INTEGER REFERENCES employer (employer_id)
);

CREATE TABLE resume
(
    resume_id          SERIAL PRIMARY KEY,
    resume_description TEXT      NOT NULL,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    area_id            INTEGER REFERENCES area (area_id),
    specialization_id  INTEGER REFERENCES specialization (specialization_id),
    applicant_id       INTEGER REFERENCES applicant (applicant_id)
);

CREATE TABLE response
(
    response_id        SERIAL PRIMARY KEY,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    vacancy_id         INTEGER REFERENCES vacancy (vacancy_id),
    resume_id          INTEGER REFERENCES resume (resume_id)
);
