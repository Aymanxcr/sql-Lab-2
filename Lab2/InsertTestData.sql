-- Insert authors
INSERT INTO Authors (FirstName, LastName, DateOfBirth)
VALUES 
('Emma', 'Askling', '1980-06-15'),
('John', 'Doe', '1975-09-25'),
('Jane', 'Smith', '1990-03-12'),
('Robert', 'Brown', '1965-11-30');

-- Insert books
INSERT INTO Books (ISBN13, Title, Language, Price, PublicationDate, AuthorID)
VALUES 
('9781234567890', 'Book A', 'English', 199.99, '2010-05-20', 1),
('9781234567891', 'Book B', 'Swedish', 299.99, '2015-08-15', 2),
('9781234567892', 'Book C', 'English', 149.99, '2020-02-10', 3),
('9781234567893', 'Book D', 'French', 249.99, '2018-11-01', 4);

-- Insert stores
INSERT INTO Stores (StoreName, Address)
VALUES 
('Central Store', '123 Main St'),
('North Store', '456 North Ave'),
('South Store', '789 South Blvd');

-- Insert inventory
INSERT INTO Inventory (StoreID, ISBN, Quantity)
VALUES 
(1, '9781234567890', 10),
(2, '9781234567891', 5),
(3, '9781234567892', 20),
(1, '9781234567893', 15);

-- Insert customers
INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob', 'Williams', 'bob.williams@example.com', '555-5678');

-- Insert orders
INSERT INTO Orders (CustomerID, TotalAmount)
VALUES 
(1, 299.99),
(2, 149.99);
