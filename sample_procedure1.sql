-- Connection with database for procedure.
CREATE DATABASE SampleDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country)
VALUES (1, 'Shubham', 'Thakur', 'India'),
       (2, 'Aman ', 'Chopra', 'Australia'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka'),
       (4, 'Aditya', 'Arpan', 'Austria'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain');

CREATE PROCEDURE GetCustomersByCountry
    @Country VARCHAR(50)
AS
BEGIN
    SELECT CustomerName, ContactName
    FROM Customers
    WHERE Country = @Country;
END;

EXEC GetCustomersByCountry @Country = 'Sri lanka';