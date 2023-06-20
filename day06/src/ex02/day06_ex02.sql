SELECT p.name, m.pizza_name, m.price, CAST((m.price - (m.price * pd.discount/100)) as float) AS discount_name,
pz.name AS pizzeria_name FROM person_order po
INNER JOIN person p ON po.person_id = p.id
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
INNER JOIN person_discounts pd ON p.id = pd.person_id AND pz.id = pd.pizzeria_id
ORDER BY name, pizza_name;