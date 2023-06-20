CREATE TABLE IF NOT EXISTS tsp_graph (
    point1 varchar,
    point2 varchar,
    cost int);

INSERT INTO tsp_graph VALUES ('a', 'b', 10);
INSERT INTO tsp_graph VALUES ('b', 'a', 10);
INSERT INTO tsp_graph VALUES ('a', 'c', 15);
INSERT INTO tsp_graph VALUES ('c', 'a', 15);
INSERT INTO tsp_graph VALUES ('b', 'c', 35);
INSERT INTO tsp_graph VALUES ('c', 'b', 35);
INSERT INTO tsp_graph VALUES ('b', 'd', 25);
INSERT INTO tsp_graph VALUES ('d', 'b', 25);
INSERT INTO tsp_graph VALUES ('c', 'd', 30);
INSERT INTO tsp_graph VALUES ('d', 'c', 30);
INSERT INTO tsp_graph VALUES ('d', 'a', 20);
INSERT INTO tsp_graph VALUES ('a', 'd', 20);


CREATE OR REPLACE VIEW ways(total_cost) AS (
	
WITH RECURSIVE r AS (
SELECT 
	point1 AS all, 
	tsp_graph.point1,
	0 AS sum, 
	1 AS level  
	FROM tsp_graph WHERE point1 = 'a'	
UNION ALL
SELECT 
	r.all || ',' || tsp_graph.point2, 
	tsp_graph.point2, 
	r.sum + tsp_graph.cost, 
	level + 1 
	FROM tsp_graph
		JOIN r ON r.point1 = tsp_graph.point1
	WHERE r.all NOT LIKE '%' || tsp_graph.point2 || '%'
)

SELECT sum + tsp_graph.cost AS total_cost, 
	'{' || r.all || ',a' || '}' AS tour
FROM r
	JOIN tsp_graph ON tsp_graph.point1 = r.point1 AND tsp_graph.point2 = 'a'
WHERE r.level = 4
	
);

SELECT DISTINCT *
FROM ways
ORDER BY 1