SELECT pz.name, count(m.pizzeria_id) AS count_of_orders, 
		CAST(ROUND(AVG(m.price), 2) AS float) AS average_price, 
		MAX(price) AS max_price,
       	MIN(price) AS min_price 
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY name;
