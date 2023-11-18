# Proyecto Final - Bodega de Datos para AdventureWorks

## Introducción

Este proyecto del curso tiene como objetivo desarrollar una bodega de datos para AdventureWorks, una multinacional dedicada a la venta de bicicletas. El proyecto utiliza SQL y Docker para crear un entorno de base de datos replicable y gestionable.

## Configuración del Entorno

Para configurar y ejecutar el proyecto, sigue estos pasos en la terminal dentro de la carpeta `Final_Project`:

### Creación del Contenedor MySQL

1. **Configura el Script de Creación del Contenedor**:
Primero, revisa el archivo **create_mysql_container.sh**, que contiene los comandos para crear el contenedor de MySQL.

2. **Da Permisos de Ejecución al Archivo**:
Ejecuta el siguiente comando para dar permisos:
`chmod +x create_mysql_container.sh`

3. **Ejecuta el Script:**
Luego, inicia el script con:
`./create_mysql_container.sh`

### Ejecución del Contenedor MySQL

1. **Configura el Script de Ejecución del Contenedor**:
Revisa el archivo **run_mysql_container.sh**, que va a permitir corre un contenedor en especifico-

2. **Da Permisos de Ejecución al Archivo**:
Asigna permisos de ejecución con:
`chmod +x run_mysql_container.sh`

3. **Ejecuta el Script:**
Para correr el contenedor, ejecuta:
`./run_mysql_container.sh`
Esto mostrará una lista de contenedores. Elige el contenedor: "Final" e ingresa la contraseña: "secret". Si no funciona a la primera, vuelvelo a intentar eso pasa mientras se cargan los procesos, a la tercera ya se debe poder ingresar a la consola de MySQL.
