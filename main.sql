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

/* 4 SELECT within SELECT */

/* 5 SUM and COUNT */

/* 6 JOIN */

/* 7 More JOIN operations */

/* 8 Using Null */

/* 8+ Numeric Examples */

/* 9- Window function */

/* 9+ COVID 19 */

/* 9 Self join */
