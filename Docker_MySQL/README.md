# Instalación de Docker en GitHub Codespaces

## Paso 1: Configurar Codespaces con Docker
1. Instala la extensión de Docker en Codespaces.
2. A continuación, instala Docker dentro de este entorno o verifica que esté instalado. Puedes usar el siguiente comando para hacerlo:
	`curl -fsSL https://get.docker.com | sh` 
	
## Paso 2: Verificar la instalación de Docker

1.  Para comprobar que Docker se ha instalado correctamente, puedes ejecutar el siguiente comando:
	`docker --version` 

	Deberías ver la versión de Docker instalada, lo que confirmaría que la instalación fue exitosa.

3.  También puedes ejecutar el siguiente comando para verificar que Docker pueda ejecutar contenedores sin problemas:
`docker run hello-world` 

	Si todo está configurado correctamente, deberías ver un mensaje que indica que Docker se ejecutó con éxito.
	
# Crear y Ejecutar un Contenedor de Base de Datos MySQL

## Paso 1: Crear Un contenedor
Crear y ejecutar un contenedor de base de datos MySQL es un proceso sencillo que implica ejecutar el siguiente comando:
`docker run --name <container_name> -e MYSQL_ROOT_PASSWORD=<root_password> -d mysql:<tag>` 

-   `<container_name>`: Es el nombre que deseas asignarle al contenedor, por ejemplo, `mysql-db`.
-   `<root_password>`: La contraseña que deseas configurar para el usuario root de la base de datos MySQL, por ejemplo, `mysql`.
-   `<tag>`: La etiqueta de la versión del contenedor de MySQL que deseas utilizar, por ejemplo, `latest`.

## Paso 2:  Conectar a la base de datos del contenedor de MySQL mediante línea de comandos

Para conectar a la base de datos  `mysql`, lo primero que hay que hacer es  **acceder a la shell del contenedor**:
`docker exec -it <container_name> bash`

A continuación, sólo hay que **conectar a la base de datos mysql** a través del cliente en línea de comandos:
`mysql -h <db_host> -u <username> -p`

-   `<db_host>`  es el nombre del servidor de la base de datos. Utiliza  **localhost**  o el nombre del servicio de la base de datos
-   `<username>`  es el usuario de la base de datos. Utiliza el usuario **root**

Te pedirá que introduzcas la contraseña que se puso en el paso anterior.

# Ejemplo

- [create_mysql_container.sh](create_mysql_container.sh): Este script se utiliza para crear un contenedor, pues cambiar su nombre y contraseña.

- Se usa la base de datos: https://github.com/jOOQ/sakila/tree/main
Se guarda la información en: [mysql-sakila-db](mysql-sakila-db)

- [sakila.sh](sakila.sh): Este script se utiliza para cargar la base de datos de sakila al contenedor.

- [run_mysql_container.sh](run_mysql_container.sh): Este script se utiliza para visualizar los contenedores existentes y poder usar el que se necesita.

- [Use_sakila.txt](Use_sakila.txt): Este script se utiliza para cargar los datos a MySQL.

- [sql_queries](sql_queries): Esta carpeta guarda las consultas a ejecutar.
