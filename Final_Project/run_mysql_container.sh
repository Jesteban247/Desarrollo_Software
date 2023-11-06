#!/bin/bash

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Por favor, instala Docker antes de continuar."
    exit 1
fi

# Listar contenedores disponibles
echo "Contenedores disponibles:"
docker ps -a

# Solicitar el nombre del contenedor MySQL
read -p "Ingrese el nombre del contenedor MySQL al que desea conectarse: " container_name


# Conectar a la base de datos MySQL utilizando el archivo de opciones seguro
docker exec -it $container_name mysql -h localhost -u root -p
# Paso 2: Asegúrate de dar permisos de ejecución al archivo. 
# Puedes hacerlo con el siguiente comando en la terminal:
# chmod +x run_mysql_container.sh

# Para ejecutar el script y crear el contenedor MySQL, 
# simplemente ejecuta el archivo con el siguiente comando:
# ./run_mysql_container.sh
