-- 1. Different types of JOINS

-- INNER JOIN
-- Shows only matching records from both tables
SELECT 
    p.Id AS Person_Id,
    p.Fname,
    p.Lname,
    c.Country_name,
    p.Population AS Person_Population,
    c.Population AS Country_Population
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;

-- LEFT JOIN (or LEFT OUTER JOIN)
-- Shows all records from Persons and matching records from Country
SELECT 
    p.Id AS Person_Id,
    p.Fname,
    p.Lname,
    c.Country_name,
    p.Population AS Person_Population,
    c.Population AS Country_Population
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

-- RIGHT JOIN (or RIGHT OUTER JOIN)
-- Shows all records from Country and matching records from Persons
SELECT 
    p.Id AS Person_Id,
    p.Fname,
    p.Lname,
    c.Country_name,
    p.Population AS Person_Population,
    c.Population AS Country_Population
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;

-- 2. List all distinct country names from both tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT c.Country_name 
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id
ORDER BY Country_name;

-- 3. List all country names including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT c.Country_name 
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id
ORDER BY Country_name;

-- 4. Round ratings to nearest integer
UPDATE Persons
SET Rating = ROUND(Rating);

-- Verify the rounded ratings
SELECT Id, Fname, Lname, Rating
FROM Persons
ORDER BY Id;