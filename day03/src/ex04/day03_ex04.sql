WITH cte_man(pizzeria_name) as (SELECT 
	pz.name FROM pizzeria pz
	INNER JOIN menu m ON pz.id = m.pizzeria_id
	INNER JOIN person_order po on po.menu_id = m.id
	INNER JOIN person p on po.person_id = p.id
	WHERE p.gender = 'male'),
cte_woman(pizzeria_name) as (SELECT 
	pz.name FROM pizzeria pz
	INNER JOIN menu m ON pz.id = m.pizzeria_id
	INNER JOIN person_order po on po.menu_id = m.id
	INNER JOIN person p on po.person_id = p.id
	WHERE p.gender = 'female'),
cte_only_man AS (SELECT pizzeria_name 
				 FROM cte_man 
				 EXCEPT
				 SELECT pizzeria_name 
				 FROM cte_woman),
cte_only_woman AS (SELECT pizzeria_name 
				 FROM cte_woman 
				 EXCEPT
				 SELECT pizzeria_name 
				 FROM cte_man)
				
SELECT pizzeria_name 
FROM cte_only_man
UNION
SELECT pizzeria_name 
FROM cte_only_woman
ORDER BY pizzeria_name;
