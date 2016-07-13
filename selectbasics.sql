---SELECT basics---Challenge 1


SELECT basics
Language:	English  • Deutsch • 中文
name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Albania	Europe	28748	2831741	12960000000
Algeria	Africa	2381741	37100000	188681000000
Andorra	Europe	468	78115	3712000000
Angola	Africa	1246700	20609294	100990000000
....
Introducing the world table of countries
This tutorial introduces SQL. We will be using the SELECT command on the table world:

Summary
1.
The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

Modify it to show the population of Germany


SELECT population FROM world
  WHERE name = 'Germany'
Submit SQLRestore default
Correct answer
population
80716000
Scandinavia
2.
Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Luxembourg', 'Mauritius' and 'Samoa'.

Show the name and the population for 'Ireland', 'Iceland' and 'Denmark'.


SELECT name, population FROM world
  WHERE name IN ('Ireland', 'Iceland', 'Denmark');
Submit SQLRestore default
Correct answer
name	population
Denmark	5634437
Iceland	326340
Ireland	4593100
SELECT Quiz
Try the regular expressions game.
You are ready for tutorial one:SELECT statements with WHERE.


Language:	English  • Deutsch • 中文
Just the right size
3.
Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.


SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
Submit SQLRestore default

Correct answer
name	area
Belarus	207600
Ghana	238533
Guinea	245857
Guyana	214969
Laos	236800
Romania	238391
Uganda	241550
United Kingdom	242900

You are ready for tutorial one:SELECT statements with WHERE.


Language:	English  • Deutsch • 中文
SELECT names
Language:	English  • 中文
name	continent
Afghanistan	Asia
Albania	Europe
Algeria	Africa
Andorra	Europe
Angola	Africa
....

Pattern Matching Strings
This tutorial uses the LIKE operator to check names. We will be using the SELECT command on the table world:

Summary
1.
You can use WHERE name LIKE 'B%' to find the countries that start with "B".

The % is a wild-card it can match any characters
Find the country that start with Y


SELECT name FROM world
  WHERE name LIKE 'Y%'
Submit SQLRestore default
Correct answer
name
Yemen

2.
Find the countries that end with y


SELECT name FROM world
  WHERE name LIKE '%y'
Submit SQLRestore default
Correct answer
name
Turkey
Germany
Hungary
Italy
Norway
Vatican City
Paraguay
Uruguay
3.
Luxembourg has an x - so does one other country. List them both.

Find the countries that contain the letter x


SELECT name FROM world
  WHERE name LIKE '%x%'
Submit SQLRestore default
Correct answer
name
Luxembourg
Mexico
4.
Iceland, Switzerland end with land - but are there others?

Find the countries that end with land


SELECT name FROM world
  WHERE name LIKE '%land'
Submit SQLRestore default
Correct answer
name
Swaziland
Thailand
Finland
Iceland
Ireland
Poland
Switzerland
New Zealand
5.
Columbia starts with a C and ends with ia - there are two more like this.

Find the countries that start with C and end with ia


SELECT name FROM world
  WHERE name LIKE 'C%ia'
Submit SQLRestore default
Correct answer
name
Cambodia
Colombia
Croatia
6.
Greece has a double e - who has a double o?

Find the country that has oo in the name


SELECT name FROM world
  WHERE name LIKE '%oo%'
Submit SQLRestore default
Correct answer
name
Cameroon
7.
Bahamas has three a - who else?

Find the countries that have three or more a in the name


SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
Submit SQLRestore default
Correct answer
name
Central African Republic
Equatorial Guinea
Madagascar
Mauritania
Tanzania
Afghanistan
Azerbaijan
Malaysia
Saudi Arabia
United Arab Emirates
Antigua and Barbuda
Bahamas
Jamaica
Trinidad and Tobago
Albania
Bosnia and Herzegovina
Kazakhstan
Canada
Guatemala
Nicaragua
Panama
Australia
Marshall Islands
Micronesia, Federated States of
Papua New Guinea
Paraguay
Saint Vincent and the Grenadines
8.
India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

SELECT name FROM world
 WHERE name LIKE '_n%'
ORDER BY name
Find the countries that have "t" as the second character.


SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
Submit SQLRestore default
Correct answer
name
Ethiopia
Italy
9.
Lesotho and Moldova both have two o characters separated by two other characters.

Find the countries that have two "o" characters separated by two others.


SELECT name FROM world
 WHERE name LIKE '%o__o%'
