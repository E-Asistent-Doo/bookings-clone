INSERT INTO restrictions (restriction_name, created_at, updated_at) VALUES
('Reservation', '2024-04-03 00:00:00', '2024-04-03 00:00:00'),
('Owner block', '2024-04-03 00:00:00', '2024-04-03 00:00:00') ON CONFLICT DO NOTHING;
