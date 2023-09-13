CREATE TABLE Label (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    color VARCHAR(20)
);

<--CREATE TABLE Source (
<--    id INT PRIMARY KEY AUTO_INCREMENT,
<--    name VARCHAR(255)
<--);

<--CREATE TABLE Genre (
<--    id INT PRIMARY KEY AUTO_INCREMENT,
<--    name VARCHAR(255)
<--);

<--CREATE TABLE Author (
<--    id INT PRIMARY KEY AUTO_INCREMENT,
<--    first_name VARCHAR(255),
<--    last_name VARCHAR(255)
<--);

CREATE TABLE Item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    <-- genre_id INT,
    <--author_id INT,
    <--source_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    <--FOREIGN KEY (genre_id) REFERENCES Genre(id),
    <--FOREIGN KEY (author_id) REFERENCES Author(id),
    <--FOREIGN KEY (source_id) REFERENCES Source(id),
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Book (
    item_id INT PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

<--CREATE TABLE MusicAlbum (
<--    item_id INT PRIMARY KEY,
<--    on_spotify BOOLEAN,
<--    FOREIGN KEY (item_id) REFERENCES Item(id)
<--);

<--CREATE TABLE Movie (
<--    item_id INT PRIMARY KEY,
<--    silent BOOLEAN,
<--    FOREIGN KEY (item_id) REFERENCES Item(id)
<--);

<--CREATE TABLE Game (
<--item_id INT PRIMARY KEY,
<--multiplayer BOOLEAN,
<--last_played_at DATE,
<--FOREIGN KEY (item_id) REFERENCES Item(id)
<--);
