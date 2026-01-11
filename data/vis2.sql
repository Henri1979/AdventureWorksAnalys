USE AdventureWorks
GO


SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory
SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail



SELECT
    pc.Name AS CategoryName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalRevenue
FROM Production.ProductCategory pc
INNER JOIN Production.ProductSubcategory psc 
    ON pc.ProductCategoryID = psc.ProductCategoryID
INNER JOIN Production.Product p 
    ON psc.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail sod
    ON sod.ProductID = p.ProductID
GROUP BY pc.Name
ORDER BY TotalRevenue DESC
