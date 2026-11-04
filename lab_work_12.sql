
-- Практична робота №12
-- Тема: Сортування і фільтрація даних
-- Варіант 3. Кінотеатр

-- Завдання 1. ORDER BY за однією колонкою
-- Сортування сеансів за датою у спадному порядку

SELECT
    id,
    movie_id,
    hall_id,
    screening_date,
    start_time,
    ticket_price
FROM screenings
ORDER BY screening_date DESC;

-- Результат:
-- ID 3: 2026-10-02, 15:00, ціна 120.0
-- ID 1: 2026-10-01, 18:00, ціна 150.0
-- ID 2: 2026-10-01, 20:00, ціна 180.0


-- Завдання 2. ORDER BY за двома колонками
-- Спочатку сортування за залом, потім за датою

SELECT
    id,
    movie_id,
    hall_id,
    screening_date,
    start_time,
    ticket_price
FROM screenings
ORDER BY hall_id ASC, screening_date DESC;

-- Результат:
-- ID 3: зал 1, дата 2026-10-02
-- ID 1: зал 1, дата 2026-10-01
-- ID 2: зал 2, дата 2026-10-01


-- Завдання 3. Три найдорожчі сеанси
-- ORDER BY сортує всі рядки, LIMIT залишає перші три

SELECT
    id,
    movie_id,
    hall_id,
    screening_date,
    start_time,
    ticket_price
FROM screenings
ORDER BY ticket_price DESC
LIMIT 3;

-- Результат:
-- ID 2: ціна 180.0
-- ID 1: ціна 150.0
-- ID 3: ціна 120.0


-- Завдання 4а. DISTINCT
-- Отримання унікальних номерів залів

SELECT DISTINCT hall_id
FROM screenings
ORDER BY hall_id;

-- Результат: 1, 2
-- Кількість унікальних значень: 2


-- Завдання 4б. BETWEEN
-- Пошук сеансів із ціною від 120 до 160 включно

SELECT
    id,
    movie_id,
    ticket_price
FROM screenings
WHERE ticket_price BETWEEN 120 AND 160
ORDER BY ticket_price;

-- Результат:
-- ID 3, movie_id 3, ціна 120.0
-- ID 1, movie_id 1, ціна 150.0


-- Завдання 5а. LIKE з великої кириличної літери

SELECT title
FROM movies
WHERE title LIKE 'І%';

-- Результат: Інтерстеллар


-- Завдання 5б. LIKE з маленької кириличної літери

SELECT title
FROM movies
WHERE title LIKE 'і%';

-- Результат: 0 рядків
