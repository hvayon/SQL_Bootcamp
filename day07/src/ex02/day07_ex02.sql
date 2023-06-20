  WITH cte_visits AS (SELECT name, COUNT(person_id) AS count, 'visit' AS action_type
                   	FROM person_visits pv
					INNER JOIN pizzeria pz
					ON pv.pizzeria_id = pz.id
                  GROUP BY name
                  ORDER BY count DESC
                  LIMIT 3),
       cte_orders AS (SELECT name, COUNT(person_id) AS count, 'order' AS action_type
                   	FROM person_order po
					INNER JOIN menu m
					ON po.menu_id = m.id
					INNER JOIN pizzeria pz
					ON pz.id = m.pizzeria_id
                  GROUP BY name
                  ORDER BY count DESC
                  LIMIT 3)
				  
SELECT * FROM cte_visits
UNION
SELECT * FROM cte_orders
ORDER BY action_type, count DESC;