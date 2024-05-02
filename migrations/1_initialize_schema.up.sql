BEGIN;

CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR DEFAULT '',
    last_name VARCHAR DEFAULT '',
    email VARCHAR,
    password VARCHAR(60),
    access_level INTEGER DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (first_name, last_name, email, password, access_level, created_at, updated_at) VALUES
('Aleksa', 'Dam', 'aleksa.dam997@gmail.com', '$2a$14$Dp.5i2fhH..0wSiIXK9JBu6dJFCEZ./D6TtM8m2Di/t7lE8LWmwO.', 1, '2024-04-03 10:07:25', '2024-04-03 10:07:25')
ON CONFLICT DO NOTHING;

COMMIT;

-- INSERT INTO schema_migrations(version, dirty) VALUES (1, 0)
