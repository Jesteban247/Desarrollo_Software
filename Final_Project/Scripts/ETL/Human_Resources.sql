-- ETL para departamentos
INSERT INTO DATAWH.dim_department (department_id, name_)
SELECT DISTINCT 
    DepartmentID, 
    Name
FROM ADW.HumanResources_Department;

-- ETL para fact_employee
INSERT INTO DATAWH.fact_employee (employee_id, gender, job_title, hire_date, department_id)
SELECT DISTINCT 
    HE.BusinessEntityID as employee_id,
    HE.Gender as gender,
    HE.JobTitle as job_title,
    HE.HireDate as hire_date,
    HEDH.DepartmentID as department_id
FROM ADW.HumanResources_Employee HE
INNER JOIN ADW.HumanResources_EmployeeDepartmentHistory HEDH
    ON HE.BusinessEntityID = HEDH.BusinessEntityID;

