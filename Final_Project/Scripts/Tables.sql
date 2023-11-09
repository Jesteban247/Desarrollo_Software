-- Dimensiones

CREATE TABLE dim_category (
  category_id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE dim_subcategory (
  subcategory_id INT PRIMARY KEY,
  name VARCHAR(255),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  name VARCHAR(255),
  subcategory_id INT,
  price DECIMAL(10,2),
  FOREIGN KEY (subcategory_id) REFERENCES dim_subcategory(subcategory_id)
);


CREATE TABLE dim_supplier (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255)
);

CREATE TABLE dim_customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255),
  gender VARCHAR(10)
);


CREATE TABLE dim_department (
  department_id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE dim_position (
  position_id INT PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE dim_employee (
  employee_id INT PRIMARY KEY,
  name VARCHAR(255),
  department_id INT,
  position_id INT,
  FOREIGN KEY (department_id) REFERENCES dim_department(department_id),
  FOREIGN KEY (position_id) REFERENCES dim_position(position_id)
);


CREATE TABLE dim_store (
  store_id INT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255)
);


CREATE TABLE dim_location (
  location_id INT PRIMARY KEY,
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255)
);


CREATE TABLE dim_date (
  date_id INT PRIMARY KEY,
  date DATE,
  day VARCHAR(10),
  month VARCHAR(10),
  year INT,
  day_of_week VARCHAR(10),
  holiday BOOLEAN
);

-- Tablas de Hechos

CREATE TABLE fact_sales (
  sale_id INT PRIMARY KEY,
  product_id INT,
  customer_id INT,
  employee_id INT,
  store_id INT,
  date_id INT,
  quantity_sold INT,
  revenue DECIMAL(10,2),
  discount DECIMAL(10,2),
  tax DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
  FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id),
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

CREATE TABLE fact_human_resources (
  employee_id INT PRIMARY KEY,
  department_id INT,
  position_id INT,
  hire_date_id INT,
  salary DECIMAL(10,2),
  FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id),
  FOREIGN KEY (department_id) REFERENCES dim_department(department_id),
  FOREIGN KEY (position_id) REFERENCES dim_position(position_id),
  FOREIGN KEY (hire_date_id) REFERENCES dim_date(date_id)
);

CREATE TABLE fact_inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT,
  location_id INT,
  date_id INT,
  quantity INT,
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);

CREATE TABLE fact_purchasing (
  purchase_id INT PRIMARY KEY,
  product_id INT,
  supplier_id INT,
  date_id INT,
  quantity INT,
  total_cost DECIMAL(10,2),
  purchase_price DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
  FOREIGN KEY (supplier_id) REFERENCES dim_supplier(supplier_id),
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
