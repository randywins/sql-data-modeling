DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    encrypted_password TEXT NOT NULL
);

CREATE TABLE Posts
(
    id SERIAL PRIMARY KEY,
	user_id INT,
	region_id INT,
	category_id INT,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (region_id) REFERENCES Regions(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

INSERT INTO Regions (name)
VALUES (7, 'Southwest');

INSERT INTO Categories (category_id, name)
VALUES (1, 'cars');

INSERT INTO Users (username, encrypted_password)
VALUES ('randywins', 'Password123');

INSERT INTO Posts (text, location, user_id, region_id, category_id)
VALUES ('Honda Civic 2007', 'Las Vegas', 1, 1, 1);



