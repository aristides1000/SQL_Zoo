/* 0 SELECT basics */
/* 1.
The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

Modify it to show the population of Germany */
SELECT population FROM world
  WHERE name = 'Germany';

/* 2.
Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

Show the name and the population for 'Sweden', 'Norway' and 'Denmark'. */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* 3.
Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000. */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/* SELECT Quiz */
/* 1. Select the code which produces this table
name	population
Bahrain	1234571
Swaziland	1220000
Timor-Leste	1066409 */
SELECT name, population
  FROM world
  WHERE population BETWEEN 1000000 AND 1250000;

/* 2. Pick the result you would obtain from this code:
      SELECT name, population
      FROM world
      WHERE name LIKE 'Al%' */

Table-E
Albania	3200000
Algeria	32900000

/* 3. Select the code which shows the countries that end in A or L */
SELECT name FROM world
  WHERE name LIKE '%a' OR name LIKE '%l';

/* 4. Pick the result from the query
SELECT name,length(name)
FROM world
WHERE length(name)=5 and continent='Europe' */
name	length(name)
Italy	5
Malta	5
Spain	5

/* 5. Here are the first few rows of the world table:

name	region	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
...
Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000 */
Andorra	936

/* 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000 */
SELECT name, area, population
  FROM world
  WHERE area > 50000 AND population < 10000000;

/* 7. Select the code that shows the population density of China, Australia, Nigeria and France */
SELECT name, population/area
  FROM world
  WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

/* 1 SELECT name */
/* 1.
You can use WHERE name LIKE 'B%' to find the countries that start with "B".

The % is a wild-card it can match any characters
Find the country that start with Y */
SELECT name FROM world
  WHERE name LIKE 'Y%';

/* 2.
Find the countries that end with y */
SELECT name FROM world
  WHERE name LIKE '%y';

/* 3.
Luxembourg has an x - so does one other country. List them both.

Find the countries that contain the letter x */
SELECT name FROM world
  WHERE name LIKE '%x%';

/* 4.
Iceland, Switzerland end with land - but are there others?

Find the countries that end with land */
SELECT name FROM world
  WHERE name LIKE '%land';

/* 5.
Columbia starts with a C and ends with ia - there are two more like this.

Find the countries that start with C and end with ia */
SELECT name FROM world
  WHERE name LIKE 'C%ia';

/* 6.
Greece has a double e - who has a double o?

Find the country that has oo in the name */
SELECT name FROM world
  WHERE name LIKE '%OO%';

/* 7.
Bahamas has three a - who else?

Find the countries that have three or more a in the name */
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

/* 8.
India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

SELECT name FROM world
  WHERE name LIKE '_n%'
ORDER BY name
Find the countries that have "t" as the second character. */
SELECT name FROM world
  WHERE name LIKE '_t%'
ORDER BY name;

/* 9.
Lesotho and Moldova both have two o characters separated by two other characters.

Find the countries that have two "o" characters separated by two others. */
SELECT name FROM world
  WHERE name LIKE '%o__o%';

/* 10.
Cuba and Togo have four characters names.

Find the countries that have exactly four characters. */
SELECT name FROM world
  WHERE name LIKE '____';

/* 2 SELECT from World */
/* 1.
Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries. */
SELECT name, continent, population FROM world;

/* 2.
How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. */
SELECT name
  FROM world
  WHERE population > 200000000;

/* 3.
Give the name and the per capita GDP for those countries with a population of at least 200 million.

HELP:How to calculate per capita GDP */
SELECT name, gdp/population
FROM world
WHERE population>200000000;

/* 4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. */
SELECT name, population / 1000000
  FROM world
WHERE continent = 'South America';

/* 5.
Show the name and population for France, Germany, Italy */
SELECT name, population
  FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/* 6.
Show the countries which have a name that includes the word 'United' */
SELECT name
  FROM world
WHERE name LIKE '%United%';

/* 7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area. */
SELECT name, population, area
  FROM world
WHERE area > 3000000 OR population > 250000000;

/* 8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded. */
SELECT name, population, area
  FROM world
WHERE area > 3000000 XOR population > 250000000;

/* 9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions */
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2)
  FROM world
WHERE continent = 'South America';

/* 10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.

 */
SELECT name, ROUND(gdp / population, -3)
  FROM world
