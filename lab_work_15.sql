```sql
-- Практична робота 15
-- Vlad Panasiuk, IT31
-- Створення індексів та аналіз ефективності запитів

-- Завдання 1. План до створення індексу
EXPLAIN QUERY PLAN
SELECT * FROM screenings
WHERE movie_id = 1;
-- SCAN screenings

-- Завдання 2. Індекс за movie_id
CREATE INDEX idx_screenings_movie_id
ON screenings(movie_id);

EXPLAIN QUERY PLAN
SELECT * FROM screenings
WHERE movie_id = 1;
-- SEARCH screenings USING INDEX idx_screenings_movie_id (movie_id=?)

-- Завдання 3. Композитний індекс
EXPLAIN QUERY PLAN
SELECT * FROM screenings
WHERE movie_id = 1 AND hall_id = 1;
-- SEARCH screenings USING INDEX idx_screenings_movie_id (movie_id=?)

CREATE INDEX idx_screenings_movie_hall
ON screenings(movie_id, hall_id);

EXPLAIN QUERY PLAN
SELECT * FROM screenings
WHERE movie_id = 1 AND hall_id = 1;
-- SEARCH screenings USING INDEX idx_screenings_movie_hall (movie_id=? AND hall_id=?)

-- Завдання 4. Індекс за датою
EXPLAIN QUERY PLAN
SELECT * FROM screenings
ORDER BY screening_date;
-- SCAN screenings
-- USE TEMP B-TREE FOR ORDER BY

CREATE INDEX idx_screenings_date
ON screenings(screening_date);

EXPLAIN QUERY PLAN
SELECT * FROM screenings
ORDER BY screening_date;
-- SCAN screenings USING INDEX idx_screenings_date

-- Завдання 5. Видалення композитного індексу
DROP INDEX idx_screenings_movie_hall;

EXPLAIN QUERY PLAN
SELECT * FROM screenings
WHERE movie_id = 1 AND hall_id = 1;
-- SEARCH screenings USING INDEX idx_screenings_movie_id (movie_id=?)

-- Перевірка видалення
SELECT name
FROM sqlite_master
WHERE type = 'index'
AND name = 'idx_screenings_movie_hall';

-- Перевірка індексів, що залишилися
SELECT name
FROM sqlite_master
WHERE type = 'index'
AND tbl_name = 'screenings';
-- idx_screenings_movie_id
-- idx_screenings_date
```