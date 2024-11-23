-- Create Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

-- Create Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert data into Country table
INSERT INTO Country VALUES
(1, 'India', 1380004385, 3287263),
(2, 'China', 1439323776, 9596961),
(3, 'USA', 331002651, 9833517),
(4, 'Brazil', 212559417, 8515770),
(5, 'Japan', 126476461, 377975),
(6, 'Canada', 37742154, 9984670),
(7, 'France', 65273511, 551695),
(8, 'Germany', 83783942, 357114),
(9, 'Australia', 25499884, 7692024),
(10, 'Italy', 60461826, 301340);

-- Insert data into Persons table
INSERT INTO Persons VALUES
(1, 'John', 'Smith', 25000, 4.5, 3),
(2, 'Maria', 'Garcia', 30000, 4.8, 4),
(3, 'Yuki', 'Tanaka', 15000, 4.2, 5),
(4, 'Hans', 'Mueller', 28000, 4.6, 8),
(5, 'Sophie', 'Martin', 22000, 4.3, 7),
(6, 'Li', 'Wei', 35000, 4.9, 2),
(7, 'Raj', 'Patel', 27000, 4.4, 1),
(8, 'Anna', 'Kowalski', 20000, 4.1, 8),
(9, 'Paolo', 'Rossi', 18000, 4.7, 10),
(10, 'James', 'Wilson', 32000, 4.0, 3);

-- 1. First three characters of Country_name
SELECT LEFT(Country_name, 3) AS Country_prefix
FROM Country;

-- 2. Concatenate first name and last name
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- 3. Count unique country names
SELECT COUNT(DISTINCT Country_Id) AS Unique_Countries
FROM Persons;

-- 4. Maximum population from Country table
SELECT MAX(Population) AS Max_Population
FROM Country;

-- 5. Minimum population from Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

-- 6. Insert rows with NULL Lname and count Lname
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES 
(11, 'David', NULL, 28000, 4.2, 3),
(12, 'Emma', NULL, 25000, 4.5, 7);

SELECT COUNT(Lname) AS Non_Null_Lname_Count
FROM Persons;

-- 7. Count total rows in Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- 8. First 3 rows of population from Country table
SELECT Population
FROM Country
LIMIT 3;

-- 9. Random 3 countries
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;

-- 10. Persons ordered by rating desc
SELECT *
FROM Persons
ORDER BY Rating DESC;

-- 11. Total population by country
SELECT c.Country_name, SUM(p.Population) AS Total_Population
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id
GROUP BY c.Country_name;

-- 12. Countries with total population > 50,000
SELECT c.Country_name, SUM(p.Population) AS Total_Population
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id
GROUP BY c.Country_name
HAVING Total_Population > 50000;

-- 13. Countries with more than 2 persons, showing average rating
SELECT 
    c.Country_name,
    COUNT(*) AS Number_of_Persons,
    AVG(p.Rating) AS Average_Rating
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id
GROUP BY c.Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;