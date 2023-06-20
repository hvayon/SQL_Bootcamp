CREATE FUNCTION fnc_person_visits_and_eats_on_date
    (pperson varchar default 'Dmitriy',
     pprice numeric default 500, 
     pdate date default '2022-01-08')
RETURNS TABLE(name varchar) AS $$
  BEGIN
  RETURN QUERY
    SELECT pz.name AS pizzeria_name FROM menu AS m 
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    JOIN person_visits pv ON m.pizzeria_id = pv.pizzeria_id
    JOIN person p ON p.id = pv.person_id
    WHERE price < pprice AND p.name = pperson AND visit_date = pdate;
  END; $$ LANGUAGE PLPGSQL;
  
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');