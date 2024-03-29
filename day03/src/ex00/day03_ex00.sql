SELECT PIZZA_NAME, PRICE, PZ.NAME AS PIZZERIA_NAME, VISIT_DATE
FROM PERSON_VISITS PV
INNER JOIN PIZZERIA PZ ON PV.PIZZERIA_ID = PZ.ID
INNER JOIN MENU M ON M.PIZZERIA_ID = PZ.ID
INNER JOIN PERSON PR ON PV.PERSON_ID = PR.ID
WHERE PR.NAME = 'Kate'
	AND PRICE BETWEEN 800 AND 1000;