WHERE gdp >= 1000000000000;

/* 11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string */
SELECT name, capital
  FROM world
WHERE LENGTH(name) = LENGTH(capital);

/* 12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator. */
SELECT name, capital
  FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital;

/* 13.
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a' */
SELECT name
  FROM world
WHERE
name LIKE '%a%' AND 
name  LIKE '%e%' AND 
name  LIKE '%i%' AND 
name  LIKE '%o%' AND 
name  LIKE '%u%' AND 
name NOT LIKE '% %';

/* BBC QUIZ */

/* 1. Select the code which gives the name of countries beginning with U */
SELECT name
  FROM world
  WHERE name LIKE 'U%';

/* 2. Select the code which shows just the population of United Kingdom? */
SELECT population
  FROM world
  WHERE name = 'United Kingdom';

/* 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
 SELECT continent 
   FROM world 
  WHERE 'name' = 'France' */
'name' should be name

/* 4. Select the result that would be obtained from the following code:
 SELECT name, population / 10 
  FROM world 
 WHERE population < 10000 */
Nauru	990

/* 5. Select the code which would reveal the name and population of countries in Europe and Asia */
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia');

/* 6. Select the code which would give two rows */
SELECT name FROM world
  WHERE name IN ('Cuba', 'Togo');

/* 7. Select the result that would be obtained from this code: */
Brazil
Colombia

/* 3 SELECT from Nobel */

/* 1.
Change the query shown so that it displays Nobel prizes for 1950. */
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950;

/* 2.
Show who won the 1962 prize for Literature. */
SELECT winner
  FROM nobel
  WHERE yr = 1962
    AND subject = 'Literature';

/* 3.
Show the year and subject that won 'Albert Einstein' his prize. */
SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein';

/* 4.
Give the name of the 'Peace' winners since the year 2000, including 2000. */
SELECT winner
  FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

/* 5.
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */
SELECT yr, subject, winner
  FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

/* 6.
Show all details of the presidential winners:


Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama */
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

/* 7.
Show the winners with first name John */
SELECT winner
  FROM nobel
WHERE winner LIKE 'John%';

/* 8.
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */
SELECT * FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;

/* 9.
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */
SELECT * FROM nobel
WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine';

/* 10.
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */
SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

/* 11.
Find all details of the prize won by PETER GRÜNBERG

Non-ASCII characters */
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';

/* 12.
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes */
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL';

/* 13.
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. */
SELECT winner, yr, subject
  FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner ASC;

/* 14.
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */
SELECT winner, subject
  FROM nobel
  WHERE yr = 1984
  ORDER BY subject IN ('Physics','Chemistry'), subject, winner;

/* Nobel Quiz */

/* 1. Pick the code which shows the name of winner's names beginning with C and ending in n */
SELECT winner FROM nobel
  WHERE winner LIKE 'C%' AND winner LIKE '%n';

/* 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960 */
SELECT COUNT(subject) FROM nobel
  WHERE subject = 'Chemistry'
    AND yr BETWEEN 1950 and 1960;

/* 3. Pick the code that shows the amount of years where no Medicine awards were given */
SELECT COUNT(DISTINCT yr) FROM nobel
  WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

/* 4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%' */
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

/* 5. Select the code which would show the year when neither a Physics or Chemistry award was given */
SELECT yr FROM nobel
  WHERE yr NOT IN(SELECT yr
                    FROM nobel
                  WHERE subject IN ('Chemistry','Physics'));

/* 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was */
SELECT DISTINCT yr
  FROM nobel
  WHERE subject='Medicine'
    AND yr NOT IN(SELECT yr FROM nobel
                  WHERE subject='Literature')
    AND yr NOT IN (SELECT yr FROM nobel
                    WHERE subject='Peace');

/* 7. Pick the result that would be obtained from the following code:
  SELECT subject, COUNT(subject)
    FROM nobel
  WHERE yr ='1960'
  GROUP BY subject */
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1

/* 4 SELECT within SELECT */

/* 1.
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp) */
SELECT name FROM world
  WHERE population >
      (SELECT population FROM world
      WHERE name='Russia');

/* 2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Per Capita GDP */
SELECT name FROM world
WHERE continent = 'Europe' AND gdp / population >
(SELECT gdp / population FROM world WHERE name = 'United Kingdom');

