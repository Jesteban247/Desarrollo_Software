-- Employees by Department
SELECT 
    DD.name_ AS Department,
    COUNT(FE.employee_id) AS NumberOfEmployees
FROM fact_employee FE
JOIN dim_department DD ON FE.department_id = DD.department_id
GROUP BY DD.name_
ORDER BY NumberOfEmployees DESC;

-- Employees by Gender
SELECT 
    FE.gender AS Gender,
    COUNT(FE.employee_id) AS NumberOfEmployees
FROM fact_employee FE
GROUP BY FE.gender
ORDER BY NumberOfEmployees DESC;


-- Employees by Job Title
SELECT 
    FE.job_title AS JobTitle,
    COUNT(FE.employee_id) AS NumberOfEmployees
FROM fact_employee FE
GROUP BY FE.job_title
ORDER BY NumberOfEmployees DESC;
