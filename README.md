# Missing Money Matters: SQL Analysis for WSDA Music

## Project Overview
This project is part of the SQL Essential Training course on LinkedIn Learning. It involves analyzing WSDA Music's financial data to identify discrepancies in transactions between the years 2011 and 2012.

The goal is to:
- Identify suspicious transactions or individuals
- Pinpoint discrepancies that may have led to missing funds
- Uncover patterns that could reveal financially motivated activities

## Challenges
The project is divided into three main challenges:

### Challenge 1: High-Level Context Queries
1. Determine the number of transactions between 2011 and 2012.
2. Calculate the total revenue for the period.

### Challenge 2: Targeted Customer and Employee Analysis
1. List customers who made purchases between 2011 and 2012.
2. Find customers, their sales reps, and transaction totals.
3. Identify transactions above the average transaction amount.
4. Calculate average transaction amounts by year.

### Challenge 3: Employee-Focused Financial Analysis
1. List employees whose sales exceeded the average transaction amount.
2. Calculate a 15% commission payout for each employee.
3. Identify the employee with the highest commission and their customers.
4. Determine the customer with the highest purchase and check for suspicious data.

## Key Findings
Based on the analysis, i
identified and suspect that employee ID 3 may have been involved in the discrepancies. Further action is recommended to investigate transactions associated with this individual.

## Technologies Used
SQL for data querying and analysis.
SQLite as the database platform.

## How to Run the Queries
1. Clone this repository to your local machine:
git clone https://github.com/Konduru96/SQL--Portfolio.git
2. Open the .db file (data/WSDA_Music.db) in an SQLite viewer like DB Browser for SQLite or your preferred SQL environment.
3. Load and execute the queries from the challenges.sql file in sequence.
4. Review the analysis and findings in the analysis.md file.

## Credits
This project was completed as part of the LinkedIn Learning course **SQL Essential Training** with Walter Shields.
