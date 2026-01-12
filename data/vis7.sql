USE AdventureWorks;
GO


SELECT TOP 10 * FROM Sales.SalesTerritory;
SELECT TOP 10 * FROM Sales.SalesOrderHeader;
SELECT TOP 10 * FROM Sales.Customer;
SELECT TOP 10 * FROM Sales.Store;



SELECT
    st.Name AS Region,
    CASE 
        WHEN s.BusinessEntityID IS NULL THEN 'Individual'
        ELSE 'Store'
    END AS CustomerType,
    SUM(soh.TotalDue) / COUNT(soh.SalesOrderID) AS AvgOrderValue
FROM Sales.SalesTerritory st
JOIN Sales.SalesOrderHeader soh
    ON st.TerritoryID = soh.TerritoryID
JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
LEFT JOIN Sales.Store s
    ON c.StoreID = s.BusinessEntityID
GROUP BY st.Name,
         CASE 
             WHEN s.BusinessEntityID IS NULL THEN 'Individual'
             ELSE 'Store'
         END
ORDER BY AvgOrderValue DESC;

