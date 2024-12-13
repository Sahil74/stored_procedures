-- Create a Procedure to Calculate Total Sales
CREATE PROCEDURE CalculateTotalSales(IN p_year INT, IN p_month INT)
BEGIN
    SELECT SUM(sale_amount) AS TotalSales
    FROM sales
    WHERE YEAR(sale_date) = p_year
    AND MONTH(sale_date) = p_month;
END

CALL CalculateTotalSales(2024, 11);


--Create a Procedure to Update Employee Salary

CREATE PROCEDURE UpdateEmployeeSalary(IN p_employee_id INT, IN p_new_salary DECIMAL(10, 2))
BEGIN
    UPDATE employees
    SET salary = p_new_salary
    WHERE employee_id = p_employee_id;
END

CALL UpdateEmployeeSalary(101, 55000.00);


--Create a Procedure to Insert New Customer 

CREATE PROCEDURE InsertCustomer(IN p_first_name VARCHAR(50), IN p_last_name VARCHAR(50), IN p_email VARCHAR(100))
BEGIN
    INSERT INTO customers (first_name, last_name, email)
    VALUES (p_first_name, p_last_name, p_email);
END 

CALL InsertCustomer('John', 'Doe', 'john.doe@example.com');


-- Create a Procedure to Get Employees by Department

CREATE PROCEDURE GetEmployeesByDepartment(IN p_department_name VARCHAR(50))
BEGIN
    SELECT employee_id, first_name, last_name, department
    FROM employees
    WHERE department = p_department_name;
END 


CALL GetEmployeesByDepartment('Sales');
