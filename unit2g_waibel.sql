-- =====================================================================
-- Unit 2g — Keeping the Unmatched Rows
-- Database Applications Development · MCCC
--
-- Databases: nba_5seasons.db for 1-3, movies_small.db for 4-5
--
-- Rename this file with your last name before you start.
--
-- Read unit2g_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Using an INNER JOIN, count how many players have stats for the
--    2025-26 season.
SELECT COUNT(p.player_id)
FROM players p
INNER JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26';


-- 2. Using a LEFT JOIN from players, count how many rows you get for
--    the same thing.
SELECT COUNT(p.player_id)
FROM players p
LEFT JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26';

-- 3. List the names of players who have no 2025-26 season stats.
SELECT p.full_name
FROM players p
LEFT JOIN player_season_stats s
  ON s.player_id = p.player_id AND s.season = '2025-26'
WHERE s.player_id IS NULL;

-- 4. In movies_small.db, count how many rows in roles have no
--    character name recorded.
SELECT COUNT(*)
FROM roles
WHERE character IS NULL;


-- 5. Show ten people from movies_small.db who have no birth year
--    recorded.
SELECT *
FROM people
WHERE birth_year IS NULL
LIMIT 10;


-- 6. Pick any query from this unit you found interesting, run it, and
--    export the results to CSV. Name the file
--    unit2_report_lastname.csv and commit it alongside this file.
SELECT   p.full_name, t.full_name AS team, s.pts
FROM     player_season_stats s
JOIN     players p ON p.player_id = s.player_id
JOIN     teams   t ON t.team_id   = s.team_id
WHERE    s.season = '2024-25' AND s.pts > 0.0
ORDER BY s.pts DESC;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Queries 1 and 2 return different numbers. What are they, and what
-- does the difference represent?

--    652 for the first one, 1099 for the second. The difference is the players
--    that have no 2026 season arent added to the one.

-- In query 3 you filtered with IS NULL. Which table did that NULL
-- come from, and why is it NULL?

--     The NULL came from player_season_stats because thats where the 2025-26 season is stored
--     Its NULL because they have no 

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- LEFT JOIN: A join that keeps the null values

-- Export: Takes the data and makes it in a tabular format 