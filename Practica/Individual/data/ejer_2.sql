SELECT DISTINCT Title
FROM employees;

SELECT *
FROM employees
WHERE Title = "Sales Support Agent";

SELECT *
FROM employees
WHERE Title LIKE "%Agent%";