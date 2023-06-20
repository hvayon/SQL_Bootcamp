WITH andre_visits(pizzeria_name) AS (SELECT pz.name 
										FROM person_visits pv
										INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
										INNER JOIN person p ON pv.person_id = p.id
										WHERE p.name = 'Andrey'),
andre_orders(pizzeria_name) AS (SELECT pz.name FROM person_order po
									INNER JOIN person p ON po.person_id = p.id
									INNER JOIN menu m ON m.id = po.menu_id
									INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
									WHERE p.name = 'Andrey')
SELECT pizzeria_name from andre_visits
EXCEPT
SELECT pizzeria_name from andre_orders