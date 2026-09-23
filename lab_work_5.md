Практична робота 5
Варіант 3 — Кінотеатр
Завдання 1 — NOT NULL

До movies.genre додано NOT NULL.

При спробі додати фільм без жанру отримано:

NOT NULL constraint failed: movies.genre

Завдання 2 — UNIQUE

До halls.name додано UNIQUE.

При спробі додати зал з існуючою назвою отримано:

UNIQUE constraint failed: halls.name

Завдання 3 — CHECK

Для halls.capacity встановлено:

CHECK (capacity > 0)


При значенні 0 отримано:

CHECK constraint failed: capacity > 0


При значенні 50 запис успішно додано.

Завдання 4 — DEFAULT

Для movies.age_rating встановлено DEFAULT 0.

При додаванні фільму без age_rating автоматично встановилося:

0

Завдання 5 — UPDATE

При спробі встановити capacity = 0 через UPDATE отримано:

CHECK constraint failed: capacity > 0


Отже, CHECK працює як при INSERT, так і при UPDATE.

Завдання 6 — Висновок

NOT NULL для genre потрібен, тому що кожен фільм повинен мати жанр.

UNIQUE для halls.name потрібен, щоб назви залів не повторювалися.

CHECK для capacity потрібен, щоб місткість залу була додатною.

DEFAULT для age_rating потрібен, щоб автоматично встановлювати рейтинг 0, якщо його не вказано.