-- SQLite
SELECT * FROM Positive WHERE id2 BETWEEN 10 AND 20;

SELECT DISTINCT id1 FROM Ancre;

SELECT a.anchor, p.pos, n.neg 
FROM Ancre a 
INNER JOIN Positive p ON a.id1 = p.id2 
INNER JOIN Negative n ON a.id1 = n.id3

SELECT * FROM Ancre 
WHERE anchor LIKE '%123%'

SELECT * FROM Ancre
WHERE id1 IN (SELECT id2 FROM Positive)
AND id1 NOT IN (SELECT id3 FROM Negative);

SELECT *
FROM Ancre
WHERE id1 IN (
  SELECT id2
  FROM Positive
)
AND anchor LIKE '%75%';

SELECT id3, COUNT(*) AS count_negative
FROM Negative
GROUP BY id3;

SELECT Ancre.anchor, Positive.pos, Negative.neg 
FROM Ancre 
INNER JOIN Positive ON Ancre.id1 = Positive.id2 
INNER JOIN Negative ON Ancre.id1 = Negative.id3 
GROUP BY Ancre.id1;

SELECT Ancre.anchor, COUNT(*) 
FROM Ancre 
LEFT JOIN Positive ON Ancre.id1 = Positive.id2 
LEFT JOIN Negative ON Ancre.id1 = Negative.id3 
GROUP BY Ancre.anchor 
HAVING COUNT(Positive.id2) > COUNT(Negative.id3)

SELECT anchor FROM Ancre
WHERE id1 IN (
  SELECT id2 FROM Positive
  UNION
  SELECT id3 FROM Negative);

SELECT anchor FROM Ancre
WHERE id1 IN (
  SELECT id2 FROM Positive
) AND id1 IN (
  SELECT id3 FROM Negative); 

SELECT anchor FROM Ancre
WHERE NOT EXISTS (
  SELECT * FROM Positive
  WHERE NOT EXISTS (
    SELECT * FROM Negative
    WHERE Negative.id3 = Positive.id2
    AND Ancre.id1 = Positive.id2));

SELECT anchor FROM Ancre
WHERE id1 <= ALL (SELECT id2 FROM Positive);

SELECT anchor FROM Ancre
WHERE id1 = ANY (
  SELECT id3 FROM Negative);













