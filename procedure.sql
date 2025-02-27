-- w3 school sql practice
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers @City = 'London';


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;



EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
