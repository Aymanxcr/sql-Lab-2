-- Test views
SELECT * FROM v_TitlarPerFörfattare;
SELECT * FROM v_TotalOrdersPerCustomer;

-- Test stored procedure
EXEC usp_FlyttaBok @SourceStoreID = 1, @DestinationStoreID = 2, @ISBN = '9781234567890', @Quantity = 3;

-- Test table data
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Stores;
SELECT * FROM Inventory;
SELECT * FROM Customers;
SELECT * FROM Orders;
