-- Creación de tablas de dimensiones para 'Sales'

-- Categoría de productos
CREATE TABLE dim_category (
  category_id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Subcategoría de productos
CREATE TABLE dim_subcategory (
  subcategory_id INT PRIMARY KEY,
  name VARCHAR(255),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

-- Productos
CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  name VARCHAR(255),
  subcategory_id INT,
  price DECIMAL(10,2),
  FOREIGN KEY (subcategory_id) REFERENCES dim_subcategory(subcategory_id)
);

-- Tiendas
CREATE TABLE dim_store (
  store_id INT PRIMARY KEY,
  name VARCHAR(255),
  country_region_code VARCHAR(3)
);

-- Fact sales
CREATE TABLE fact_sales (
  sale_id INT PRIMARY KEY,
  product_id INT,
  store_id INT,
  date_ datetime(6), -- No pude convertirlo con el order date
  unit_price DECIMAL(19,4),
  discount DECIMAL(19,4),
  total DECIMAL(38,6),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

