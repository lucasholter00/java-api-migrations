--Directors
CREATE TABLE IF NOT EXISTS directors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL
);

ALTER TABLE movies
DROP COLUMN director,
DROP COLUMN director_country;

ALTER TABLE movies
ADD COLUMN director_id INT;

ALTER TABLE movies
ADD CONSTRAINT fk_directors FOREIGN KEY (director_id) REFERENCES directors(id);

--Stars
CREATE TABLE IF NOT EXISTS stars(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL
);

ALTER TABLE movies
DROP COLUMN star,
DROP COLUMN star_dob;

ALTER TABLE movies
ADD COLUMN star_id INT;

ALTER TABLE movies
ADD CONSTRAINT fk_stars FOREIGN KEY (star_id) REFERENCES stars(id);

--Writer
CREATE TABLE IF NOT EXISTS writers(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

ALTER TABLE movies
DROP COLUMN writer,
DROP COLUMN writer_email;

ALTER TABLE movies
ADD COLUMN writer_id INT;

ALTER TABLE movies
ADD CONSTRAINT fk_writers FOREIGN KEY (writer_id) REFERENCES writers(id);


