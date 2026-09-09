erDiagram

    movies {
        int id PK
        string title
        string genre
        int duration_min
        int year
        int age_rating
    }

    halls {
        int id PK
        string name
        int capacity
    }

    screenings {
        int id PK
        int movie_id FK
        int hall_id FK
        date screening_date
        string start_time
        real ticket_price
    }

    movies ||--o{ screenings : "показується"
    halls ||--o{ screenings : "проводиться"
