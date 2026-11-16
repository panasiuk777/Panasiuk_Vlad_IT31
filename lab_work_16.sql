```sql
-- Практична робота 16
-- Тема: Імпорт CSV у SQLite
-- Варіант 3: Кінотеатр
-- Vlad Panasiuk, IT31

-- 1. Перевірка кількості фільмів до імпорту
SELECT COUNT(*) AS movies_before
FROM movies;
-- Результат: 6

-- 2. Перегляд імпортованих CSV-даних
-- Таблиця movies_staging створена через CSV Import у DB Browser
SELECT *
FROM movies_staging;
-- Результат: 8 рядків

-- 3. Перенесення даних у основну таблицю
INSERT INTO movies (title, genre, duration_min, year, age_rating)
SELECT title, genre, duration_min, year, age_rating
FROM movies_staging;
-- Результат: 8 рядків додано

-- Перевірка кількості записів після імпорту
SELECT COUNT(*) AS movies_after
FROM movies;
-- Результат: 14

-- 4. Перевірка доданих фільмів
SELECT id, title, genre
FROM movies
WHERE id BETWEEN 7 AND 14;
-- Результат: 8 нових фільмів з ID від 7 до 14

-- Видалення тимчасової таблиці
DROP TABLE movies_staging;

-- 5. Перевірка прямого імпорту CSV
-- Виконано через CSV Import у тестовій копії lab_work_16_test.db.
-- DB Browser повідомив:
-- There is already a table named 'movies' and an import into
-- an existing table is only possible if the number of columns match.
-- CSV містить 5 стовпців, таблиця movies має 6 стовпців.
-- Прямий імпорт не виконано.
```