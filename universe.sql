
CREATE DATABASE universe;


\c universe;


CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    type TEXT,
    age INT,
    num_stars INT,
    has_black_hole BOOLEAN NOT NULL
);


CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    spectral_type VARCHAR,
    luminosity NUMERIC,
    is_binary BOOLEAN NOT NULL,
    is_supernova_candidate BOOLEAN
);


CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    type VARCHAR,
    mass NUMERIC NOT NULL,
    radius NUMERIC,
    has_water BOOLEAN NOT NULL,
    has_atmosphere BOOLEAN
);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    type VARCHAR,
    radius NUMERIC,
    is_inhabited BOOLEAN NOT NULL,
    is_tidal_locked BOOLEAN
);

INSERT INTO galaxy (name, type, age, num_stars, has_black_hole) VALUES
('Milky Way', 'Barred Spiral', 13.6, 250, TRUE),
('Andromeda', 'Spiral', 10.1, 1000, TRUE),
('Triangulum', 'Spiral', 5.8, 40, FALSE),
('Messier 87', 'Elliptical', 12.8, 10000, TRUE),
('Centaurus A', 'Elliptical', 10.8, 500, FALSE),
('Whirlpool', 'Spiral', 11.4, 150, FALSE);


INSERT INTO star (name, galaxy_id, spectral_type, luminosity, is_binary, is_supernova_candidate) VALUES
('Sun', 1, 'G2V', 1.0, FALSE, FALSE),
('Alpha Centauri A', 1, 'G2V', 1.5, TRUE, FALSE),
('Alpha Centauri B', 1, 'K0V', 0.5, TRUE, FALSE),
('Sirius', 1, 'A1V', 23.6, FALSE, TRUE),
('Betelgeuse', 1, 'M1I', 120000, FALSE, TRUE),
('Vega', 1, 'A0V', 40.1, FALSE, FALSE);


INSERT INTO planet (name, star_id, type, mass, radius, has_water, has_atmosphere) VALUES
('Earth', 1, 'Terrestrial', 5.972e24, 6371, TRUE, TRUE),
('Mars', 1, 'Terrestrial', 6.39e23, 3389.5, FALSE, TRUE),
('Jupiter', 1, 'Gas Giant', 1.898e27, 69911, FALSE, FALSE),
('Saturn', 1, 'Gas Giant', 5.683e26, 58232, FALSE, FALSE),
('Neptune', 1, 'Ice Giant', 1.024e26, 24622, FALSE, FALSE),
('Mercury', 1, 'Terrestrial', 3.285e23, 2439.7, FALSE, FALSE),
('Uranus', 1, 'Ice Giant', 8.681e25, 25362, FALSE, FALSE),
('Venus', 1, 'Terrestrial', 4.867e24, 6051.8, FALSE, TRUE),
('Kepler-186f', 2, 'Terrestrial', 3.85e24, 6371, TRUE, TRUE),
('Gliese 581c', 2, 'Terrestrial', 5.8e24, 7150, TRUE, TRUE),
('HD 209458 b', 3, 'Hot Jupiter', 1.327e25, 71492, FALSE, FALSE),
('TrES-4', 3, 'Hot Jupiter', 8.3e24, 186000, FALSE, FALSE);

-- Add data to the moon table
INSERT INTO moon (name, planet_id, type, radius, is_inhabited, is_tidal_locked) VALUES
('Moon', 1, 'Terrestrial', 1737.5, FALSE, TRUE),
('Phobos', 2, 'Rocky', 11.1, FALSE, TRUE),
('Deimos', 2, 'Rocky', 6.2, FALSE, TRUE),
('Io', 3, 'Rocky', 1821.6, FALSE, FALSE),
('Europa', 3, 'Rocky', 1560.8, FALSE, FALSE),
('Ganymede', 3, 'Icy', 2634.1, FALSE, FALSE),
('Callisto', 3, 'Icy', 2410.3, FALSE, FALSE),
('Titan', 4, 'Icy', 2575, FALSE, TRUE),
('Enceladus', 4, 'Icy', 252.1, FALSE, TRUE),
('Triton', 5, 'Icy', 1353.4, FALSE, TRUE),
('Titania', 6, 'Rocky', 788.9, FALSE, TRUE),
('Oberon', 6, 'Rocky', 761.4, FALSE, TRUE),
('Miranda', 6, 'Rocky', 235.8, FALSE, TRUE),
('Ariel', 7, 'Rocky', 578.9, FALSE, TRUE),
('Umbriel', 7, 'Rocky', 584.7, FALSE, TRUE),
('Tethys', 8, 'Icy', 536.3, FALSE, TRUE),
('Dione', 8, 'Icy', 561.4, FALSE, TRUE),
('Rhea', 8, 'Icy', 764.3, FALSE, TRUE),
('Iapetus', 8, 'Rocky', 734.5, FALSE, TRUE),
('Charon', 9, 'Rocky', 606, FALSE, TRUE);
