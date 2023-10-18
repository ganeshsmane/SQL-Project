-- Create a database for the store billing system
CREATE DATABASE BillingSystem;
USE StoreBillingSystem;

-- Create the Products table to store information about products in the store
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create the Customers table to store information about customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Create the Sales table to store information about sales transactions
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the Sales_Items table to store the items in each sale
CREATE TABLE Sales_Items (
    SalesItemID INT PRIMARY KEY AUTO_INCREMENT,
    SaleID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
