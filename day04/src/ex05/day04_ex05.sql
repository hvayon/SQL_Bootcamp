CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, CAST(round(price - (price * 0.1)) AS int) AS discount_price
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN person p ON p.id = po.person_id
ORDER BY name, pizza_name;