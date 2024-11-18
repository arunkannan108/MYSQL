-- Create Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area DECIMAL(10,2)
);

-- Create Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3,1),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert data into Country table
INSERT INTO Country VALUES
(1, 'USA', 1500000, 9833517),
(2, 'Canada', 800000, 9984670),
(3, 'UK', 700000, 242495),
(4, 'India', 2500000, 3287263),
(5, 'Australia', 600000, 7692024),
(6, 'China', 3000000, 9596961),
(7, 'Brazil', 1200000, 8515770),
(8, 'France', 900000, 551695),
(9, 'Germany', 1000000, 357022),
(10, 'Japan', 1100000, 377975);

-- Insert data into Persons table
INSERT INTO Persons VALUES
(1, 'John', 'Smith', NULL, 4.2, 1, 'USA'),
(2, 'Emma', 'Johnson', NULL, 4.7, 2, 'Canada'),
(3, 'William', 'Brown', NULL, 3.9, 3, 'UK'),
(4, 'Sophia', 'Davis', NULL, 4.8, 1, 'USA'),
(5, 'James', 'Wilson', NULL, 4.1, NULL, NULL),
(6, 'Oliver', 'Taylor', NULL, 4.6, 4, 'India'),
(7, 'Ava', 'Anderson', NULL, 3.8, 5, 'Australia'),
(8, 'Lucas', 'Thomas', NULL, 4.9, 2, 'Canada'),
(9, 'Isabella', 'Roberts', NULL, 4.3, NULL, NULL),
(10, 'Mason', 'Clark', NULL, 4.0, 3, 'UK');

-- 1. List distinct country names from Persons table
SELECT DISTINCT Country_name 
FROM Persons 
WHERE Country_name IS NOT NULL;

-- 2. Select first names and last names with aliases
SELECT Fname AS First_Name, Lname AS Last_Name 
FROM Persons;

-- 3. Find persons with rating > 4.0
SELECT * 
FROM Persons 
WHERE Rating > 4.0;

-- 4. Find countries with population > 10 lakhs (1,000,000)
SELECT * 
FROM Country 
WHERE Population > 1000000;

-- 5. Find persons from USA or rating > 4.5
SELECT * 
FROM Persons 
WHERE Country_name = 'USA' OR Rating > 4.5;

-- 6. Find persons where country name is NULL
SELECT * 
FROM Persons 
WHERE Country_name IS NULL;

-- 7. Find persons from USA, Canada, and UK
SELECT * 
FROM Persons 
WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8. Find persons not from India and Australia
SELECT * 
FROM Persons 
WHERE Country_name NOT IN ('India', 'Australia');

-- 9. Find countries with population between 5 lakhs and 20 lakhs
SELECT * 
FROM Country 
WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find countries whose names don't start with 'C'
SELECT * 
FROM Country 
WHERE Country_name NOT LIKE 'C%';