Submit SQLRestore default
Correct answer
name
Congo, Democratic Republic of
Congo, Republic of
Lesotho
Morocco
Sao Tomé and Príncipe
Mongolia
10.
Cuba and Togo have four characters names.

Find the countries that have exactly four characters.


SELECT name FROM world
 WHERE name LIKE '____'
Submit SQLRestore default
Correct answer
name
Chad
Mali
Togo
Iran
Iraq
Laos
Oman
Cuba
Fiji
Peru
Harder Questions
Well done for getting this far.

The next questions are optional and only for students who are finding the basic questions too easy.

11.
The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

Find the country where the name is the capital city.


SELECT name
  FROM world
 WHERE name = capital;
Submit SQLRestore default
Correct answer
name
Djibouti
Luxembourg
San Marino
Singapore
12.
The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".

Find the country where the capital is the country plus "City".

The concat function

SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

Submit SQLRestore default
Correct answer
name
Guatemala
Kuwait
Mexico
Panama

-- # 1. List each country name where the population is larger than
-- # 'Russia'.
SELECT name
FROM world
WHERE population > (
  SELECT population
  FROM world
  WHERE name = 'Russia');

-- # 2. List the name and continent of countries in the continents
-- # containing 'Belize', 'Belgium'.
SELECT name, continent
FROM world
WHERE continent IN (
  SELECT continent 
  FROM world
  WHERE name IN ('Belize', 'Belgium'));

-- # 3. Show the countries in Europe with a per capita GDP greater than
-- # 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');

-- # 4. Which country has a population that is more than Canada but
-- # less than Poland? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (
  SELECT population
  FROM world
  WHERE name = 'Canada')
AND population < (
  SELECT population
  FROM world
  WHERE name = 'Poland');

-- # 5. Which countries have a GDP greater than any country in Europe?
-- # [Give the name only.]
SELECT name
FROM world
WHERE gdp > (
  SELECT MAX(gdp)
  FROM world
  WHERE continent = 'Europe');

-- # 6. Find the largest country (by area) in each continent, show the 
-- # continent, the name and the area.
SELECT x.continent, x.name, x.area
FROM world AS x
WHERE x.area = (
  SELECT MAX(y.area)
  FROM world AS y
  WHERE x.continent = y.continent)

-- # 7. Find each country that belongs to a continent where all
-- # populations are less than 25000000. Show name, continent and
-- # population.
SELECT x.name, x.continent, x.population
FROM world AS x
WHERE 25000000 > ALL (
  SELECT y.population
  FROM world AS y
  WHERE x.continent = y.continent);

-- # 8. Some countries have populations more than three times that of
-- # any of their neighbours (in the same continent). Give the
-- # countries and continents.
SELECT x.name, x.continent
FROM world AS x
WHERE x.population/3 > ALL (
  SELECT y.population
  FROM world AS y
  WHERE x.continent = y.continent
  AND x.name != y.name);

--1. Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 --2. Show who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

--3. Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';

--4. Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000;

--5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT * FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;

--6. Show all details of the presidential winners

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter');

--7. Show the winners with first name John

SELECT winner FROM nobel WHERE winner LIKE 'John%';

--8. Show the Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;

--9. Show the winners for 1980 excluding the Chemistry and Medicine

SELECT * FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

--10. Show who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT * FROM nobel WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

--11. Find all details of the prize won by PETER GRÜNBERG

SELECT * FROM nobel WHERE winner = 'Peter Grünberg';

--12.Find all details of the prize won by EUGENE O'NEILL

SELECT * FROM nobel WHERE winner = 'Eugene O''Neill';

--13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

Select winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner;

--14. Show the 1984 winners ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject, subject IN ('Physics','Chemistry')
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner;
 ---SUM AND COUNT
- 1. Show the total population of the world.
SELECT SUM(population) pop_world
FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT continent
FROM world

-- 3. Give the total GDP of Africa
SELECT SUM(gdp) gdp_Africa
FROM world
WHERE continent = 'Africa'

-- 4. How many countries have an area of at least 1000000
SELECT COUNT(name) num_countries
FROM world
WHERE area >= 1000000

-- 5. What is the total population of ('France','Germany','Spain')
SELECT SUM(population) total_pop
FROM world
WHERE name IN ('France','Germany','Spain')

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name) num_countries
FROM world
GROUP BY continent

-- 7. For each continent show the continent and number of countries with
-- populations of at least 10 million.
SELECT continent, COUNT(name) num_countries
FROM world
WHERE population >= 10E6
GROUP BY continent

-- 8. List the continents with total populations of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100E6
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help
