USE AdventureWorks;
GO


SELECT TOP 10 * FROM Production.Product;
SELECT TOP 10 * FROM Sales.SalesOrderDetail;



SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod
    ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

