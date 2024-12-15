-- Create Database
CREATE DATABASE library;
USE library;

-- Create Branch Table
CREATE TABLE Branch (
    Branch_no VARCHAR(10) PRIMARY KEY,
    Manager_Id VARCHAR(10),
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

-- Create Employee Table
CREATE TABLE Employee (
    Emp_Id VARCHAR(10) PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no VARCHAR(10),
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id VARCHAR(10) PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

-- Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id VARCHAR(10) PRIMARY KEY,
    Issued_cust VARCHAR(10),
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id VARCHAR(10) PRIMARY KEY,
    Return_cust VARCHAR(10),
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Query 1: Retrieve available books
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- Query 2: List employees by salary in descending order
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- Query 3: Books issued and their customers
SELECT b.Book_title, c.Customer_name 
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Query 4: Count of books in each category
SELECT Category, COUNT(*) AS Book_Count 
FROM Books 
GROUP BY Category;

-- Query 5: Employees with salary above 50,000
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- Query 6: Customers registered before 2022-01-01 with no book issues
SELECT c.Customer_name 
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- Query 7: Count of employees in each branch
SELECT Branch_no, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Branch_no;

-- Query 8: Customers who issued books in June 2023
SELECT DISTINCT c.Customer_name 
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

-- Query 9: Books with 'history' in title
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

-- Query 10: Branches with more than 5 employees
SELECT Branch_no, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

-- Query 11: Employees managing branches with branch addresses
SELECT e.Emp_name, b.Branch_address 
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

-- Query 12: Customers who issued books with rental price > 25
SELECT DISTINCT c.Customer_name 
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;