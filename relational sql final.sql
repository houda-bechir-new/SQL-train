-- Table: Producer
CREATE TABLE Producer (
  NumP INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Region VARCHAR(50)
);
-- Inserting rows into the Producer table
INSERT INTO Producer (NumP, FirstName, LastName, Region)
VALUES

  (24, 'Omar', 'Toumi', 'Sousse'),
  (1, 'John', 'Smith', 'Sousse'),
  (2, 'Emma', 'Johnson', 'Tunis'),
  (3, 'David', 'Brown', 'Sousse'),
  (4, 'Sophia', 'Davis', 'Sfax'),
  (5, 'Michael', 'Miller', 'Sousse');
  
  select * from Producer;
-- Table: Wine
CREATE TABLE Wine (
  NumW INT PRIMARY KEY,
  Category VARCHAR(50),
  Degree FLOAT,
  Year1 DATE,
  NumP INT,
  FOREIGN KEY (NumP) REFERENCES Producer(NumP)
);
-- Inserting rows into the Wine table
INSERT INTO Wine (NumW, Category, Degree, Year1, NumP)
VALUES
  (15,'red', 18,'2020-02-02',24),
  (10, 'Red', 14.5,'2020-02-02', 1),
  (11, 'White', 12.8,'2020-02-02', 2),
  (12, 'Red', 15.2,'2020-02-02', 3),
  (13, 'Rose', 10.5,'2020-02-02', 4),
  (14, 'Red', 13.7, '2020-02-02', 5);
select * from Wine;
-- Table: Harvest
CREATE TABLE Harvest (
  HarvestID INT PRIMARY KEY,
  HarvestDate DATE,
  Quantity INT,
  NumW INT,
  FOREIGN KEY (NumW) REFERENCES Wine(NumW)
);

-- Inserting rows into the Harvest table
INSERT INTO Harvest (HarvestID, HarvestDate, Quantity, NumW)
VALUES
  (100, '2023-05-01', 200, 10),
  (101, '2023-06-10', 150, 11),
  (102, '2023-06-15', 300, 12),
  (103, '2023-05-20', 250, 13),
  (104, '2023-06-05', 180, 14);

  --affichage
  select * from Wine
  select * from Producer
  select * from Harvest;
  -- requete

-- Give the list of producers:
SELECT * FROM Producer;






-- Give the list of producers sorted by name:
SELECT * FROM Producer ORDER BY FirstName;



-- Give the list of producers in Sousse:
SELECT * FROM Producer WHERE Region = 'Sousse';



-- Calculate the total quantity of wine produced having the number 12:
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE NumW = 12;



-- Calculate the quantity of wine produced by category:
SELECT Wine.Category, SUM(Harvest.Quantity) AS TotalQuantity
FROM Wine
JOIN Harvest ON Wine.NumW = Harvest.NumW
GROUP BY Wine.Category;
select * from Harvest;
select * from Wine;

-- Producers in the Sousse region who have harvested at least 
-- one wine in quantities greater than 300 liters, sorted alphabetically:

SELECT FirstName, LastName
FROM Producer
JOIN Wine ON Producer.NumP = Wine.NumP
JOIN Harvest ON Wine.NumW = Harvest.NumW
WHERE Region = 'Sousse' AND Quantity > 300
GROUP BY FirstName, LastName
ORDER BY LastName, FirstName;


-- List the wine numbers that have a degree greater than 
-- 12 and have been produced by producer number 24:
SELECT NumW
FROM Wine
WHERE Degree > 12 AND NumP = 24;