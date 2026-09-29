USE SuperstoreDB;

--1. Total Rows Chech
SELECT COUNT(*) FROM Superstore;

--2. find the total sales for each category?
SELECT Category, SUM(sales) as total_sales
FROM Superstore
GROUP By Category;


--3. find the total profit for each category?
SELECT Category, SUM(profit) as total_profit
FROM Superstore
GROUP By Category;

--4. Find Category wise Sales sorted by Highest to Lowest?
SELECT Category, SUM(sales) as total_sales
FROM Superstore
GROUP By Category
ORDER BY total_sales DESC;

--5. Find Region wise Total Sales (Highest to Lowest)?
SELECT Region, SUM(sales) as total_sales
FROM Superstore
GROUP By Region
ORDER BY total_sales DESC;

--6. Find Top 5 Sub Categories with Highest Sales?
SELECT top 5 Sub_Category, SUM(sales) as total_sales
FROM Superstore
GROUP BY Sub_Category
ORDER BY total_sales DESC;


--7. Find Top 5 Sub Categories with Highest Sales?
SELECT top 5 Sub_Category, SUM(profit) as total_profit
FROM Superstore
GROUP BY Sub_Category
ORDER BY total_profit DESC;

--8. Find Year Wise Total Sales?
SELECT YEAR(Order_Date) as Sales_Year, SUM(sales) as total_sales
FROM Superstore
GROUP BY YEAR(Order_Date)
ORDER BY Sales_Year;

--9. Find Total Sales in 'WEST' Region?
SELECT Region, SUM(sales) as total_sales
FROM Superstore
WHERE Region = 'West'
GROUP BY Region;

--10. Find Categories where Total sales is more than 400000 (HAVING + ORDER BY)
SELECT Category, SUM(sales) as total_sales
FROM Superstore
GROUP BY Category
HAVING SUM(sales) > 400000
ORDER BY total_sales DESC;

--11. Which Category gives Highest Profit?
SELECT Top 3 Category, SUM(profit) as total_profit
FROM Superstore
GROUP BY Category
ORDER BY total_profit DESC;

--12. Show Profit Performance of Categories?
SELECT Category, SUM(profit) as total_profit, 
CASE WHEN SUM(profit) > 50000 THEN 'Good' ELSE 'Bad' END as result
FROM Superstore
GROUP BY Category;

--13. Categorize Categories by profit Performance?
SELECT Category, SUM(profit) as total_profit, 
CASE 
WHEN SUM(profit) > 100000 THEN 'Highly profitable'
WHEN SUM(profit) > 20000 THEN 'Moderately Profitable'
ELSE 'Low Profitable'
END as performance
FROM Superstore
GROUP BY Category;

--14. Find Loss-Making Products - Which Sub_Categories are making LOSS? (Total Profit < 0)
SELECT Sub_Category, SUM(profit) as total_profit
FROM Superstore
GROUP BY Sub_Category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

--15. How many orders each category got?
SELECT Category, COUNT(*) as total_orders, SUM(profit) as total_profit
FROM Superstore
GROUP BY Category
ORDER BY total_orders DESC;







