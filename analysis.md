## Missing Money Matters: Analysis and Insights

## Project Overview
The project involves analyzing WSDA Music's data to identify a financial discrepancy between 2011 and 2012. The investigation spans customer transactions, sales representative performance, and anomalies in purchases.This document provides a detailed analysis of the SQL queries performed, their results, and conclusions drawn to identify potential suspects and irregularities.

## Challenge 1: High-Level Context

### 1. How many transactions took place between 2011 and 2012?
The total number of transactions during this period was 167.
This provides a scope of the business activity and a baseline for further analysis.

### 2. How much money did WSDA Music make during the same period?
The total revenue from 2011 to 2012 was 1947.97
This value establishes the financial baseline and identifies the range of funds involved.


## Challenge 2: Targeted Analysis

### 1. List of Customers Who Made Purchases Between 2011 and 2012
The SQL query identified 167 records
This dataset allows us to analyze spending patterns and investigate individual customers further.

### 2. Customers, Sales Reps, and Total Transaction Amounts
A breakdown of transactions per customer and their assigned sales representatives was generated.
This helps identify patterns in customer behavior and the performance of sales reps.

### 3. Transactions Above the Average Transaction Amount
26 transactions were above the average transaction amount.
High-value transactions are critical to identifying anomalies and potential suspects.

### 4. Average Transaction Amount Per Year
The yearly average transaction values indicate a steady or fluctuating revenue pattern.
Year    Average Transaction Amount
2009	5.42
2010	5.8
2011	17.51
2012	5.75
2013	5.63


## Challenge 3: In-Depth Analysis

### 1. Employees Exceeding Average Transaction Amount (2011-2012)
The following employees exceeded the average transaction amount during the period
Firstname   Lastname
Steve	    Johnson
Margaret	Park
Jane	    Peacock
 
### 2. Commission Payout
Employees earned commissions at 15% of total sales:
Firstname   Lastname    sale    Commission
Steve	    Johnson	    293.2	43.98
Margaret    Park	    322.97	48.4455
Jane	    Peacock	    1331.8	199.77
 
### 3. Highest Commission Earned
Jane Peacock earned the highest commission of 199.77.

### 4. Customers Served by the Employee With the Highest Commission 
The customers served by the top-performing employee were:
First name	Last name
John	    Doeein
Hugh	    O'Reilly
Wyatt	    Girard
Robert	    Brown
Puja	    Srivastava
Niklas	    Schröder
Isabelle	Mercier
Fynn	    Zimmermann
Terhi	    Hämäläinen
Luís	    Gonçalves
Frank	    Ralston
Edward	    Francis
Tim	        Goyer
Jennifer	Peterson
Phil	    Hughes
Ladislav	Kovács
Manoj	    Pareek
Roberto	    Almeida
Ellie	    Sullivan
Emma	    Jones
François	Tremblay
Michelle	Brooks

### 5. Customer With the Highest Purchase
•	John Doeein made the highest purchase of 1000.86

### 6. Suspicious Activity in Customer Record
On examining the customer record:
Observation – No data except the name of the customer

### 7. Primary Person of Interest
Based on the analysis:
Jane Peacock was identified as the primary person of interest due to reason ( suspicious transaction).

### Conclusions
The financial discrepancy likely stems from high commission and Data Integrity Issue, involving Jane Peacock

### Recommendations:
1.	Conduct an internal audit of high-value transactions.
2.	Implement stricter transaction monitoring and validation.
3.	Establish clear accountability for sales representatives managing high-value accounts.

