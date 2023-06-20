 WITH cte(not_order) AS (SELECT id AS menu_id
                                      FROM menu
                                    EXCEPT
                                    SELECT menu_id
                                      FROM person_order
                                     ORDER BY menu_id)

SELECT pizza_name, price, name AS pizzeria_name FROM menu m 
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
INNER JOIN cte ON not_order = m.id
ORDER BY 1, 2