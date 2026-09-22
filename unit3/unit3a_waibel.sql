SELECT COUNT(*) 
FROM games_flat
WHERE home_team = 'Cleveland Cavaliers'
    OR away_team = 'Cleveland Cavaliers';
	
SELECT COUNT(*) 
FROM games_flat
WHERE home_city = 'Cleveland'
    OR away_city = 'Cleveland';
	
SELECT DISTINCT home_team 
FROM games_flat
ORDER BY home_team;

SELECT COUNT(*) 
FROM games_flat;

SELECT COUNT(*) 
FROM games_flat
WHERE away_city = 'Chicago';

SELECT DISTINCT away_team
FROM games_flat
ORDER BY away_team;

SELECT game_id, away_team
FROM games_flat
WHERE away_team = 'Pheonix Suns';

SELECT COUNT(*)
FROM games_flat
WHERE home_team = 'Chicago Bulls' OR away_team = 'Chicago Bulls';