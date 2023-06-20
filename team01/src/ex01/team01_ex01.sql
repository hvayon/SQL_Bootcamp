insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH t AS(
SELECT		
	COALESCE((SELECT rate_to_usd
						FROM currency AS c 
					 	WHERE b.currency_id = c.id AND c.updated < b.updated 
					 	ORDER BY c.updated DESC 
					 	LIMIT 1),
					(SELECT rate_to_usd
						FROM currency AS c 
					 	WHERE b.currency_id = c.id AND c.updated > b.updated 
					 	ORDER BY c.updated ASC 
					 	LIMIT 1)
				   ) AS rate_to_usd, currency_id, user_id, money FROM balance b 
)

SELECT q.name, q.lastname, currency_name, (money * rate_to_usd) AS currency_in_usd
FROM (
	SELECT COALESCE(u.name,'not defined') AS name,
		   COALESCE(u.lastname,'not defined') AS lastname,
		   c.name AS currency_name,
		   t.money,
		   t.rate_to_usd FROM t
	JOIN (SELECT c.id, c.name 
		  FROM currency AS c 
		  GROUP BY c.id, c.name) AS c ON c.id = t.currency_id
	LEFT JOIN "user" AS u ON u.id = t.user_id)
AS q
ORDER BY 1 DESC, 2, 3


