SET enable_seqscan =OFF;

EXPLAIN ANALYSE
SELECT pizza_name, name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pz
ON m.pizzeria_id = pz.id;