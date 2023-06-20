WITH cte AS (
	SELECT m.pizza_name AS pizza_name, pz.name AS pizzeria_name, p.name
	FROM person_order
	LEFT JOIN person p ON p.id = person_id
	LEFT JOIN menu m ON m.id = menu_id
	LEFT JOIN pizzeria pz ON pz.id = pizzeria_id
	WHERE p.gender = 'female'
)
SELECT name
FROM cte
WHERE pizza_name = 'cheese pizza' AND name IN (SELECT name FROM cte WHERE pizza_name = 'pepperoni pizza')
ORDER BY name;