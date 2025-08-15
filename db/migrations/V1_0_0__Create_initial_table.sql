CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director TEXT NOT NULL,
    director_country TEXT NOT NULL,
    star TEXT NOT NULL,
    star_dob DATE NOT NULL,
    writer TEXT NOT NULL,
    writer_email TEXT NOT NULL,
    release_year INT NOT NULL,
    genre TEXT NOT NULL,
    score INT NOT NULL
);