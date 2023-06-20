SELECT 
  		COALESCE(u.name, 'not defined') AS name,
		COALESCE(u.lastname, 'not defined') AS lastname,
		balance.type,
		sum(balance.money) AS volume,
		COALESCE(c.name, 'not defined') AS currency_name,
		COALESCE(currency.rate_to_usd, 1) AS last_rate_to_usd,
		CAST(sum(balance.money) * COALESCE(currency.rate_to_usd, 1) AS float) AS total_volume_in_usd
	FROM  "user" u 
	FULL JOIN balance ON balance.user_id = u.id
	FULL JOIN (SELECT id, name, MAX(updated) AS last_updated FROM currency GROUP BY id, name) AS c ON
	balance.currency_id = c.id
	LEFT JOIN currency ON c.last_updated = currency.updated AND c.name = currency.name
	GROUP BY u.name, u.lastname, balance.type, c.name, currency.rate_to_usd
	ORDER BY name DESC, lastname, balance.type
