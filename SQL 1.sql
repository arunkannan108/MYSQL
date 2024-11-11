-- Create database
CREATE DATABASE School;

-- Use the School database
USE School;

-- Create table STUDENT
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks FLOAT,
    Grade CHAR(1)
);

-- Insert sample data
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'John Doe', 85.5, 'A'),
(2, 'Jane Smith', 92.0, 'A'),
(3, 'Mike Johnson', 78.5, 'B'),
(4, 'Sarah Williams', 95.0, 'A'),
(5, 'Robert Brown', 68.5, 'C');

-- 1. Display the table contents
SELECT * FROM STUDENT;

-- 2. Add Contact column
ALTER TABLE STUDENT
ADD COLUMN Contact VARCHAR(15);

-- Verify the new structure
SELECT * FROM STUDENT;

-- 3. Remove Grade column
ALTER TABLE STUDENT
DROP COLUMN Grade;

-- Verify the changed structure
SELECT * FROM STUDENT;

-- 4. Rename table to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

-- Verify the renamed table
SELECT * FROM CLASSTEN;

-- 5. Delete all rows (TRUNCATE)
TRUNCATE TABLE CLASSTEN;

-- Verify the empty table
SELECT * FROM CLASSTEN;

-- 6. Remove the table
DROP TABLE CLASSTEN;