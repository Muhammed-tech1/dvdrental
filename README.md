DVD Rental SQL project
Project Overview

This project contains SQL queries written in PostgreSQL to solve a series of database problems to answer business questions
using the DVD Rental (dvdrental) sample database. The purpose is to strengthen core SQL skills such as joins, aggregation, filtering, 
and understanding relational database design.

The assignment covers the following problems:

Assignment Questions
Q1: List all customers along with their total payment amount

Output: customer_id, full_name, total_amount

Skills: SUM(), GROUP BY

Q2: Retrieve the top 10 customers by total amount spent

Output: full_name, email, total_amount

Skills: SUM(), GROUP BY, ORDER BY, LIMIT/FETCH

Q3: Display all films and their corresponding categories

Tables: film, film_category, category

Skills: INNER JOIN, many-to-many relationships

Q4: Find the number of rentals made by each customer

Output: customer_id, full_name, total_rentals

Skills: COUNT(), GROUP BY, joins

Q5: List customers who have never made a payment

Hint: LEFT JOIN

Skills: Anti-join logic, filtering with IS NULL

Q6: Show total revenue generated per store

Tables: store, staff, payment

Skills: Joins across multiple tables, aggregation

Q7: Identify the top 5 most rented movies

Output: film_title, rental_count

Skills: Bridge tables, aggregation, sorting, limiting

Q8 (BONUS): Find customers who rented more than 30 films

Output: full_name, rental_count

Skills: HAVING with aggregates, filtering high-activity customers

Key SQL Concepts Demonstrated

INNER JOIN and LEFT JOIN

Aggregation functions: COUNT(), SUM()

GROUP BY and HAVING

Sorting with ORDER BY

Using bridge tables to handle many-to-many relationships

Understanding foreign keys and schema relationships

Handling queries with no results properly

How to Use

Open pgAdmin or any PostgreSQL client.

Connect to the dvdrental database.

Open the Query Tool.

Copy and execute queries for each question.

Optionally, save all queries in a single file named dvdrental_assignment.sql.

Author

Name: (Muhammed Bello abdullahi)
Course: Computer Science / Data Science
Purpose: Academic Practice & Skill Development

Status

✅ Completed

Notes

Queries may return no rows depending on the dataset; this is expected.

Focus is on logic correctness rather than forcing output.

Happy querying 🚀
The project can be extended with subqueries, window functions, and views for deeper learning.

Happy querying 🚀
