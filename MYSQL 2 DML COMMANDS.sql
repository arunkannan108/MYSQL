-- 1. Create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age > 0),
    Last_update TIMESTAMP NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary > 0)
);

-- 2. Insert 10 rows
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary)
VALUES
    (1, 'John', 'Doe', '1980-05-15', 42, CURRENT_TIMESTAMP, 'Male', 'IT', 50000.00),
    (2, 'Jane', 'Smith', '1985-09-20', 37, CURRENT_TIMESTAMP, 'Female', 'Finance', 45000.00),
    (3, 'Michael', 'Johnson', '1978-02-10', 44, CURRENT_TIMESTAMP, 'Male', 'HR', 40000.00),
    (4, 'Sarah', 'Williams', '1990-11-30', 32, CURRENT_TIMESTAMP, 'Female', 'Sales', 35000.00),
    (5, 'David', 'Brown', '1982-06-05', 40, CURRENT_TIMESTAMP, 'Male', 'Marketing', 55000.00),
    (6, 'Emily', 'Davis', '1988-03-25', 34, CURRENT_TIMESTAMP, 'Female', 'IT', 48000.00),
    (7, 'Robert', 'Anderson', '1975-12-01', 47, CURRENT_TIMESTAMP, 'Male', 'Finance', 42000.00),
    (8, 'Jessica', 'Thompson', '1992-08-15', 30, CURRENT_TIMESTAMP, 'Female', 'HR', 38000.00),
    (9, 'Daniel', 'Wilson', '1983-04-20', 39, CURRENT_TIMESTAMP, 'Male', 'Sales', 52000.00),
    (10, 'Aaliya', 'Ahmed', '1987-09-10', 35, CURRENT_TIMESTAMP, 'Female', 'Marketing', 30000.00);

-- 3. Retrieve the name and date of birth of the manager with Manager_Id 1
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

-- 4. Display the annual income of all managers
SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;

-- 5. Display records of all managers except 'Aaliya'
SELECT *
FROM Managers
WHERE First_name <> 'Aaliya';

-- 6. Display details of managers whose department is IT and earns more than 25000 per month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

-- 7. Display details of managers whose salary is between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;