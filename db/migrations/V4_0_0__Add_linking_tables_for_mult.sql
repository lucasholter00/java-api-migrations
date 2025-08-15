CREATE TABLE movies_to_persons(
    id SERIAL PRIMARY KEY,
    movie_id INT,
    person_id INT,
    role TEXT,
    CONSTRAINT fk_movies FOREIGN KEY (movie_id) REFERENCES movies(id),
    CONSTRAINT fk_persons FOREIGN KEY (person_id) REFERENCES persons(id)
);

INSERT INTO movies_to_persons(movie_id, person_id, role)
SELECT id, director_id, 'director' FROM movies
UNION ALL
SELECT id, star_id, 'star' FROM movies
UNION ALL
SELECT id, writer_id, 'writer' FROM movies;

ALTER TABLE movies
DROP COLUMN director_id,
DROP COLUMN writer_id,
DROP COLUMN star_id;