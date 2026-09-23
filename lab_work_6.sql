PRAGMA foreign_keys = ON;

-- Завдання 1
UPDATE screenings
SET ticket_price = 270
WHERE id = 1;

-- Завдання 2
UPDATE halls
SET capacity = 110
WHERE id = 1;

-- Завдання 3
DELETE FROM screenings
WHERE id = 10;

-- Завдання 4
DELETE FROM movies
WHERE id = 1;
