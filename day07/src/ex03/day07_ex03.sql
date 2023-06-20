  WITH cte_visits AS (SELECT name, COUNT(person_id) AS count, 'visit' AS action_type
                   	FROM person_visits pv
					INNER JOIN pizzeria pz
					ON pv.pizzeria_id = pz.id
                  GROUP BY name
                  ORDER BY count DESC),
       cte_orders AS (SELECT name, COUNT(person_id) AS count, 'order' AS action_type
                   	FROM person_order po
					INNER JOIN menu m
					ON po.menu_id = m.id
					INNER JOIN pizzeria pz
					ON pz.id = m.pizzeria_id
                  GROUP BY name
                  ORDER BY count DESC)
				  
SELECT pizzeria.name, COALESCE(cte_visits.count, 0) + COALESCE(cte_orders.count, 0) as total_count
FROM pizzeria
FULL JOIN cte_orders ON cte_orders.name = pizzeria.name
FULL JOIN cte_visits ON cte_visits.name = pizzeria.name
ORDER BY total_count DESC, name;