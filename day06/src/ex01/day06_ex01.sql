INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
ROW_NUMBER( ) OVER ( ) AS id, person_id, m.pizzeria_id,
CASE WHEN COUNT(person_order.person_id) = 1 THEN 10.5
	 WHEN COUNT(person_order.person_id) = 2 THEN 22
	 ELSE 30
END AS discount
FROM person_order
INNER JOIN menu m ON person_order.menu_id = m.id
GROUP BY person_id, m.pizzeria_id;