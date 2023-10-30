-- Crear la tabla DIM_EMPLOYEE
CREATE TABLE DIM_EMPLOYEE (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255),
    Position VARCHAR(100)
);

-- Crear la tabla DIM_DEPARTMENT
CREATE TABLE DIM_DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255),
    Location VARCHAR(255)
);

-- Crear la tabla FACT_HUMAN_RESOURCES
CREATE TABLE FACT_HUMAN_RESOURCES (
    EmployeeID INT PRIMARY KEY,
    Department INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES DIM_EMPLOYEE(EmployeeID),
    FOREIGN KEY (Department) REFERENCES DIM_DEPARTMENT(DepartmentID)
);