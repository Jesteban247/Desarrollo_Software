-- Sales by territory
SELECT 
    DS.country_region_code AS Territory,
    ROUND(SUM(FS.total), 2) AS TotalSales
FROM fact_sales FS
JOIN dim_store DS ON FS.store_id = DS.store_id
GROUP BY DS.country_region_code
ORDER BY TotalSales DESC;


-- Top product (profit)
SELECT 
    DP.name AS Product,
    SUM(FS.total) AS TotalSales
FROM fact_sales FS
JOIN dim_product DP ON FS.product_id = DP.product_id
GROUP BY DP.name
ORDER BY TotalSales DESC
LIMIT 1;


-- Top Product (sales quantity)
SELECT 
    DP.name AS Product,
    COUNT(*) AS QuantitySold
FROM fact_sales FS
JOIN dim_product DP ON FS.product_id = DP.product_id
GROUP BY DP.name
ORDER BY QuantitySold DESC
LIMIT 1;


-- Total orders by category
SELECT 
    DC.name AS Category,
    COUNT(DISTINCT FS.sale_id) AS TotalOrders
FROM fact_sales FS
JOIN dim_product DP ON FS.product_id = DP.product_id
JOIN dim_subcategory DS ON DP.subcategory_id = DS.subcategory_id
JOIN dim_category DC ON DS.category_id = DC.category_id
GROUP BY DC.name
ORDER BY TotalOrders DESC;

-- Total orders by sub_category
SELECT 
    DS.name AS Sub_category,
    COUNT(DISTINCT FS.sale_id) AS TotalOrders
FROM fact_sales FS
JOIN dim_product DP ON FS.product_id = DP.product_id
JOIN dim_subcategory DS ON DP.subcategory_id = DS.subcategory_id
GROUP BY DS.name
ORDER BY TotalOrdenes DESC;

-- Total sales by year and month
SELECT 
    YEAR(FS.date_) AS Year,
    MONTH(FS.date_) AS Month,
    ROUND(SUM(FS.total), 2) AS TotalSales
FROM fact_sales FS
GROUP BY YEAR(FS.date_), MONTH(FS.date_)
ORDER BY Year, Month;







