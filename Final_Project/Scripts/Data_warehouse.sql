-- Crear la base de datos de la bodega de datos si no existe
CREATE DATABASE IF NOT EXISTS DATAWH;

-- Usar la base de datos de la bodega de datos
USE DATAWH;

-- Crear las Tablas
source /Scripts/TABLES/Sales.sql
source /Scripts/TABLES/Human_Resources.sql

-- Importar los datos
source /Scripts/ETL/Sales.sql
source /Scripts/ETL/Human_Resources.sql
