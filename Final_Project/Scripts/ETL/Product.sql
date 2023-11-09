INSERT INTO DATAWH.dim_category (category_id, name)
SELECT 
    ProductCategoryID, 
    Name
FROM ADW.Production_ProductCategory;

INSERT INTO DATAWH.dim_subcategory (subcategory_id, name, category_id)
SELECT 
    ProductSubcategoryID, 
    Name, 
    ProductCategoryID
FROM ADW.Production_ProductSubcategory;

INSERT INTO DATAWH.dim_product (product_id, name, subcategory_id, price)
SELECT 
    ProductID, 
    Name, 
    ProductSubcategoryID, 
    ListPrice
FROM ADW.Production_Product;
