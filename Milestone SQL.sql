--1.Average Salary by Industry and Gender
SELECT DISTINCT(Industry),Gender,ROUND(AVG(Annual_Salary),0) AS average_salary
FROM Survey_Salary_Data
GROUP BY Industry, Gender
ORDER BY average_salary DESC
LIMIT 10;

--2.Total Salary Compensation by Job Title
SELECT Job_Title,SUM(Annual_Salary + Additional_Monetary_Compensation) AS Total_Compensation
FROM Survey_Salary_Data
GROUP BY Job_Title
ORDER BY Total_Compensation DESC
LIMIT 10;

--3.Salary Distribution by Education Level
SELECT Highest_Level_of_Education_Completed AS education_level,
ROUND(AVG(Annual_Salary),0) AS average_salary,MIN(Annual_Salary) AS minimum_salary,MAX(Annual_Salary) AS maximum_salary
FROM Survey_Salary_Data
GROUP BY Highest_Level_of_Education_Completed
ORDER BY average_salary DESC;

--4.Number of Employees by Industry and Years of Experience
SELECT DISTINCT(Industry),Years_of_Professional_Experience_Overall AS experience_years,
COUNT(Employee_ID) AS employee_count
FROM Survey_Salary_Data
GROUP BY Industry,experience_years
ORDER BY employee_count DESC
LIMIT 10;

--5.Median Salary by Age Range and Gender
SELECT Age_Range, Gender, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Annual_Salary) AS median_salary
FROM Survey_Salary_Data
GROUP BY Age_Range, Gender
ORDER BY median_salary DESC;


--6.Job Titles with the Highest Salary in Each Country
SELECT DISTINCT ON (Country) Country,Job_Title,Annual_Salary
FROM Survey_Salary_Data
GROUP BY Country,Job_Title,Annual_Salary
ORDER BY Annual_Salary DESC
LIMIT 10;


--7.Average Salary by City and Industry
SELECT City,Industry,ROUND(AVG(Annual_Salary),0) AS average_salary
FROM Survey_Salary_Data
GROUP BY City, Industry
ORDER BY average_salary
LIMIT 10;


--8.Percentage of Employees with Additional Monetary Compensation by Gender
SELECT Gender,ROUND((COUNT(CASE WHEN Additional_Monetary_Compensation > 0 THEN 1 END) * 100.0) / COUNT(Employee_ID),0) AS percentage_with_compensation
FROM Survey_Salary_Data
GROUP BY Gender;

--9.Total Compensation by Job Title and Years of Experience
SELECT Job_Title,Years_of_Professional_Experience_Overall ,
SUM(Annual_Salary + Additional_Monetary_Compensation) AS Total_Compensation
FROM Survey_Salary_Data
GROUP BY Job_Title, Years_of_Professional_Experience_Overall
ORDER BY Total_Compensation DESC
LIMIT 10;



--10.Average Salary by Industry, Gender, and Education Level
SELECT Industry,Gender,Highest_Level_of_Education_Completed,ROUND(AVG(Annual_Salary),0) AS average_salary
FROM Survey_Salary_Data
GROUP BY Industry, Gender, Highest_Level_of_Education_Completed
LIMIT 10;