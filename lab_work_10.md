# Практична робота №10

## Тема

Відбір груп за допомогою `HAVING`.

## Мета роботи

Навчитися використовувати оператор `HAVING` для фільтрації груп після виконання `GROUP BY`, а також розрізняти призначення `WHERE` та `HAVING`.

---

# Завдання 1. HAVING з COUNT

Згрупуємо записи таблиці `screenings` за зовнішнім ключем `hall_id` та визначимо кількість сеансів у кожному залі.

```sql
SELECT hall_id,
       COUNT(*) AS screenings_count
FROM screenings
GROUP BY hall_id
HAVING COUNT(*) > 1;