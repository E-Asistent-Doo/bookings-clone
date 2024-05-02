CREATE TABLE IF NOT EXISTS room_restrictions (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    room_id INTEGER,
    reservation_id INTEGER,
    restriction_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
