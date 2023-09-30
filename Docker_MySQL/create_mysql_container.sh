#!/bin/bash

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Por favor, instala Docker antes de continuar."
    exit 1
fi

# Definir variables
container_name="Data_Base"
tag="latest"
root_password="secret"

# Crear y ejecutar el contenedor MySQL
docker run --name $container_name -e MYSQL_ROOT_PASSWORD=$root_password -d mysql:$tag

# Paso 2: Asegúrate de dar permisos de ejecución al archivo. 
# Puedes hacerlo con el siguiente comando en la terminal:
# chmod +x create_mysql_container.sh

# Para ejecutar el script y crear el contenedor MySQL, 
# simplemente ejecuta el archivo con el siguiente comando:
# ./create_mysql_container.sh