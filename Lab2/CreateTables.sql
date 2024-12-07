-- Authors table
CREATE TABLE Authors (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- Books table
CREATE TABLE Books (
    ISBN13 CHAR(13) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Language NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PublicationDate DATE NOT NULL,
    AuthorID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

-- Stores table
CREATE TABLE Stores (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    StoreName NVARCHAR(200) NOT NULL,
    Address NVARCHAR(300) NOT NULL
);

-- Inventory table
CREATE TABLE Inventory (
    StoreID INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (StoreID, ISBN),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN13)
);

-- Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(200) UNIQUE NOT NULL,
    Phone NVARCHAR(15)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Junction table for many-to-many relationship between books and authors
CREATE TABLE Book_Authors (
    BookISBN CHAR(13) NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookISBN, AuthorID),
    FOREIGN KEY (BookISBN) REFERENCES Books(ISBN13),
    FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);
