DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE Referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE Players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height INTEGER NOT NULL,
    current_team_id INT,
    FOREIGN KEY (current_team_id) REFERENCES Teams(id)
);

CREATE TABLE Matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(id),
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TEXT NOT NULL,
    season_id INT,
    head_referee_id INT,
    assistant_referee_1_id INT,
    assistant_referee_2_id INT,
    FOREIGN KEY (season_id) REFERENCES Season(id),
    FOREIGN KEY (head_referee_id) REFERENCES Referees(id),
    FOREIGN KEY (assistant_referee_1_id) REFERENCES Referees(id),
    FOREIGN KEY (assistant_referee_2_id) REFERENCES Referees(id)
);

CREATE TABLE Goals
(
    id SERIAL PRIMARY KEY,
    player_id INT,
    match_id INT,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (match_id) REFERENCES Matches(id)
);

CREATE TABLE Results
(
    id SERIAL PRIMARY KEY,
    team_id INT,
    match_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(id),
    FOREIGN KEY (match_id) REFERENCES Matches(id),
    result(win, loss, or draw) TEXT NOT NULL; --DOUBLE CHECK IF CORRECT
)

INSERT INTO Teams 
    (name, city)
VALUES 
    ('Lights', 'Las Vegas'), 
    ('Rowdies', 'Tampa Bay');

--ask if needed to put head, assistance 1 , assistance 2, 
INSERT INTO Referees
    (name)
VALUES 
    ('Sanders'),
    ('Thompson'),
    ('Richards');

INSERT INTO Season
    (start_date, end_date)
VALUES
    ('2024-02-21', '2024-10-19');

INSERT INTO Players
    (name, bithday, height, current_team_id)
VALUES
    ('Messi', '1985-12-22', 70, 1),
    ('Ronaldo', '1986-10-20', 79, 1),
    ('Atama', '1990-09-08', 75, 2),
    ('Nguyen', '1993-11-26', 69, 2);

INSERT INTO Matches
    (home_team_id, away_team_id, location, date, start_time, 
        season_id, head_referee_id, assistant_referee_1_id, assistant_referee_2_id)
VALUES
    (1, 2, 'Las Vegas', '2024-03-21', '6:00PM', 3, 1, 2, 3);

INSERT INTO Goals
    (player_id, match_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1);

INSERT INTO Results
    (team_id, match_id, result)
VALUES
    (1, 1, 'win'),
    (2, 1, 'loss');
    
