INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
	VALUES(
		(SELECT max(id) + 1 FROM person_visits),
		(SELECT id FROM person WHERE name = 'Dmitriy'),
		(SELECT pz.id FROM pizzeria pz 
		 INNER JOIN menu m ON pz.id = m.pizzeria_id
		 WHERE price < 800 AND m.pizza_name != 'Papa Johns' ORDER BY 1 limit 1), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;