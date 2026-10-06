# Практика 8. Застосування агрегатних функцій

## Мета роботи

Ознайомитися із застосуванням агрегатних функцій SQLite для отримання статистичної інформації з таблиць бази даних.

У роботі використано агрегатні функції COUNT(), SUM(), AVG(), MIN() та MAX(), а також умову WHERE.

## Завдання 1. COUNT(*) та COUNT(column)

Для таблиці movies виконано підрахунок усіх записів та записів, у яких поле year має значення:

```sql
SELECT
    COUNT(*) AS total_movies,
    COUNT(year) AS movies_with_year
FROM movies;
UPDATE movies
SET year = NULL
WHERE id = 1;
SELECT
    COUNT(*) AS total_movies,
    COUNT(year) AS movies_with_year
FROM movies;
SELECT
    SUM(ticket_price) AS total_ticket_revenue,
    AVG(ticket_price) AS average_ticket_price
FROM screenings;
SELECT
    MIN(screening_date) AS earliest_screening,
    MAX(screening_date) AS latest_screening
FROM screenings;
SELECT
    COUNT(*) AS total_screenings,
    SUM(ticket_price) AS total_price,
    AVG(ticket_price) AS average_price,
    MIN(ticket_price) AS min_price,
    MAX(ticket_price) AS max_price
FROM screenings;
SELECT
    COUNT(*) AS screenings_count,
    AVG(ticket_price) AS average_price,
    SUM(ticket_price) AS total_price
FROM screenings
WHERE movie_id = 1;
Висновок
Під час виконання практичної роботи було опрацьовано агрегатні функції SQLite: COUNT(), SUM(), AVG(), MIN() та MAX().
Було встановлено, що COUNT(*) враховує всі рядки, тоді як COUNT(column) не враховує значення NULL. За допомогою SUM() та AVG() отримано суму та середнє значення числових даних. Функції MIN() і MAX() використано для визначення мінімального та максимального значення. Також було виконано запит із кількома агрегатними функціями та умовою WHERE.