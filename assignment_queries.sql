DAY 04 ASSIGNMENT: PostgreSQL JOINS (dvdrental)
=====================================================
Instructions:
Write SQL queries to solve the problems below.
Use proper formatting and comments.


-----------------------------------------------------
Q1: List all customers along with their total payment amount.
Output: customer_id, full_name, total_amount


-----------------------------------------------------
Q2: Retrieve the top 10 customers by total amount spent.
Output: full_name, email, total_amount


-----------------------------------------------------
Q3: Display all films and their corresponding categories.
Tables: film, film_category, category


-----------------------------------------------------
Q4: Find the number of rentals made by each customer.
Output: customer_id, full_name, total_rentals


-----------------------------------------------------
Q5: List customers who have never made a payment.
Hint: LEFT JOIN


-----------------------------------------------------
Q6: Show total revenue generated per store.
Tables: store, staff, payment


-----------------------------------------------------
Q7: Identify the top 5 most rented movies.
Output: film_title, rental_count


-----------------------------------------------------
Q8 (BONUS): Find customers who rented more than 30 films.
Output: full_name, rental_count



-- SOLUTIONS


-----------------------------------------------------
Q1: List all customers along with their total payment amount.
Output: customer_id, full_name, total_amount
-----------------------------------------------------

-- ans 
SELECT c.customer_id, c.first_name || ' ' ||  c.last_name as full_name,=
       sum(p.amount) as total_amount
from customer c
inner join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_amount;


-----------------------------------------------------
Q2: Retrieve the top 10 customers by total amount spent.
Output: full_name, email, total_amount
-----------------------------------------------------
-- ans
SELECT 
    c.first_name || ' ' || c.last_name AS full_name,
    c.email,
    SUM(p.amount) AS total_amount
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY  c.first_name, c.last_name, c.email
ORDER BY total_amount DESC
FETCH FIRST 10 ROWS ONLY;


-----------------------------------------------------
-- Q3: Display all films and their corresponding categories.
--Tables: film, film_category, category
-----------------------------------------------------
-- ans
SELECT f.title, c.name
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id;
 
----------------------------------------------------------
-- Q4: Find the number of rentals made by each customer.
-- Output: customer_id, full_name, total_rentals
----------------------------------------------------------
-- ans 
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    COUNT(rn.rental_id) AS total_rentals
FROM customer c
INNER JOIN rental rn ON c.customer_id = rn.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

-----------------------------------------------------
-- Q5: List customers who have never made a payment.
-- Hint: LEFT JOIN
-----------------------------------------------------

-- ans 

SELECT 
    c.first_name || ' ' || c.last_name AS full_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.customer_id IS NULL;

-----------------------------------------------------
-- Q6: Show total revenue generated per store.
-- Tables: store, staff, payment
-----------------------------------------------------
-- ans
select st.store_id, 
      sum(p.amount) as total_revenue
from store st
inner join staff sf on st.store_id = sf.staff_id
inner join payment p on sf.staff_id = p.staff_id
group by  st.store_id
order by total_revenue desc;


-----------------------------------------------------
-- Q7: Identify the top 5 most rented movies.
-- Output: film_title, rental_count
-----------------------------------------------------
-- ans

select f.title as film_title, 
       count(rn.rental_id) as rental_count
from film f
inner join inventory inv on f.film_id = inv.film_id
inner join rental rn on  inv.inventory_id = rn.inventory_id
group by f.title
order by rental_count desc
fetch first 5 rows only;


 -----------------------------------------------------
-- Q8 (BONUS): Find customers who rented more than 30 films.
-- Output: full_name, rental_count
-----------------------------------------------------
-- ans
SELECT 
    c.first_name || ' ' || c.last_name AS full_name,
    COUNT(r.rental_id) AS rental_count
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 30
ORDER BY rental_count DESC;






