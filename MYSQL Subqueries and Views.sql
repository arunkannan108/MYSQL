SELECT 
    c.CountryName, 
    COUNT(p.PersonID) AS NumberOfPersons
FROM 
    Country c
LEFT JOIN 
    Persons p ON c.CountryID = p.CountryID
GROUP BY 
    c.CountryName;
    SELECT 
    c.CountryName, 
    COUNT(p.PersonID) AS NumberOfPersons
FROM 
    Country c
LEFT JOIN 
    Persons p ON c.CountryID = p.CountryID
GROUP BY 
    c.CountryName
ORDER BY 
    NumberOfPersons DESC;
    SELECT 
    c.CountryName, 
    AVG(p.Rating) AS AverageRating
FROM 
    Country c
JOIN 
    Persons p ON c.CountryID = p.CountryID
GROUP BY 
    c.CountryName
HAVING 
    AVG(p.Rating) > 3.0;
    SELECT 
    CountryName
FROM 
    Country
WHERE 
    Rating = (
        SELECT Rating 
        FROM Country 
        WHERE CountryName = 'USA'
    );
    SELECT 
    CountryName, 
    Population
FROM 
    Country
WHERE 
    Population > (
        SELECT AVG(Population) 
        FROM Country
    );
    CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(20),
    Country VARCHAR(50)
);
CREATE VIEW customer_info AS
SELECT 
    Customer_Id, 
    First_name + ' ' + Last_name AS Full_Name, 
    Email
FROM 
    Customer;

-- Select from the view
SELECT * FROM customer_info;
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'United States';
CREATE VIEW Customer_details AS
SELECT 
    Customer_Id,
    First_name + ' ' + Last_name AS Full_Name,
    Email,
    Phone_no,
    State
FROM 
    Customer;
    UPDATE Customer
SET Phone_no = '(CA) ' + Phone_no
WHERE State = 'California';
SELECT 
    State, 
    COUNT(*) AS CustomerCount
FROM 
    Customer
GROUP BY 
    State
HAVING 
    COUNT(*) > 5;
    SELECT 
    State, 
    COUNT(*) AS CustomerCount
FROM 
    Customer_details
GROUP BY 
    State;
    SELECT *
FROM Customer_details
ORDER BY State ASC;