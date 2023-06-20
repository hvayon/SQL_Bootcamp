SELECT address, pz.name, COUNT(pz.name) AS count_of_orders
FROM person_order po
INNER JOIN person p ON p.id = po.person_id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY address, pz.name
ORDER BY address, pz.name;