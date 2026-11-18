-- Практична робота 17
-- Тема: Перевірка якості CSV та імпорт/експорт даних
-- Варіант 3: Кінотеатр
-- Vlad Panasiuk, IT31

-- 1. Перевірка початкової таблиці
SELECT COUNT(*) AS movies_before
FROM movies;

-- 2. Перевірка імпортованих даних
SELECT COUNT(*) AS staging_total
FROM staging_movies;

-- 3. Пошук порожніх значень
SELECT *
FROM staging_movies
WHERE duration_min IS NULL;

-- 4. Перевірка дублікатів
SELECT title, COUNT(*) AS total
FROM staging_movies
GROUP BY title
HAVING COUNT(*) > 1;

-- 5. Перевірка типів даних
SELECT
    typeof(duration_min) AS duration_type,
    COUNT(*) AS total
FROM staging_movies
GROUP BY typeof(duration_min);

-- 6. Перевірка кількості записів після перенесення
SELECT COUNT(*) AS movies_after
FROM movies;

-- 7. Перевірка доданих фільмів
SELECT id, title, genre, duration_min, year, age_rating
FROM movies
WHERE id > 14
ORDER BY id;

-- 8. Перевірка дублікатів у кінцевій таблиці
SELECT title, COUNT(*) AS total
FROM movies
GROUP BY title
HAVING COUNT(*) > 1;

-- 9. Перевірка NULL у кінцевій таблиці
SELECT COUNT(*) AS missing_duration
FROM movies
WHERE duration_min IS NULL;

-- 10. Дані для експорту
SELECT id, title, genre, duration_min, year, age_rating
FROM movies
WHERE id > 14
ORDER BY id;