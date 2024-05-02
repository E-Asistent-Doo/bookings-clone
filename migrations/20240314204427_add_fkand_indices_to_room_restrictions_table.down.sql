ALTER TABLE room_restrictions
DROP CONSTRAINT room_restrictions_reservations_id_fk;

ALTER TABLE room_restrictions
DROP CONSTRAINT room_restrictions_restrictions_id_fk;

ALTER TABLE room_restrictions
DROP CONSTRAINT room_restrictions_rooms_id_fk;

DROP INDEX reservations_last_name_idx;
DROP INDEX reservations_email_idx;