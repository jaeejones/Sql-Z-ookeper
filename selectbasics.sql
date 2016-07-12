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
