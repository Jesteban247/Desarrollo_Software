-- ETL para dim_category
INSERT INTO DATAWH.dim_category (category_id, name)
SELECT DISTINCT 
    ProductCategoryID, 
    Name
FROM ADW.Production_ProductCategory;

-- ETL para dim_subcategory
INSERT INTO DATAWH.dim_subcategory (subcategory_id, name, category_id)
SELECT DISTINCT 
    ProductSubcategoryID, 
    Name, 
    ProductCategoryID
FROM ADW.Production_ProductSubcategory;

-- ETL para dim_product
INSERT INTO DATAWH.dim_product (product_id, name, subcategory_id, price)
SELECT DISTINCT 
    ProductID, 
    Name, 
    ProductSubcategoryID, 
    ListPrice
FROM ADW.Production_Product
WHERE ProductSubcategoryID IS NOT NULL;



-- ETL para dim_store
-- Utilizando la tabla Sales_SalesTerritory para obtener CountryRegionCode
INSERT INTO DATAWH.dim_store (store_id, name, country_region_code)
SELECT DISTINCT 
    TerritoryID,
    Name, 
    CountryRegionCode
FROM ADW.Sales_SalesTerritory;



-- ETL para fact_sales con CustomerID, omitiendo duplicados
INSERT INTO DATAWH.fact_sales (sale_id, product_id, store_id, date_, unit_price, discount, total)
SELECT DISTINCT 
    SOD.SalesOrderDetailID as sale_id,
    SOD.ProductID as product_id,
    SOH.TerritoryID as store_id,
    SOH.ShipDate as date_,
    SOD.UnitPrice as unit_price,
    SOD.UnitPriceDiscount as discount,
    SOD.LineTotal as total
FROM ADW.Sales_SalesOrderDetail SOD
INNER JOIN ADW.Sales_SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID;

