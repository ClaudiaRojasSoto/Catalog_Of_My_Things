
CREATE TABLE Games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_payed_at DATE NOT NULL,
    published_date DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    items INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (items) REFERENCES Games(id)
);

