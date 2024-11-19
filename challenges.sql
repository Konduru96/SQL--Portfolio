-- Challenge 1: High-Level Context Queries

-- 1. Find the number of transactions between 2011 and 2012.
SELECT 
	count() AS [total no of transactions]
FROM
	Invoice
WHERE
	strftime('%Y', InvoiceDate) IN ('2011','2012')

-- 2. Calculate the total revenue for WSDA Music between 2011 and 2012.
SELECT 
	sum(total) as [total revenue]
FROM
	Invoice
WHERE
	strftime('%Y', InvoiceDate) IN ('2011','2012')

-- Challenge 2: Targeted Customer and Employee Analysis

-- 1. List customers who made purchases between 2011 and 2012.
SELECT
	c.FirstName as [Customer FN],
	c.LastName as [Customer LN],
	i.InvoiceDate
FROM
	Invoice i 
INNER JOIN
	Customer c 
ON i.CustomerId=c.CustomerId
WHERE
	strftime('%Y',invoicedate) IN ('2011','2012')

ORDER bY
	c.invoicedate

-- 2. List customers, sales reps, and transaction totals for each customer between 2011 and 2012.
SELECT 
	c.FirstName as [Customer FN],
	c.LastName as [Customer LN],
	c.SupportRepId,
	e.FirstName as [Employe FN],
	e.LastName as [Employee LN],
	sum(i.total) as [total purchase]

FROM
	Invoice i 
INNER JOIN
	Customer c 
ON i.CustomerId=c.CustomerId
INNER JOIN
	Employee e 
ON c.SupportRepId=e.EmployeeId
WHERE
	strftime('%Y',invoicedate) IN ('2011','2012')
GROUP BY
	c.FirstName
ORDER BY
	i.InvoiceDate

--3. How many transactions are above the average transaction amount during the  same time period?
-- Find the average transaction amount between 2011 and 2012 
SELECT
	round(avg(total),2) as [Average TRANSACTION amount]
FROM
	Invoice
WHERE
	strftime('%Y',InvoiceDate) IN ('2011','2012')

-- Get the number of transactions above the average transaction amount
SELECT
	count() as [number of TRANSACTIONS]
FROM
	Invoice
WHERE
	total>(SELECT 
				round(avg(total),2) as [Average TRANSACTION amount]
			FROM
				Invoice
			WHERE
				strftime('%Y',InvoiceDate) IN ('2011','2012'))
AND
	strftime('%Y',invoicedate) IN ('2011','2012')

--4. What is the average transaction amount for each year that WSDA Music has been in business?  
SELECT 
	strftime('%Y',Invoicedate) as [year],
	round(avg(total),2) as [Average transaction amount]
FROM
	Invoice
GROUP BY
	strftime('%Y',invoicedate)
ORDER BY
	year

--Challenge 3: In-depth analysis to identify potential suspects
--1. Get a list of employees who exceeded the average transaction amount(ata) from  sales they generated during 2011 and 2012.
 SELECT 
         e.FirstName, 
         e.LastName, 
		 sum(i.total) as [sale total],
		 count() as [no of sales > ATA]
FROM 
         Invoice i 
INNER JOIN 
         Customer c 
ON i.CustomerId = c.CustomerId 
INNER JOIN 
         Employee e 
ON e.EmployeeId = c.SupportRepId 
WHERE 
         InvoiceDate >= '2011-01-01' AND InvoiceDate <='2012-12-31'
AND 
         i.total > (SELECT 
				round(avg(total),2) as [Average TRANSACTION amount]
			FROM
				Invoice
			WHERE
				strftime('%Y',InvoiceDate) IN ('2011','2012'))
GROUP BY e.LastName  

--2. Create a Commission Payout column that displays each employee’s commission based on 15% of the sales transaction amount.
SELECT 
         e.FirstName, 
         e.LastName, 
	 sum(i.total) as [sale],
         0.15*(sum(i.total)) AS [Employee commission]
FROM 
         Invoice i 
INNER JOIN 
         Customer c 
ON i.CustomerId = c.CustomerId 
INNER JOIN 
         Employee e 
ON e.EmployeeId = c.SupportRepId 
WHERE 
         InvoiceDate >= '2011-01-01' AND InvoiceDate <='2012-12-31'
GROUP BY 
         e.FirstName, 
         e.LastName 
ORDER BY e.LastName  

--3. Which employee made the highest commission?
-- Jane	Peacock	199.77

--4. List the customers that Jane Peacock supported.
SELECT
	c.FirstName as [Customer FN],
	c.LastName as [Customer LN],
	c.SupportRepId,
	e.FirstName as [Employee FN],
	e.LastName as [Employee LN],
	sum(i.total) as [total sale],
	0.15* sum(i.total) as [commission]
FROM
	Invoice i
INNER JOIN
	Customer c
ON
	c.CustomerId=i.CustomerId

INNER JOIN
	Employee e
ON
	c.SupportRepId=e.EmployeeId
WHERE
	e.LastName='Peacock'
AND
	strftime('%Y', invoicedate) IN ('2011','2012')
GROUP BY
	c.FirstName
ORDER BY
	[total sale] DESC

--5. Which customer made the highest purchase?
-- John Doeein

--6. Take a look at this customer record—does it look suspicious?
SELECT
	*
FROM
	Customer
WHERE
	LastName='Doeein'

--7. Who do you conclude is our primary person of interest?
-- Jane Peacock

