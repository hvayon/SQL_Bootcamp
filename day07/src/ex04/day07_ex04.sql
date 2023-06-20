SELECT name, count(person_id) AS count_of_visits FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id
GROUP BY name
HAVING count(person_id) > 3;