/* 3.

List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */
SELECT name, continent FROM world
WHERE continent IN 
(SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name ASC;

/* 4.
Which country has a population that is more than Canada but less than Poland? Show the name and the population. */
SELECT name, population FROM world
WHERE population >
(SELECT name FROM world WHERE population > 'Canada' AND population < 'Poland');

/* 5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
Decimal places
Percent symbol % */
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world
WHERE name = 'Germany')*100), '%') FROM world WHERE continent = 'Europe';

/* 6.
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) */
SELECT name FROM world
WHERE gdp > ALL
(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

/* 7.
Find the largest country (by area) in each continent, show the continent, the name and the area: */
SELECT continent, name, area FROM world x
  WHERE area >= ALL
(SELECT area FROM world y WHERE x.continent = y.continent AND y.area>0);

/* 8.
List each continent and the name of the country that comes first alphabetically. */
SELECT continent, name FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);

/* 9.
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population. */
SELECT name, continent, population FROM world
WHERE continent IN
(SELECT continent FROM world  x
WHERE 25000000 >= (SELECT MAX(population) FROM world y
WHERE x.continent = y.continent));
or
SELECT y.name, y.continent, y.population
FROM world AS y
JOIN
(SELECT continent,max(population) FROM world
GROUP BY continent
HAVING max(population) <= 25000000) AS x
ON y.continent = x.continent;

/* 10.
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents. */
SELECT name, continent FROM world x
WHERE population > ALL(SELECT 3*population FROM world y WHERE x.continent = y.continent AND x.name <> y.name);

/* Nested SELECT Quiz */

/* 1. Select the code that shows the name, region and population of the smallest country in each region */
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);

/* 2. Select the code that shows the countries belonging to regions with all populations over 50000 */
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);

/* 3. Select the code that shows the countries with a less than a third of the population of the countries around it */
SELECT name, region FROM bbc x
  WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);

/* 4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
  WHERE population >
        (SELECT population
          FROM bbc
          WHERE name='United Kingdom')
    AND region IN
        (SELECT region
          FROM bbc
          WHERE name = 'United Kingdom') */
Table-D
France
Germany
Russia
Turkey

/* 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values). */
SELECT name FROM bbc
  WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

/* 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark */
SELECT name FROM bbc
  WHERE population < (SELECT population FROM bbc WHERE name='Russia')
    AND population > (SELECT population FROM bbc WHERE name='Denmark');

/* 7. >Select the result that would be obtained from the following code:
SELECT name FROM bbc
  WHERE population > ALL
        (SELECT MAX(population)
          FROM bbc
          WHERE region = 'Europe')
   AND region = 'South Asia' */
Table-B
Bangladesh
India
Pakistan

/* 5 SUM and COUNT */

/* 1.
Show the total population of the world.

world(name, continent, area, population, gdp) */
SELECT SUM(population)
FROM world;

/* 2.
List all the continents - just once each. */
SELECT DISTINCT(continent)
FROM world;

/* 3.
Give the total GDP of Africa */
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

/* 4.
How many countries have an area of at least 1000000 */
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

/* 5.
What is the total population of ('Estonia', 'Latvia', 'Lithuania') */
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

/* 6.
For each continent show the continent and number of countries. */
SELECT continent, COUNT(name)
FROM world
GROUP BY(continent);

/* 7.
For each continent show the continent and number of countries with populations of at least 10 million. */
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

/* 8.
List the continents that have a total population of at least 100 million. */
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

/* SUM and COUNT Quiz */

/* 1. Select the statement that shows the sum of population of all countries in 'Europe' */
SELECT SUM(population) FROM bbc WHERE region = 'Europe';

/* 2. Select the statement that shows the number of countries with population smaller than 150000 */
SELECT COUNT(name) FROM bbc WHERE population < 150000;

/* 3. Select the list of core SQL aggregate functions */
AVG(), COUNT(), MAX(), MIN(), SUM()

/* 4. Select the result that would be obtained from the following code:
  SELECT region, SUM(area)
    FROM bbc
  WHERE SUM(area) > 15000000
  GROUP BY region */
No result due to invalid use of the WHERE function

/* 5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark' */
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');

/* 6. Select the statement that shows the medium population density of each region */
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region;

