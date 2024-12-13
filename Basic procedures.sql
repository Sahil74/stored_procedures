-- Write a basic procedure to list countries in Asia, then make small changes to it.
CREATE PROC uspAugustEvents --Don't use sp_ at the start of the procedure name, this is reserved for system procedures.
AS --Proc or procedure will work

SELECT --Select the columns for events
	EventID
	,EventName
	,EventDetails
	,EventDate
FROM
	tblEvent
WHERE
	MONTH(EventDate) = 8 --DATENAME(MM,EventDate) LIKE 'August'
	-- Filter to only look at August



ALTER PROC uspCountriesAsia
AS

-- list countries in Asia
SELECT
	c.CountryId,
	c.CountryName
FROM
	tblCountry AS c
WHERE	
	c.ContinentID = 1
ORDER BY 
	c.CountryName
GO

-- test this
uspCountriesAsia