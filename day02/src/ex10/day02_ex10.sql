SELECT p1.NAME AS PERSON_NAME1,
	p2.NAME AS PERSON_NAME2,
	p1.ADDRESS AS COMMON_ADDRESS
FROM PERSON p1
INNER JOIN PERSON p2 ON p1.ADDRESS = p2.ADDRESS
WHERE p1.ID > p2.ID
ORDER BY 1, 2, 3;