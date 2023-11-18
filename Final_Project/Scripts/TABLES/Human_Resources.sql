-- Creación tablas de dimensiones para 'Human Resources'

-- Departamentos
CREATE TABLE dim_department (
  department_id INT PRIMARY KEY,
  name_ VARCHAR(255)
);

-- Fact sales
CREATE TABLE fact_employee (
    id_employee INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    gender VARCHAR(1),
    job_title VARCHAR(50),
    department_id INT,
    hire_date date,
  FOREIGN KEY (department_id) REFERENCES dim_department(department_id)
);