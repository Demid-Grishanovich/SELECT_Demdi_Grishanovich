SELECT s.store_id, st.staff_id, st.first_name, st.last_name, SUM(p.amount) AS total_revenue
FROM payment AS p
JOIN rental AS r ON p.rental_id = r.rental_id
JOIN staff AS st ON p.staff_id = st.staff_id
JOIN store AS s ON st.store_id = s.store_id
WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
GROUP BY s.store_id, st.staff_id, st.first_name, st.last_name
ORDER BY s.store_id, total_revenue DESC;


SELECT f.title, COUNT(r.rental_id) AS rental_count, f.rating
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2017
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;


SELECT a.actor_id, a.first_name, a.last_name, MAX(f.release_year) AS last_film_year
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY last_film_year ASC
LIMIT 5;