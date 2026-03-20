# Portal Noticias

Proyecto desarrollado en PHP nativo, MySQL, HTML, CSS y JavaScript, siguiendo una arquitectura MVC con capa de servicios y configuración mediante archivo `.env`.

El sistema permite visualizar un listado de noticias y acceder al detalle de cada una, ejecutándose localmente sin necesidad de XAMPP, usando el servidor embebido de PHP.

---

## Tecnologías utilizadas

- PHP 8+
- MySQL o MariaDB
- HTML5
- CSS3
- JavaScript
- PDO
- Arquitectura MVC manual
- Archivo `.env` para configuración local


## Instalación del proyecto.
- Verificar tener mysql y php y sus versiones con:
```
 php -v
 mysql --version
```
- En caso de no tener ninguna de las dos
- Entrar a mysql desde la terminal:
```
mysql -u root -p
```
- Ingresar la contraseña de mysql en caso de tener y luego ejecutar el siguiente comando para crear la base de datos:
```
source "RUTA DE ARCHIVO export/portal_noticias.sql" (sin comillas)
```
Ejemplo:
```
SOURCE C:/Users/USUARIO/Desktop/portal-noticias/database/export/portal_noticias.sql;
```
- Copiar o cambiar nombre del archivo .env.example a .env y ajustar datos de las variables de entorno según corresponda
- Ejecutar el siguiente comando para poder servir el proyecto en localhost desde el folder principal:
```
php -S localhost:8000 -t public
```
- Abrir localhost:8000 y navegar

## Estructura del proyecto

```text
portal-noticias/
├── .env
├── .env.example
├── .gitignore
├── README.md
├── app/
│   ├── config/
│   ├── controllers/
│   ├── models/
│   ├── services/
│   └── views/
├── public/
│   ├── index.php
│   └── assets/
├── export/
└── docs/