-- Crear la tabla DIM_LOCATION
CREATE TABLE DIM_LOCATION (
    LocationKey INT PRIMARY KEY,
    LocationName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZIPCode VARCHAR(20)
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

-- Crear la tabla FACT_INVENTORY
CREATE TABLE FACT_INVENTORY (
    InventoryID INT PRIMARY KEY,
    ProductKey INT,
    LocationKey INT,
    QuantityOnHand INT,
    ReorderPoint INT,
    MinimumStockLevel INT,
    FOREIGN KEY (ProductKey) REFERENCES DIM_PRODUCT(ProductKey),
    FOREIGN KEY (LocationKey) REFERENCES DIM_LOCATION(LocationKey)
);