/* 7. Select the statement that shows the name and population density of the country with the largest population */
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);

/* 8. Pick the result that would be obtained from the following code:
  SELECT region, SUM(area)
    FROM bbc
  GROUP BY region
  HAVING SUM(area)<= 20000000 */
Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710

/* 6 JOIN */

/* 1.
The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER' */
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';

/* 2.
From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.

Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.

Show id, stadium, team1, team2 for just game 1012 */
SELECT id, stadium, team1, team2
  FROM game
WHERE id = 1012;

/* 3.
You can combine the two steps into a single query with a JOIN.

SELECT *
  FROM game JOIN goal ON (id=matchid)
The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)

The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

Modify it to show the player, teamid, stadium and mdate for every German goal. */
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER';

/* 4.
Use the same JOIN as in the previous question.

Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%' */
SELECT team1, team2, player
  FROM game JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%';

/* 5.
The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10 */
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
  WHERE gtime <= 10;

/* 6.
To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach. */
SELECT mdate, teamname
FROM game JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos';

/* 7.
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw' */
SELECT player
FROM game JOIN goal ON matchid = id
WHERE stadium = 'National Stadium, Warsaw';

/* 8.
The example query shows all goals scored in the Germany-Greece quarterfinal.
Instead show the name of all players who scored a goal against Germany.

HINT */
SELECT DISTINCT player
FROM game JOIN goal ON (id = matchid)
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';

/* 9.
Show teamname and the total number of goals scored.
COUNT and GROUP BY */
SELECT teamname, COUNT(teamid)
FROM goal JOIN eteam ON (teamid = id)
GROUP BY teamname;

/* 10.
Show the stadium and the number of goals scored in each stadium. */
SELECT stadium, COUNT(*)
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium;

/* 11.
For every match involving 'POL', show the matchid, date and the number of goals scored. */
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = matchid)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid;

/* 12.
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER' */
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER'
GROUP BY matchid;

/* 13.
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
...
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2. */
SELECT mdate,
	  team1,
	  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
	  team2,
	  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
	game LEFT JOIN goal ON (id = matchid)
	GROUP BY id
	ORDER BY mdate, matchid, team1, team2;

/* JOIN Quiz */

/* 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use: */
game  JOIN goal ON (id=matchid);

/* 2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line: */
matchid, teamid, player, gtime, id, teamname, coach;

/* 3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE). */
SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id
  WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE' GROUP BY player, teamid;

/* 4. Select the result that would be obtained from this code:
SELECT DISTINCT teamid, mdate
  FROM goal JOIN game on (matchid=id)
  WHERE mdate = '9 June 2012' */
SELECT DISTINCT teamid, mdate FROM goal JOIN game on (matchid=id)
  WHERE mdate = '9 June 2012';

/* 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw. */
SELECT DISTINCT player, teamid FROM game JOIN goal ON matchid = id
  WHERE stadium = 'National Stadium, Warsaw' AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';

/* 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA). */
SELECT DISTINCT player, teamid, gtime FROM game JOIN goal ON matchid = id
  WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));

/* 7. Select the result that would be obtained from this code:
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON teamid = id
  GROUP BY teamname
HAVING COUNT(*) < 3 */
SELECT teamname, COUNT(*) FROM eteam
  JOIN goal ON teamid = id GROUP BY teamname HAVING COUNT(*) < 3;

/* 7 More JOIN operations */

/* 1.
List the films where the yr is 1962 [Show id, title] */
SELECT id, title
  FROM movie
WHERE yr = 1962;

/* 2.
Give year of 'Citizen Kane'. */
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

/* 3.
List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. */
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

/* 4.
What id number does the actor 'Glenn Close' have? */
SELECT id
FROM actor
WHERE name = 'Glenn Close';

/* 5.
What is the id of the film 'Casablanca' */
SELECT id
FROM movie
WHERE title = 'Casablanca';

/* 6.
Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question) */
SELECT actor.name
FROM actor JOIN casting
ON casting.actorid = actor.id
WHERE casting.movieid = 11768;

/* 7.
Obtain the cast list for the film 'Alien' */
SELECT actor.name
FROM actor JOIN casting ON casting.actorid = actor.id
JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Alien';

