
-- Практична робота 13
-- Тема: Форматування таблиць за допомогою printf і дат
-- База даних: Cinema
-- Структура таблиць не змінювалася.

-- Завдання 1. Форматування ціни за допомогою printf()
SELECT
    id,
    ticket_price AS raw_price,
    printf('%.2f грн', ticket_price) AS formatted_price
FROM screenings;

-- Результат:
-- 1 | 150.0 | 150.00 грн
-- 2 | 180.0 | 180.00 грн
-- 3 | 120.0 | 120.00 грн


-- Завдання 2. Форматування з фіксованою шириною поля
SELECT
    id,
    ticket_price,
    printf('%8.2f грн', ticket_price) AS formatted_price
FROM screenings;

-- Результат:
-- 1 | 150.0 |   150.00 грн
-- 2 | 180.0 |   180.00 грн
-- 3 | 120.0 |   120.00 грн


-- Завдання 3. Зміщення дати на 7 днів
SELECT
    id,
    screening_date,
    date(screening_date, '+7 days') AS new_date
FROM screenings;

-- Результат:
-- 1 | 2026-10-01 | 2026-10-08
-- 2 | 2026-10-01 | 2026-10-08
-- 3 | 2026-10-02 | 2026-10-09


-- Завдання 4. Отримання року та групування сеансів
SELECT
    strftime('%Y', screening_date) AS year,
    COUNT(*) AS screenings_count
FROM screenings
GROUP BY year
ORDER BY year;

-- Результат:
-- 2026 | 3


-- Завдання 5. Перевірка некоректної дати
SELECT
    'not-a-date' AS invalid_value,
    strftime('%Y', 'not-a-date') AS extracted_year;

-- Результат:
-- not-a-date | NULL
-- SQLite не видає помилку, а повертає NULL.
