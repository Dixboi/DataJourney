CREATE TABLE StudenDetail (
  ID INTEGER PRIMARY KEY,
  firstNAME TEXT NOT NULL,
  lastName TEXT NOT NULL,
  age INTEGER NOT NULL,
  major TEXT NOT NUL,
  city TEXT NOT NULL,
  phoneNumber TEXT NOT NULL
);

INSERT INTO StudentDetail VALUES(0000, 'Shahlin', 'Valenzuela', 21, 'CpE', 'Calapan', '09750324763')
INSERT INTO StudentDetail VALUES(0001, 'Cla', 'Sarmiento', 21, 'CpE', 'Romblon', '09631755129')
INSERT INTO StudentDetail VALUES(0002, 'Jubi', 'Valderas', 21, 'CpE', 'Lucena', '09429740481')
INSERT INTO StudentDetail VALUES(0003, 'Enam', 'Ferriols', 21, 'CpE', 'Batangas', '09171755534')
INSERT INTO StudentDetail VALUES(0004, 'Raymun', 'Vinluan', 18, 'CpE', 'Laguna', '09088894733')

UPDATE StudentDetail SET age = 21 WHERE firstName = 'Raymun';
SELECT * FROM StudenDetail;
