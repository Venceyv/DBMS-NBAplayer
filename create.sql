-- Creates nba schema and tables; 

CREATE TABLE NBA_player (
    player_id INT PRIMARY KEY NOT NULL UNIQUE,
    player_name VARCHAR(40) NULL,
    college VARCHAR(40) NULL,
    country VARCHAR(40) NULL
);

CREATE TABLE player_statistics (
    player_id INT NOT NULL,
    FOREIGN KEY (player_id)
        REFERENCES players (player_id),
    season VARCHAR(8) NULL,
    age SMALLINT NULL,
    height SMALLINT NULL,
    weight SMALLINT NULL,
    gp SMALLINT NULL,
    pts INT NULL,
    reb INT NULL,
    ast INT NULL,
    net_rating INT NULL,
    UNIQUE (player_id),
    CHECK (age >= 18)
);

CREATE TABLE team (
    team_id INT PRIMARY KEY NOT NULL UNIQUE,
    team_name VARCHAR(40) NULL,
    city VARCHAR(40) NULL
);

CREATE TABLE team_statistics (
    team_id INT NOT NULL,
        FOREIGN KEY (team_id)
        REFERENCES teams (team_id),
    season VARCHAR(8) NULL,
    win_percentage DOUBLE NULL,
    field_goal_percentage DOUBLE NULL,
    three_point_percentage DOUBLE NULL,
    freethrow_percentage DOUBLE NULL,
    won SMALLINT NULL,
    loss SMALLINT NULL
);

CREATE TABLE player_teams (
    player_id INT NULL,
    FOREIGN KEY (player_id)
        REFERENCES players (player_id),
    team_id INT NULL,
    FOREIGN KEY (team_id)
        REFERENCES teams (team_id),
	season VARCHAR(8) NULL
);

CREATE TABLE draft_information (
	player_id INT NULL,
        FOREIGN KEY (player_id)
        REFERENCES players (player_id),
	draft_year SMALLINT NULL,
    draft_round SMALLINT NULL,
    draft_number SMALLINT NULL
);
