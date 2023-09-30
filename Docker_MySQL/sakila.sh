#!/bin/bash

#Utiliza el comando docker cp para copiar el archivo SQL 
#de inserción de datos desde tu sistema local al contenedor MySQL. 

docker cp mysql-sakila-db/mysql-sakila-schema.sql Data_Base:/mysql-sakila-schema.sql
docker cp mysql-sakila-db/mysql-sakila-insert-data.sql Data_Base:/mysql-sakila-insert-data.sql
docker cp mysql-sakila-db/mysql-sakila-drop-objects.sql Data_Base:/mysql-sakila-drop-objects.sql
docker cp mysql-sakila-db/mysql-sakila-delete-data.sql Data_Base:/mysql-sakila-delete-data.sql

# Paso 2: Asegúrate de dar permisos de ejecución al archivo. 
# Puedes hacerlo con el siguiente comando en la terminal:
# chmod +x sakila.sh

# Para ejecutar el script y crear el contenedor MySQL, 
# simplemente ejecuta el archivo con el siguiente comando:
# ./sakila.sh