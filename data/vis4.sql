USE AdventureWorks;
GO


SELECT TOP 10 *
FROM Sales.SalesOrderHeader;



SELECT
    YEAR(OrderDate) AS OrderYear,
    COUNT(SalesOrderID) AS NumberOfOrders,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

