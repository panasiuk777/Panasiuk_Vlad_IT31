-- ============================================================
-- Практика 8. Застосування агрегатних функцій
-- SQLite
-- ============================================================


-- ============================================================
-- Завдання 1. COUNT(*) та COUNT(column)
-- ============================================================

-- Початковий підрахунок кількості всіх фільмів
-- та кількості фільмів, для яких вказано рік.
SELECT
    COUNT(*) AS total_movies,
    COUNT(year) AS movies_with_year
FROM movies;


-- Навмисно встановлюємо NULL для одного року,
-- щоб продемонструвати різницю між COUNT(*) та COUNT(year).
UPDATE movies
SET year = NULL
WHERE id = 1;


-- Повторний підрахунок після встановлення NULL.
SELECT
    COUNT(*) AS total_movies,
    COUNT(year) AS movies_with_year
FROM movies;


-- ============================================================
-- Завдання 2. SUM() та AVG()
-- ============================================================

-- Загальна та середня ціна квитка.
SELECT
    SUM(ticket_price) AS total_ticket_revenue,
    AVG(ticket_price) AS average_ticket_price
FROM screenings;


-- ============================================================
-- Завдання 3. MIN() та MAX()
-- ============================================================

-- Найраніша та найпізніша дата сеансу.
SELECT
    MIN(screening_date) AS earliest_screening,
    MAX(screening_date) AS latest_screening
FROM screenings;


-- ============================================================
-- Завдання 4. Кілька агрегатних функцій в одному SELECT
-- ============================================================

SELECT
    COUNT(*) AS total_screenings,
    SUM(ticket_price) AS total_price,
    AVG(ticket_price) AS average_price,
    MIN(ticket_price) AS min_price,
    MAX(ticket_price) AS max_price
FROM screenings;


-- ============================================================
-- Завдання 5. Агрегатні функції з умовою WHERE
-- ============================================================

-- Статистика сеансів для фільму з movie_id = 1.
SELECT
    COUNT(*) AS screenings_count,
    AVG(ticket_price) AS average_price,
    SUM(ticket_price) AS total_price
FROM screenings
WHERE movie_id = 1;


-- ============================================================
-- Кінець практичної роботи
-- ============================================================