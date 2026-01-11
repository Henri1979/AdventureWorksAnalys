USE AdventureWorks

SELECT * FROM Sales.SalesOrderHeader

SELECT
    FORMAT(soh.OrderDate, 'yyyy-MM') AS YearMonth,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
GROUP BY FORMAT(soh.OrderDate, 'yyyy-MM')
ORDER BY YearMonth
