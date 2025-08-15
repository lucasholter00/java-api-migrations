CREATE TABLE persons(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT,
    date_of_birth DATE,
    email TEXT
);

INSERT INTO persons (name, country, date_of_birth, email) VALUES
  ('Stanley Kubrick', 'USA', NULL, NULL),
  ('Keir Dullea', NULL, '1936-05-30', NULL),
  ('Arthur C Clarke', NULL, NULL, 'arthur@clarke.com'),

  ('George Lucas', 'USA', NULL, 'george@email.com'),
  ('Mark Hamill', NULL, '1951-09-25', NULL),

  ('Robert Mulligan', 'USA', NULL, NULL),
  ('Gregory Peck', NULL, '1916-04-05', NULL),
  ('Harper Lee', NULL, NULL, 'harper@lee.com'),

  ('James Cameron', 'Canada', NULL, 'james@cameron.com'),
  ('Leonardo DiCaprio', NULL, '1974-11-11', NULL),

  ('David Lean', 'UK', NULL, NULL),
  ('Julie Christie', NULL, '1940-04-14', NULL),
  ('Boris Pasternak', NULL, NULL, 'boris@boris.com'),

  ('Anthony Mann', 'USA', NULL, NULL),
  ('Charlton Heston', NULL, '1923-10-04', NULL),
  ('Frederick Frank', NULL, NULL, 'fred@frank.com'),

  ('Theodoros Angelopoulos', 'Greece', NULL, 'theo@angelopoulos.com'),
  ('Manos Katrakis', NULL, '1908-08-14', NULL),

  ('Paul Verhoeven', 'Netherlands', NULL, NULL),
  ('Rutger Hauer', NULL, '1944-01-23', NULL),
  ('Erik Hazelhoff Roelfzema', NULL, NULL, 'erik@roelfzema.com'),

  ('Krzysztof Kieslowski', 'Poland', NULL, 'email@email.com'),
  ('Juliette Binoche', NULL, '1964-03-09', NULL),

  ('Jean-Paul Rappeneau', 'France', NULL, NULL),
  ('Gerard Depardieu', NULL, '1948-12-27', NULL),
  ('Edmond Rostand', NULL, NULL, 'edmond@rostand.com');

ALTER TABLE movies
DROP CONSTRAINT fk_directors,
DROP CONSTRAINT fk_stars,
DROP CONSTRAINT fk_writers;

ALTER TABLE movies
ADD CONSTRAINT fk_directors FOREIGN KEY (director_id) REFERENCES persons(id),
ADD CONSTRAINT fk_stars FOREIGN KEY (star_id) REFERENCES persons(id),
ADD CONSTRAINT fk_writers FOREIGN KEY (writer_id) REFERENCES persons(id);


--replace data

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Stanley Kubrick'),
    star_id = (SELECT id FROM persons WHERE name = 'Keir Dullea'),
    writer_id = (SELECT id FROM persons WHERE name = 'Arthur C Clarke')
WHERE title = '2001: A Space Odyssey';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'George Lucas'),
    star_id = (SELECT id FROM persons WHERE name = 'Mark Hamill'),
    writer_id = (SELECT id FROM persons WHERE name = 'George Lucas')
WHERE title = 'Star Wars: A New Hope';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Robert Mulligan'),
    star_id = (SELECT id FROM persons WHERE name = 'Gregory Peck'),
    writer_id = (SELECT id FROM persons WHERE name = 'Harper Lee')
WHERE title = 'To Kill A Mockingbird';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'James Cameron'),
    star_id = (SELECT id FROM persons WHERE name = 'Leonardo DiCaprio'),
    writer_id = (SELECT id FROM persons WHERE name = 'James Cameron')
WHERE title = 'Titanic';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'David Lean'),
    star_id = (SELECT id FROM persons WHERE name = 'Julie Christie'),
    writer_id = (SELECT id FROM persons WHERE name = 'Boris Pasternak')
WHERE title = 'Dr Zhivago';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Anthony Mann'),
    star_id = (SELECT id FROM persons WHERE name = 'Charlton Heston'),
    writer_id = (SELECT id FROM persons WHERE name = 'Frederick Frank')
WHERE title = 'El Cid';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Theodoros Angelopoulos'),
    star_id = (SELECT id FROM persons WHERE name = 'Manos Katrakis'),
    writer_id = (SELECT id FROM persons WHERE name = 'Theodoros Angelopoulos')
WHERE title = 'Voyage to Cythera';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Paul Verhoeven'),
    star_id = (SELECT id FROM persons WHERE name = 'Rutger Hauer'),
    writer_id = (SELECT id FROM persons WHERE name = 'Erik Hazelhoff Roelfzema')
WHERE title = 'Soldier of Orange';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Krzysztof Kieslowski'),
    star_id = (SELECT id FROM persons WHERE name = 'Juliette Binoche'),
    writer_id = (SELECT id FROM persons WHERE name = 'Krzysztof Kieslowski')
WHERE title = 'Three Colours: Blue';

UPDATE movies
SET director_id = (SELECT id FROM persons WHERE name = 'Jean-Paul Rappeneau'),
    star_id = (SELECT id FROM persons WHERE name = 'Gerard Depardieu'),
    writer_id = (SELECT id FROM persons WHERE name = 'Edmond Rostand')
WHERE title = 'Cyrano de Bergerac';


DROP TABLE directors;
DROP TABLE stars;
DROP TABLE writers;