SELECT PERSON_ID FROM PERSON_ORDER WHERE ORDER_DATE = '2022-01-07'
EXCEPT ALL
SELECT PERSON_ID FROM PERSON_VISITS WHERE VISIT_DATE = '2022-01-07';