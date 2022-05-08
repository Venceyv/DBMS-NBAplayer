-- Get players who have a greater than average heights 
--  Aggregation Subquery
SELECT 
    player_name AS player, height
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
WHERE
    height > (SELECT AVG(height) FROM player_statistics);


-- Get teams who have a greater than average win rate 
SELECT 
    team_name AS team, win_percentage
FROM
    team
        INNER JOIN
    team_statistics ON team.team_id = team_statistics.team_id
WHERE
    team_statistics.win_percentage > (SELECT 
            AVG(win_percentage)
        FROM
            team_statistics);


-- Muliple Aggregation Subquery
SELECT 
    team_name, AVG(height) AS team_height_average
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
        INNER JOIN
    player_teams ON player_teams.player_id = NBA_player.player_id
        INNER JOIN
    team ON team.team_id = player_teams.team_id
GROUP BY team_name HAVING AVG(height) > (SELECT AVG(height) FROM player_statistics)
ORDER BY team_height_average DESC;


-- The teams with greater than average heights who have a greater than average win rate
--  Multiple Aggregation Subquery
SELECT 
    team_name, AVG(height) AS team_height_average, win_percentage
FROM
    NBA_player
        INNER JOIN
    player_statistics ON NBA_player.player_id = player_statistics.player_id
        INNER JOIN
    player_teams ON player_teams.player_id = NBA_player.player_id
        INNER JOIN
    team ON team.team_id = player_teams.team_id
		INNER JOIN
	team_statistics ON team.team_id = team_statistics.team_id
GROUP BY team_name HAVING AVG(height) > (SELECT AVG(height) FROM player_statistics) AND AVG(win_percentage) > (SELECT AVG(win_percentage) FROM team_statistics)
ORDER BY win_percentage DESC;



