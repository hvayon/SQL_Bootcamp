SELECT FORMAT('%s (age:%s,gender:''%s'',address:''%s'')',

								NAME,
								AGE,
								GENDER,
								ADDRESS) PERSON_INFORMATION
FROM PERSON
ORDER BY PERSON_INFORMATION