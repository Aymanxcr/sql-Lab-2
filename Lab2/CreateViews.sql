-- View: Titles per author
CREATE VIEW v_TitlarPerFörfattare AS
SELECT 
    CONCAT(a.FirstName, ' ', a.LastName) AS Name,
    DATEDIFF(YEAR, a.DateOfBirth, GETDATE()) AS Age,
    COUNT(b.ISBN13) AS Titles,
    SUM(b.Price * i.Quantity) AS InventoryValue
FROM Authors a
LEFT JOIN Books b ON a.ID = b.AuthorID
LEFT JOIN Inventory i ON b.ISBN13 = i.ISBN
GROUP BY a.ID, a.FirstName, a.LastName, a.DateOfBirth;

-- Additional view: Total orders per customer
CREATE VIEW v_TotalOrdersPerCustomer AS
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
