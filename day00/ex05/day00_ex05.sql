SELECT
	(SELECT NAME FROM PERSON WHERE ID = PERSON_ORDER.PERSON_ID) AS NAME
FROM PERSON_ORDER
WHERE MENU_ID in (13, 14, 18)
	AND ORDER_DATE = '2022-01-07'