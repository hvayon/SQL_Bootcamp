SELECT p.name, COUNT(person_id) AS count_of_visits FROM person_visits pv
INNER JOIN person p
ON p.id = pv.person_id
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4;