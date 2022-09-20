--1. List all customers who live in Texas (use JOINs)
select first_name, last_name 
from customer
left join address
on customer.address_id = address.address_id
where district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
full join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in(
	select customer_id 
	from payment
	where amount > 175
)

--4. List all customers that live in Nepal (use the city table)
select first_name, last_name
from customer
left join address
on customer.address_id = address.address_id
left join city
on address.city_id = city.city_id
left join country
on city.country_id = country.country_id 
where country = 'Nepal'

--5. Which staff member had the most transactions? 
--ANSWER: Jon Stephens
select payment.staff_id, count(payment.staff_id), staff.first_name, staff.last_name
from payment
full join staff
on payment.staff_id = staff.staff_id 
group by payment.staff_id, staff.first_name, staff.last_name 

--6. How many movies of each rating are there?
select rating, count(rating) 
from film
group by rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment
	where amount > 6.99 
	group by customer_id, amount
	having count(customer_id) = 1
)

--8. How many rentals did our stores give away?
select count(rental_id)
from rental