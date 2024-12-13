CREATE PROCEDURE us_customers ()
LANGUAGE SQL
AS $$
SELECT customer_id, first_name
FROM Customers
WHERE Country = 'USA';
$$;

CALL us_customers();

-- DROP PROCEDURE us_customers;