CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan =OFF;

EXPLAIN ANALYSE
SELECT name
	FROM person
WHERE upper(name) = 'Kate';