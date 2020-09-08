
DROP DATABASE IF EXISTS roadie_db;
CREATE DATABASE roadie_db;
\c roadie_db;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS lineup;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists
(
    id VARCHAR PRIMARY KEY,
    name VARCHAR,
    profile_pic_url VARCHAR,
    bio VARCHAR,
    pricing VARCHAR,
    genre VARCHAR,
    city VARCHAR,
    contact_info VARCHAR
);

CREATE TABLE clients
(
    id VARCHAR PRIMARY KEY,
    name VARCHAR,
    profile_pic_url VARCHAR,
    bio VARCHAR,
    city VARCHAR,
    contact_info VARCHAR
);

CREATE TABLE pictures
(
    id SERIAL PRIMARY KEY,
    artist_id VARCHAR REFERENCES artists(id) ON DELETE CASCADE,
    client_id VARCHAR REFERENCES clients(id) ON DELETE CASCADE,
    caption VARCHAR,
    url VARCHAR
);

CREATE TABLE videos
(
    id SERIAL PRIMARY KEY,
    artist_id VARCHAR REFERENCES artists(id) ON DELETE CASCADE,
    client_id VARCHAR REFERENCES clients(id) ON DELETE CASCADE,
    caption VARCHAR,
    url VARCHAR
);

CREATE TABLE users
(
    id VARCHAR PRIMARY KEY,
    type VARCHAR
);

CREATE TABLE events
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    venue VARCHAR,
    date DATE,
    address VARCHAR,
    city VARCHAR,
    client_id VARCHAR REFERENCES clients(id) ON DELETE CASCADE
);

CREATE TABLE lineup
(
    id SERIAL PRIMARY KEY,
    event_id INT REFERENCES events(id) ON DELETE CASCADE,
    artist_id VARCHAR REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE bookings
(
    id SERIAL PRIMARY KEY,
    artist_id VARCHAR REFERENCES artists(id) ON DELETE CASCADE,
    client_id VARCHAR REFERENCES clients(id) ON DELETE CASCADE,
    event_id INT REFERENCES events(id) ON DELETE CASCADE,
    bio VARCHAR,
    contact_info VARCHAR
);

CREATE TABLE skills
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    artist_id VARCHAR REFERENCES artists(id) ON DELETE CASCADE,
    client_id VARCHAR REFERENCES clients(id) ON DELETE CASCADE
);

INSERT INTO artists
    (id, name, profile_pic_url, bio, pricing, genre, city, contact_info )
VALUES
    ('1', 'Marvin', NULL, 'this is a bio', '$$$', 'METALCORE', 'New York', '8773934448'),
    ('2', 'Kevin', NULL, 'I make F', '$$$', 'METALCORE', 'New York', '8773934448');

INSERT INTO skills
    (name, artist_id)
VALUES
    ('Skill', '1');

INSERT INTO clients
    (id, name, profile_pic_url, bio, city, contact_info )
VALUES
    ('1', 'Henry', 'data:image/jpeg;base64,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', 'this is a bio', 'New York', '8773934448'),
    ('2', 'Ashya', 'data:image/jpeg;base64,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', 'I make F', 'New York', '8773934448');
INSERT INTO events
    (name, venue, date, address, city, client_id)
VALUES
    ('MVP RUN', 'Zoom', '2020-07-29', '47-10 Austell Pl', 'Long Island City', '2'),
    ('SHOCK HOUSE', 'Webster Hall', '2020-08-31', '125 E 11th St', 'New York', '1'),
    ('COMEDY SHOW', 'Apollo Theater', '2020-08-12', '253 W 125th St', 'New York', '2'),
    ('THE ROCKETTES', 'Carnegie Hall', '2020-12-25', '881 Seventh Avenue', 'New York', '2'),
    ('BLACKLIGHT SLIDE', 'Aviator Sports and Events Center', '2020-08-15', '3159 Flatbush Avenue', 'Brooklyn', '1'),
    ('DRUMLINE', 'Betsy Head Park', '2020-09-10', 'Dumont Avenue', 'Brooklyn', '2'),
    ('HALLOWEEN MAZE', 'Blood Manor', '2020-10-31', '359 Broadway Avenue', 'New York', '1');

INSERT INTO bookings
    (id, artist_id, client_id, event_id, bio, contact_info)
VALUES
    ('1', '1', '2', '1', 'This is my first booking!', '6318820223'),
    ('2', '2', '1', '2', 'Ready for the tour now!', '1231231234'),
    ('3', '1', '2', '3', 'Yall didnt know I had jokes too, did you?', '6318820223'),
    ('4', '1', '2', '4', 'This has to be my biggest event to play yet!', '6318820223'),
    ('5', '2', '1', '5', 'Excited to rock the house!', '1231231234'),
    ('6', '2', '2', '6', 'I gets BUSY with the drums baby!', '1231231234'),
    ('7', '1', '1', '7', 'BOO!', '6318820223'),
    ('8', '2', '1', '7', 'I cant wait to scare the little kids.', '1231231234'),
    ('9', '2', '2', '4', 'Oh, this is going to be epic!', '1231231234');

