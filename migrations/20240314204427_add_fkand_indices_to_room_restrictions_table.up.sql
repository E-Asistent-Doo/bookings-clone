ALTER TABLE room_restrictions
ADD CONSTRAINT fk_reservation_id
FOREIGN KEY (reservation_id)
REFERENCES reservations(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE room_restrictions
ADD CONSTRAINT fk_room_id
FOREIGN KEY (room_id)
REFERENCES rooms(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE room_restrictions
ADD CONSTRAINT fk_restriction_id
FOREIGN KEY (restriction_id)
REFERENCES restrictions(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

CREATE INDEX reservations_email_idx ON reservations (email);

CREATE INDEX reservations_last_name_idx ON reservations (last_name);


