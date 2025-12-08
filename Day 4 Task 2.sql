USE world;


SELECT * FROM city 
WHERE name LIKE'%New%'
;


SELECT * FROM city
WHERE Population >2000000
;


SELECT * FROM city 
WHERE name LIKE'Be%'
;


SELECT * FROM city
WHERE Population BETWEEN 500000 AND 1000000
;


SELECT * FROM city
WHERE CountryCode ='USA'
;


SELECT * FROM country
WHERE LifeExpectancy >78
;
  
  
SELECT * FROM city
WHERE Population >6000000
LIMIT 10
;

SELECT * FROM `city`
ORDER BY `name` ASC
;

SELECT * FROM `city`
WHERE `Population` >6000000
ORDER BY `Population` DESC
LIMIT 5
;


SELECT DISTINCT(`District`), COUNT(1) FROM `city` GROUP BY `District`
LIMIT 2000
;


SELECT * FROM `city`
WHERE `Population` IS NOT NULL
ORDER BY `Population` ASC
;

SELECT * FROM `Country`
WHERE `Population` IS NOT NULL
ORDER BY `Population` DESC
;


SELECT *
FROM city
JOIN country ON city.ID = country.Capital
WHERE country.Code = 'ESP'
;

SELECT
	`Name`,
    `Population`,
    (SELECT AVG(`Population`) FROM `country`) AS 'AVG World Population'
FROM 
	`country`
    ;
    

SELECT code AS `Country`,
    city.name AS `Capital City`,
    city.population
FROM 
    `country`
JOIN 
    `city` ON country.Capital = city.ID
WHERE 
    city.population IS NOT NULL
ORDER BY 
    city.population DESC
    ;


SELECT 
    city.Name AS `City`,
    city.Population,
    country.Name AS `Country`,
    country.Code AS `Country Code`,
    country.Continent
FROM 
    `city`
JOIN 
    `country` ON city.CountryCode = country.Code
WHERE 
    country.Continent = 'Europe'
ORDER BY 
    city.Population DESC
    ;
    
    
    SELECT `Code`, `Name`, `SurfaceArea`, `Population`,
    (`Population` / `SurfaceArea`) AS `Population Density`
FROM 
    `country`
WHERE 
    `Population` > 0 AND
    (`Population` / `SurfaceArea`) < 50
ORDER BY 
    `Population Density` ASC
    ;

    
    SELECT `ID`, `Name`, `CountryCode`, `Population`, `GDP`,
    (`GDP` / `Population`) AS `GDPPerCapita`
FROM 
    `city`
WHERE 
    `Population` > 0 AND (`GDP` / `Population`) > (
        SELECT AVG(`GDP` / `Population`)
        FROM `city`
        WHERE `Population` > 0
    )
ORDER BY 
    `GDPPerCapita` DESC
    ;

    
SELECT city.name AS `City`, country.Name AS `Country`, country.Population, `GNP`,
    ROUND(GNP / country.Population, 2) AS `GNP per Capita`,
    (SELECT 
		ROUND(AVG(GNP / country.Population), 2) 
        FROM country
        ) 
        AS `Average GNP per Capita`
FROM 
	`country`
JOIN
	`city` on country.code = city.countrycode
WHERE 
	(GNP / country.Population) > (
		SELECT AVG(GNP / country.Population)
		FROM country)
ORDER BY 
	`GNP per Capita` DESC
    ;    
    


SELECT RANK() OVER (ORDER BY `Population` DESC) AS `Ranking`,
city.name AS `City`, `CountryCode`, `Population`
FROM 
    `city`
WHERE
	`Population` IS NOT NULL
ORDER BY 
    `Population` DESC
LIMIT 10 OFFSET 30
;



 