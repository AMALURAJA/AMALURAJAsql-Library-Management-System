### AMALURAJAsql-Library-Management-System
## A SQL-based database project to manage library operations, including books, employees, customers, and branches. Includes 6 tables and 12 queries for various use cases.

### Library Management System SQL Queries

A collection of SQL queries for managing a library database.

# Database Schema

The database schema consists of 6 tables:

1. Branch
2. Employee
3. Books
4. Customer
5. IssueStatus
6. ReturnStatus

# Queries

The repository includes 12 SQL queries addressing various use cases:

1. Retrieve available books
2. List employee names and salaries
3. Retrieve book titles and corresponding customers
4. Display total count of books in each category
5. Retrieve employee names and positions with salary above Rs.50,000
6. List customer names who registered before 2022-01-01 and have not issued any books
7. Display branch numbers and total count of employees
8. Display customer names who issued books in June 2023
9. Retrieve book_title containing 'history'
10. Retrieve branch numbers with count of employees for branches having more than 5 employees
11. Retrieve employee names who manage branches and their respective branch addresses
12. Display customer names who issued books with rental price higher than Rs. 25

# Usage

1. Create a database named "Library" in your DBMS.
2. Run the SQL script (library.sql) to create the database schema and populate with sample data.
3. Execute the provided SQL queries to retrieve desired information.
