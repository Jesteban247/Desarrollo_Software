# Proyecto Final - Bodega de Datos para AdventureWorks

## Introducción

Este proyecto del curso tiene como objetivo desarrollar una bodega de datos para AdventureWorks, una multinacional dedicada a la venta de bicicletas. El proyecto utiliza SQL y Docker para crear un entorno de base de datos replicable y gestionable.

## Documentos
En la siguiente carpeta se encuentra la documentacion acerca de los procesos que se hicieron para la bodega de datos. [Documentos](https://github.com/Jesteban247/Desarrollo_Software/tree/main/Final_Project/Docs "Documentos")


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
Esto mostrará una lista de contenedores. Elige el contenedor: **"Final"** e ingresa la contraseña: **"secret"**. 

4. **Ojo**
Pueden surgir 2 errores, Primero que ya este todo creado pero el contenedor sin inicializar, entonces ejecuta:
`docker start nombre_del_contenedor`
Segundo, puede que despues de ingresar la contraseña no funciona a la primera, vuelvelo a intentar eso pasa mientras se cargan los procesos, a la tercera ya se debe poder ingresar a la consola de MySQL.

## Ejecución y Uso del Proyecto en SQL

Una vez en la terminal de SQL, procederemos a configurar la base de datos y realizar las consultas.

### Importación de la Base de Datos

Dentro de la carpeta `Scripts`, encontrarás todo lo relacionado con SQL y el proyecto. Recuerda que ya debes estar en la consola de comandos de SQL.

1. **Cargar AdventureWorks2019**:
   Para importar la base de datos, ejecuta:
  ` source /Scripts/Load_Data.sql`
Espera mientras se completa la carga.

2. ** Creación del Data Warehouse y Tablas**:
Para crear el data warehouse y las tablas necesarias, además de ejecutar el proceso ETL, usa:
`source /Scripts/Data_warehouse.sql`

3. **Consultas y Análisis**:
Las consultas están divididas por dimensiones y se relacionan con los reportes de Power BI.

- Consultas de Ventas:
Ejecuta las siguientes consultas de ventas con:
`source /Scripts/Queries/Sales.sql`

- Consultas de Recursos Humanos:
Para consultas de recursos humanos, utiliza:
`source /Scripts/Queries/Human_Resources.sql`
