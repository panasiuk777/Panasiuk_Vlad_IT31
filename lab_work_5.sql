PRAGMA foreign_keys = ON;

-- Завдання 1: NOT NULL для genre
ALTER TABLE movies RENAME TO movies_old;

CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT NOT NULL,
    duration_min INTEGER,
    year INTEGER,
    age_rating INTEGER DEFAULT 0
);

INSERT INTO movies
SELECT * FROM movies_old;

DROP TABLE movies_old;

-- Завдання 2: UNIQUE для назви залу
ALTER TABLE halls RENAME TO halls_old;

CREATE TABLE halls (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    capacity INTEGER NOT NULL CHECK (capacity > 0)
);

INSERT INTO halls
SELECT * FROM halls_old;

DROP TABLE halls_old;

-- Завдання 3: CHECK для capacity
-- CHECK вже додано під час створення halls

-- Завдання 4: DEFAULT для age_rating
-- DEFAULT вже додано під час створення movies

-- Завдання 5: перевірка CHECK через UPDATE
UPDATE halls
SET capacity = 0
WHERE name = 'Червоний зал';
