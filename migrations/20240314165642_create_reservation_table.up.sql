CREATE TABLE IF NOT EXISTS reservations (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR DEFAULT '',
    last_name VARCHAR DEFAULT '',
    email VARCHAR,
    phone VARCHAR DEFAULT '',
    start_date DATE,
    end_date DATE,
    room_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