/* 8.
List the films in which 'Harrison Ford' has appeared */
SELECT movie.title
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford';

/* 9.
List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */
SELECT movie.title
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1;

/* 10.
List the films together with the leading star for all 1962 films. */
SELECT movie.title, actor.name
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE movie.yr = 1962 AND casting.ord = 1;

/* 11.
Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. */
SELECT movie.yr, COUNT(*)
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(movie.title) >= 2;

/* 12.
List the film title and the leading actor for all of the films 'Julie Andrews' played in.

Did you get "Little Miss Marker twice"? */
SELECT DISTINCT m.title, a.name
FROM (SELECT movie.*
      FROM movie
      JOIN casting
      ON casting.movieid = movie.id
      JOIN actor
      ON actor.id = casting.actorid
      WHERE actor.name = 'Julie Andrews') AS m
JOIN (SELECT actor.*, casting.movieid AS movieid
      FROM actor
      JOIN casting
      ON casting.actorid = actor.id
      WHERE casting.ord = 1) as a
ON m.id = a.movieid
ORDER BY m.title;

/* 13.
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */
SELECT actor.name
FROM actor JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15;

/* 14.
List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON movie.id = movieid WHERE yr = 1978
GROUP BY title ORDER BY COUNT(actorid) DESC, title;

/* 15.
List all the people who have worked with 'Art Garfunkel'. */
SELECT name FROM actor JOIN casting ON actor.id = actorid
WHERE movieid IN
  (SELECT id FROM movie WHERE title IN
    (SELECT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid IN
      (SELECT id FROM actor WHERE name = 'Art Garfunkel')))
  AND name != 'Art Garfunkel';

/* JOIN Quiz 2 */

/* 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget) */
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
  WHERE gross < budget;

/* 2. Select the correct example of JOINing three tables */
SELECT * FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid;

/* 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted */
SELECT name, COUNT(movieid) FROM casting JOIN actor ON actorid=actor.id
  WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;

/* 4. Select the result that would be obtained from the following code:
  SELECT title
    FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1 */
SELECT title FROM movie JOIN casting ON (movieid=movie.id)
  JOIN actor   ON (actorid=actor.id) WHERE name='Paul Hogan' AND ord = 1;

/* 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351 */
SELECT name FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351;

/* 6. There are two sensible ways to connect movie and actor. They are: */
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table

/* 7. Select the result that would be obtained from the following code:
  SELECT title, yr
    FROM movie, casting, actor
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3 */
SELECT title, yr FROM movie, casting, actor
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;

/* 8 Using Null */

/* 1.
List the teachers who have NULL for their department.

Why we cannot use = */
SELECT name
FROM teacher
WHERE dept IS NULL;

/* 2.
Note the INNER JOIN misses the teachers with no department and the departments with no teacher. */
SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
            ON (teacher.dept=dept.id);

/* 3.
Use a different JOIN so that all teachers are listed. */
SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
            ON (teacher.dept=dept.id);

/* 4.
Use a different JOIN so that all departments are listed. */
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id);

/* 5.
Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266' */
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id);

/* 6.
Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. */

/* 7.
Use COUNT to show the number of teachers and the number of mobile phones. */
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

/* 8.
Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. */
SELECT dept.name ,COUNT(teacher.name)
FROM teacher RIGHT OUTER JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

/* 9.
Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. */
SELECT teacher.name, 
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'
ELSE 'Art'
END
FROM teacher;

/* 10.
Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. */
SELECT teacher.name,
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'
WHEN teacher.dept = 3 THEN 'Art'
ELSE 'None'
END
FROM teacher;

/* Using Null Quiz */

/* 1. Select the code which uses an outer join correctly. */
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);

/* 2. Select the correct statement that shows the name of department which employs Cutflower - */
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';

/* 3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers */
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;

/* 4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will: */
SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher;

/* 5. Query:
SELECT name,
        CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher
shows following 'digit': */
SELECT name,
        CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher;

/* 6. Select the result that would be obtained from the following code:
SELECT name,
      CASE
        WHEN dept
        IN (1)
        THEN 'Computing'
        ELSE 'Other'
      END
  FROM teacher */
SELECT name,
      CASE
        WHEN dept
        IN (1)
        THEN 'Computing'
        ELSE 'Other'
      END
  FROM teacher;

/* 9 Self join */


