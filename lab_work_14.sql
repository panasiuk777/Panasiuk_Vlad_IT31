-- Практична робота 14
-- Тема: Транзакції SQLite
-- Vlad Panasiuk, IT31

-- Завдання 1. BEGIN TRANSACTION та COMMIT
BEGIN TRANSACTION;

INSERT INTO movie_watchlist
(movie_id, viewer_id, planned_date, status, note)
VALUES
(3, 1, '2026-11-20', 'planned', 'Практична робота 14');

UPDATE movie_watchlist
SET status = 'watched'
WHERE id = 1;

SELECT * FROM movie_watchlist
WHERE id IN (1, 11);

COMMIT;


-- Завдання 2. ROLLBACK
BEGIN TRANSACTION;

UPDATE movie_watchlist
SET status = 'planned'
WHERE id = 1;

INSERT INTO movie_watchlist
(movie_id, viewer_id, planned_date, status, note)
VALUES
(4, 2, '2026-12-01', 'planned', 'Тест для ROLLBACK');

SELECT * FROM movie_watchlist
WHERE id IN (1, 12);

ROLLBACK;


-- Завдання 3. Перевірка змін до ROLLBACK
BEGIN TRANSACTION;

UPDATE movie_watchlist
SET status = 'planned'
WHERE id = 1;

SELECT * FROM movie_watchlist
WHERE id = 1;

ROLLBACK;


-- Завдання 4. Помилка та скасування транзакції
BEGIN TRANSACTION;

UPDATE movie_watchlist
SET status = 'watched'
WHERE id = 2;

-- Цей запит навмисно викликає UNIQUE constraint failed:
-- INSERT INTO viewers (name, email)
-- VALUES ('Тестовий глядач', 'andrii@gmail.com');

SELECT * FROM movie_watchlist
WHERE id = 2;

ROLLBACK;


-- Завдання 5. Помилка та підтвердження транзакції
BEGIN TRANSACTION;

UPDATE movie_watchlist
SET status = 'watched'
WHERE id = 2;

-- Цей запит навмисно викликає UNIQUE constraint failed:
-- INSERT INTO viewers (name, email)
-- VALUES ('Тестовий глядач', 'andrii@gmail.com');

COMMIT;

SELECT * FROM movie_watchlist
WHERE id = 2;