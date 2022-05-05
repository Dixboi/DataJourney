
-- create
CREATE TABLE Product (
  Product_Id INTEGER PRIMARY KEY,
  Product_name TEXT NOT NULL,
  Product_brand TEXT NOT NULL,
  Price INTEGER NOT NULL
);

-- insert
INSERT INTO Product VALUES (0001, 'pen', 'reynolds', 2);
INSERT INTO Product VALUES (0002, 'notebook', 'classmate', 3);
INSERT INTO Product VALUES (0003, 'toothpaste', 'colgate', 12);
INSERT INTO Product VALUES (0004, 'soap', 'lux', 4.39);
INSERT INTO Product VALUES (0005, 'razor', 'gillete', 3.99);
INSERT INTO Product VALUES (0006, 'bread', 'mothers', 2.99);
INSERT INTO Product VALUES (0007, 'jam', 'mothers', 4.49);
INSERT INTO Product VALUES (0008, 'soap', 'nivia', 5.39);
INSERT INTO Product VALUES (0009, 'sanitizer', 'lifeboy', 2.99);
INSERT INTO Product VALUES (0010, 'jam', 'druk', 5);
INSERT INTO Product VALUES (0011, 'pen', 'parker', 6.39);
INSERT INTO Product VALUES (0012, 'crayons', 'canola', 2.4);

-- Get all item priced above 3.99 dollars.
SELECT * FROM Product WHERE Price > 3.99;

-- Get all product which are either 'jam' or 'bread'.
SELECT * FROM Product WHERE Product_name = 'jam' OR Product_name = 'bread';

-- Arrange products by increasing order of its price.
SELECT * FROM Product ORDER BY Price;

-- Get all product name and brand name from table.
SELECT Product_name, Product_brand FROM Product;

-- Insert a column name 'quantity'.
ALTER TABLE Product ADD COLUMN quantity INTEGER NOT NULL;
SELECT * FROM Product;
