-- Create database
CREATE DATABASE Library;

-- Use database
USE Library;

-- 1. Branch table
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(15)
);

-- 2. Employee table
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(100),
  Position VARCHAR(100),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Books table
CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(100),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(5),
  Author VARCHAR(100),
  Publisher VARCHAR(100)
);

-- 4. Customer table
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(100),
  Customer_address VARCHAR(255),
  Reg_date DATE
);

-- 5. IssueStatus table
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. ReturnStatus table
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Queries:

-- 1. Retrieve available books
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2. List employee names and salaries
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Retrieve book titles and corresponding customers
SELECT Issued_book_name, Customer_name 
FROM IssueStatus 
JOIN Customer 
ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display total count of books in each category
SELECT Category, COUNT(*) 
FROM Books 
GROUP BY Category;

-- 5. Retrieve employee names and positions with salary above Rs.50,000
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- 6. List customer names who registered before 2022-01-01 and have not issued any books
SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display branch numbers and total count of employees
SELECT Branch_no, COUNT(*) 
FROM Employee 
GROUP BY Branch_no;

-- 8. Display customer names who issued books in June 2023
SELECT Customer_name 
FROM IssueStatus 
JOIN Customer 
ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book titles containing 'history'
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

-- 10. Retrieve branch numbers with count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

-- 11. Retrieve employee names who manage branches and their respective branch addresses
SELECT Emp_name, Branch_address 
FROM Employee 
JOIN Branch 
ON Employee.Branch_no = Branch.Branch_no 
WHERE Position = 'Manager';

-- 12. Display customer names who issued books with rental price higher than Rs. 25
SELECT Customer_name 
FROM IssueStatus 
JOIN Customer 
ON IssueStatus.Issued_cust = Customer.Customer_Id 
JOIN Books 
ON IssueStatus.Isbn_book = Books.ISBN 
WHERE Rental_Price > 25;