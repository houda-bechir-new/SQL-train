
-- Give the list of producers:
SELECT * FROM Producer;
-- Give the list of producers sorted by name:
SELECT * FROM Producer ORDER BY FirstName;
-- Give the list of producers in Sousse:
SELECT * FROM Producer WHERE Region = 'Sousse';
-- Calculate the total quantity of wine produced having the number 12:
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE WineNumber = 12;
-- Calculate the quantity of wine produced by category:
SELECT Category, SUM(Quantity) AS TotalQuantity
FROM Wine
JOIN Harvest ON Wine.WineNumber = Harvest.WineNumber
GROUP BY Category;
-- Producers in the Sousse region who have harvested at least 
-- one wine in quantities greater than 300 liters, sorted alphabetically:
SELECT FirstName, LastName
FROM Producer
JOIN Wine ON Producer.ProducerID = Wine.ProducerID
JOIN Harvest ON Wine.WineNumber = Harvest.WineNumber
WHERE Region = 'Sousse' AND Quantity > 300
GROUP BY FirstName, LastName
ORDER BY LastName, FirstName;
-- List the wine numbers that have a degree greater than 
-- 12 and have been produced by producer number 24:
SELECT WineNumber
FROM Wine
WHERE Degree > 12 AND ProducerID = 24;
