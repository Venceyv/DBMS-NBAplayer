-- Add a player
INSERT INTO NBA_player
VALUES (5205, "Johnny Dean", "Fresno State", "USA");


--  Add a player's stats
INSERT INTO player_statistics
VALUES (5205, 2021-22, 22, 180, 77, 44, 0, 0, 0, -4);


-- Check to see if player and player stats is properly inserted
SELECT 
    *
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
WHERE
    NBA_player.player_id = 5205;


-- Assign the player to a team in player teams
-- Assign player 5205 to team 5220 for season 2021-22
INSERT INTO player_teams
VALUES(5205, 5220, 2021-22);


-- Check to see if player is assigned to a team
SELECT 
    player_name, team_name
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
        INNER JOIN
    player_teams ON NBA_player.player_id = player_teams.player_id
    INNER JOIN
    team ON team.team_id = player_teams.team_id
WHERE NBA_player.player_id = 5205;


-- Change team of player
UPDATE player_teams 
SET 
    team_id = 5266
WHERE
    player_teams.player_id = 5205;


-- Check to see if player is reassigned to a new team
SELECT 
    player_name, team_name
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
        INNER JOIN
    player_teams ON NBA_player.player_id = player_teams.player_id
    INNER JOIN
    team ON team.team_id = player_teams.team_id
WHERE NBA_player.player_id = 5205;


-- Update players stats - Increment rebound by one
UPDATE player_statistics 
SET 
    reb = reb + 1
WHERE
    player_statistics.player_id = 5205;


-- Check if stat was updated
SELECT 
    player_name, reb
FROM
    NBA_player
        INNER JOIN
    player_statistics ON player_statistics.player_id = NBA_player.player_id
WHERE
    NBA_player.player_id = 5205;


-- Insert invalid player_stats whose age is less than 18 (You have to be older than 18 to be in the NBA)
-- CHECK constraint
INSERT INTO NBA_player
VALUES (5206, "James Dean", "Arizona State", "USA");

-- This query should fail due to constraint violation of being less than the age of 18.
INSERT INTO player_statistics
VALUES (5206, 2021-22, 17, 180, 77, 44, 0, 0, 0, -4);
