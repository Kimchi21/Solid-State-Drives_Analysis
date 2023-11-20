-- 1. What is the distribution of Brand?
SELECT Brand, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY Brand
ORDER BY Count DESC;

-- 2. What is the distribution of Interface in percentage?
SELECT Interface, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY Interface
ORDER BY Percentage DESC;

-- 3. What is the distribution of brands Form Factor in percentage?
SELECT FormFactor, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY FormFactor
ORDER BY Percentage DESC;

-- 4. What is the distribution of Capacities?
SELECT Capacities, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY Capacities
ORDER BY Count DESC;

-- 5. What is the distribution of Controller?
SELECT Controller, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY Controller
ORDER BY Count DESC;

-- 6. What is the distribution of Configuration?
SELECT Configuration, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY Configuration
ORDER BY Count DESC;

-- 7. What is the distribution of DRAM in percentage?
SELECT DRAM, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY DRAM
ORDER BY Percentage DESC;

-- 8. What is the distribution of HMB in percentage?
SELECT HMB, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY HMB
ORDER BY Percentage DESC;

-- 9. What is the distribution of NAND Brand?
SELECT NANDBrand, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY NANDBrand
ORDER BY Count DESC;

-- 10. What is the distribution of NAND Type in percentage?
SELECT NANDType, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY NANDType
ORDER BY Percentage DESC;

-- 11. What is the distribution of Layers?
SELECT Layers, COUNT(*) AS Count
FROM ssddb.ssd
GROUP BY Layers
ORDER BY Count DESC;

-- 12. What is the average read and write speeds according to category?
SELECT Categories, ROUND(AVG(ReadSpeed), 2) AS AverageReadSpeed, ROUND(AVG(WriteSpeed), 2) AS AverageWriteSpeed
FROM ssddb.ssd
GROUP BY Categories
ORDER BY AverageReadSpeed DESC, AverageWriteSpeed DESC;

-- 13. What is the price range for each model?
SELECT Model, CONCAT(LowestPrice, '-', HighestPrice) as PriceRange
FROM ssddb.ssd
GROUP BY Model, LowestPrice, HighestPrice
ORDER BY PriceRange DESC;

-- 14. What is the average price for each category?
SELECT Categories, ROUND(AVG((HighestPrice + LowestPrice) / 2), 2) AS AveragePrice
FROM ssddb.ssd
GROUP BY Categories
ORDER BY AveragePrice DESC;

-- 15. What is the distribution of Amazon's Choice in percentage?
SELECT AmazonsChoice, ROUND(((COUNT(*) / 412) * 100), 1) AS Percentage
FROM ssddb.ssd
GROUP BY AmazonsChoice
ORDER BY Percentage DESC;

-- 16. What is the average price to performance for each model?
SELECT Model, ROUND(AVG(DiskRating / ((HighestPrice + LowestPrice) / 2)), 2) AS PricetoPerformance
FROM ssddb.ssd
GROUP BY Model
ORDER BY PricetoPerformance DESC;

-- 17. What is the average Number of Ratings for SSD's that are considered to be "Amazon's Choice" as opposed to those who are not considered as such?
SELECT AmazonsChoice, ROUND(AVG(NumberOfRatings), 2) AS AverageNumofRatings
FROM ssddb.ssd
GROUP BY AmazonsChoice
ORDER BY AverageNumofRatings DESC;

-- 18. What is the average Rating for SSD's that are considered to be "Amazon's Choice" as opposed to those who are not?
SELECT AmazonsChoice, ROUND(AVG(Rating), 2) AS AverageRating
FROM ssddb.ssd
GROUP BY AmazonsChoice
ORDER BY AverageRating DESC;