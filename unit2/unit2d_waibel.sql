-- =====================================================================
-- Unit 2d — Counting and Summarizing
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2d_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in the database?
SELECT COUNT(team_id) from teams;

-- 2. How many players?
SELECT COUNT(player_id) from players;

-- 3. What is the earliest founding year of any team?
SELECT MIN(year_founded) from teams;

-- 4. What is the most recent?
SELECT MAX(year_founded) from teams;

-- 5. What is the average founding year, rounded to a whole number?
SELECT ROUND(AVG(year_founded)) from teams;

-- 6. What is the total number of points scored across every game in
--    the database?
SELECT SUM(pts) from team_game_stats;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 6 reads 10,842 rows and gives you one number. What is it?
-- 1399607 total points

-- COUNT(*) counts rows. What does COUNT(birth_year) count instead?
-- It will count the amount of people that have a birth year entered in the database

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Aggregate function: A function that only returns one value