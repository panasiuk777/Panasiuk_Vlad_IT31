
-- Практична робота 11
-- Варіант 3. Кінотеатр
-- Зв'язок багато-до-багатьох між movies та viewers

PRAGMA foreign_keys = ON;

-- Завдання 1. Створення таблиць

CREATE TABLE viewers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE movie_watchlist (
    id INTEGER PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    viewer_id INTEGER NOT NULL REFERENCES viewers(id),
    planned_date TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'planned'
        CHECK (status IN ('planned', 'watched')),
    note TEXT,
    UNIQUE(movie_id, viewer_id)
);

INSERT INTO viewers (id, name, email) VALUES
(1, 'Андрій', 'andrii@gmail.com'),
(2, 'Олег', 'oleh@gmail.com'),
(3, 'Марія', 'maria@gmail.com'),
(4, 'Ірина', 'iryna@gmail.com');

INSERT INTO movie_watchlist
(movie_id, viewer_id, planned_date, status, note) VALUES
(1, 1, '2026-09-10', 'planned', 'На вихідних'),
(2, 1, '2025-12-10', 'planned', 'Цікавий фільм'),
(4, 1, '2026-10-01', 'planned', 'Новинка'),
(1, 2, '2026-02-10', 'planned', 'Рекомендація друзів'),
(2, 2, '2026-03-10', 'planned', 'Перегляд удома'),
(1, 3, '2025-11-10', 'planned', 'Класика'),
(3, 3, '2026-04-10', 'planned', 'Мультфільм'),
(4, 3, '2026-05-10', 'planned', 'Прем’єра'),
(2, 4, '2026-06-10', 'planned', 'На вечір');

-- Завдання 2. Групування за фільмами

SELECT
    movies.id,
    movies.title,
    COUNT(movie_watchlist.id) AS viewers_count
FROM movies
JOIN movie_watchlist
    ON movies.id = movie_watchlist.movie_id
JOIN viewers
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY movies.id, movies.title
ORDER BY viewers_count DESC;

-- Групування за глядачами

SELECT
    viewers.id,
    viewers.name,
    COUNT(movie_watchlist.id) AS movies_count
FROM viewers
JOIN movie_watchlist
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY viewers.id, viewers.name
ORDER BY viewers.id;

-- Завдання 3. Використання HAVING

SELECT
    movies.id,
    movies.title,
    COUNT(movie_watchlist.id) AS viewers_count
FROM movies
JOIN movie_watchlist
    ON movies.id = movie_watchlist.movie_id
JOIN viewers
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY movies.id, movies.title
HAVING COUNT(movie_watchlist.id) >= 2
ORDER BY viewers_count DESC;

-- Завдання 4. WHERE + JOIN + GROUP BY + HAVING

SELECT
    movies.id,
    movies.title,
    COUNT(movie_watchlist.id) AS viewers_count
FROM movies
JOIN movie_watchlist
    ON movies.id = movie_watchlist.movie_id
JOIN viewers
    ON viewers.id = movie_watchlist.viewer_id
WHERE movie_watchlist.status = 'planned'
  AND movie_watchlist.planned_date >= '2026-01-01'
GROUP BY movies.id, movies.title
HAVING COUNT(movie_watchlist.id) >= 2
ORDER BY viewers_count DESC;

-- Завдання 5. Додавання глядача з повторним ім'ям

INSERT INTO viewers (name, email)
VALUES ('Андрій', 'andrii2@gmail.com');

INSERT INTO movie_watchlist
(movie_id, viewer_id, planned_date, status, note)
VALUES
(3, 5, '2026-10-15', 'planned', 'Дубль імені для перевірки');

-- Групування за ID глядача

SELECT
    viewers.id,
    viewers.name,
    COUNT(movie_watchlist.id) AS movies_count
FROM viewers
JOIN movie_watchlist
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY viewers.id, viewers.name
ORDER BY viewers.id;

-- Групування за іменем глядача

SELECT
    viewers.name,
    COUNT(movie_watchlist.id) AS movies_count
FROM viewers
JOIN movie_watchlist
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY viewers.name
ORDER BY viewers.name;

-- Експеримент із LEFT JOIN

SELECT
    movies.id,
    movies.title,
    COUNT(movie_watchlist.id) AS viewers_count
FROM movies
LEFT JOIN movie_watchlist
    ON movies.id = movie_watchlist.movie_id
    AND movie_watchlist.status = 'planned'
    AND movie_watchlist.planned_date >= '2026-01-01'
LEFT JOIN viewers
    ON viewers.id = movie_watchlist.viewer_id
GROUP BY movies.id, movies.title
HAVING COUNT(movie_watchlist.id) >= 2
ORDER BY viewers_count DESC;
