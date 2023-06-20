WITH cte_man(pizzeria_name) as (SELECT 
	pz.name FROM person_visits pv
	INNER JOIN person p on pv.person_id = p.id
	INNER JOIN pizzeria pz on pv.pizzeria_id = pz.id
	WHERE p.gender = 'male'),
cte_woman(pizzeria_name) as (SELECT 
	pz.name FROM person_visits pv
	INNER JOIN person p on pv.person_id = p.id
	INNER JOIN pizzeria pz on pv.pizzeria_id = pz.id
	WHERE p.gender = 'female'),
cte_only_man AS (SELECT pizzeria_name 
				 FROM cte_man 
				 EXCEPT ALL
				 SELECT pizzeria_name 
				 FROM cte_woman),
cte_only_woman AS (SELECT pizzeria_name 
				 FROM cte_woman 
				 EXCEPT ALL
				 SELECT pizzeria_name 
				 FROM cte_man)
				
SELECT pizzeria_name 
FROM cte_only_man
UNION ALL
SELECT pizzeria_name 
FROM cte_only_woman
ORDER BY pizzeria_name;






	

