-- Crear la tabla DIM_CUSTOMER
CREATE TABLE DIM_CUSTOMER (
    CustomerKey INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerType VARCHAR(50),
    CustomerAddress VARCHAR(255),
    CustomerCity VARCHAR(100),
    CustomerState VARCHAR(50),
    CustomerPostalCode VARCHAR(20),
    CustomerCountry VARCHAR(100)
);

-- Crear la tabla DIM_DATE
CREATE TABLE DIM_DATE (
    DateKey INT PRIMARY KEY,
    Date DATE,
    DayOfWeek VARCHAR(20),
    Month VARCHAR(20),
    Quarter VARCHAR(10),
    Year INT,
    Holidays VARCHAR(255)
);

-- Crear la tabla DIM_PRODUCT
CREATE TABLE DIM_PRODUCT (
    ProductKey INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductCategory VARCHAR(50),
    ProductSubcategory VARCHAR(50),
    Manufacturer VARCHAR(100),
    ListPrice DECIMAL(10, 2)
);

-- Crear la tabla DIM_STORE
CREATE TABLE DIM_STORE (
    StoreKey INT PRIMARY KEY,
    StoreName VARCHAR(255),
    StoreAddress VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZIPCode VARCHAR(20),
    PhoneNumber VARCHAR(20)
);

-- Crear la tabla FACT_SALES
CREATE TABLE FACT_SALES (
    SalesID INT PRIMARY KEY,
    DateKey INT,
    StoreKey INT,
    ProductKey INT,
    CustomerKey INT,
    QuantitySold INT,
    SalesAmount DECIMAL(10, 2),
    FOREIGN KEY (DateKey) REFERENCES DIM_DATE(DateKey),
    FOREIGN KEY (StoreKey) REFERENCES DIM_STORE(StoreKey),
    FOREIGN KEY (ProductKey) REFERENCES DIM_PRODUCT(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES DIM_CUSTOMER(CustomerKey)
);