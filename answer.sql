-- Number 1
select count(title) from film where lower(description) like '%astronaut%'

-- Number 2
select count(film_id) from film where rating = 'R' and replacement_cost between 5 and 15;

-- Number 3
select staff_id, count(payment_id), sum(amount)
from payment
group by 1

-- Number 4
select rating, avg(replacement_cost)
from film
group by 1

-- Number 5
select c.customer_id,concat(c.first_name,' ',c.last_name) as "full_name",c.email,p.amount
from payment p
left join customer c
on p.customer_id = c.customer_id
group by 1,4
order by 4 desc
limit 5

-- Number 6
select i.store_id,i.film_id,count(i.film_id),f.title
from inventory i 
left join film f
on f.film_id = i.film_id
group by 1,2,4

-- Number 7
with cnt_py as(
	select distinct(customer_id),count(customer_id) as cnt_pay
	from payment
	group by 1
)

select concat(c.first_name,' ',c.last_name) as "full_name",c.email,cnt_pay
from cnt_py p
left join customer c
on c.customer_id = p.customer_id
where cnt_pay >= 40
order by 3 desc