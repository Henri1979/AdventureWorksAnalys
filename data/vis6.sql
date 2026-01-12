USE AdventureWorks
GO

SELECT TOP 10 * FROM Sales.SalesTerritory;
SELECT TOP 10 * FROM Sales.SalesOrderHeader;
SELECT TOP 10 * FROM Sales.Customer;



SELECT
    st.Name AS Region,
    SUM(soh.TotalDue) AS TotalSales,
    COUNT(DISTINCT c.CustomerID) AS UniqueCustomers
FROM Sales.SalesTerritory st
JOIN Sales.SalesOrderHeader soh
    ON st.TerritoryID = soh.TerritoryID
JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
GROUP BY st.Name
ORDER BY TotalSales DESC;

