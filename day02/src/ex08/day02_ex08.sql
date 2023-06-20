SELECT NAME
FROM PERSON_ORDER PO
INNER JOIN PERSON P ON PO.PERSON_ID = P.ID
INNER JOIN MENU M ON M.ID = PO.MENU_ID
WHERE GENDER = 'male'
	AND ADDRESS IN ('Moscow','Samara')
	AND PIZZA_NAME IN ('pepperoni pizza','mushroom pizza')
ORDER BY NAME DESC;