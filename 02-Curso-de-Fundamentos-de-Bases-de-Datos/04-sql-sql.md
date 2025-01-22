# SQL hasta en la sopa

SQL: Structured Query Language.

Tiene una estructura muy clara y muy fija.

Lenguaje que utilizamos para comunicarnos con los manejadores de bases de datos.

NoSQL: Not Only SQL

SQL tiene dos grandes rubros o sublenguajes:

- DDL (Data Definition Language) Create.
- 

## DDL (Data Definition Language)

#### Database (Schemas)

Almacén de datos, esquema de base de datos, conformado por distintas tablas

#### Table (Tablas de entidades y relaciones)

Tabla que relaciona entidades con propiedades.

#### View (Presentación de la información)

Presentación de la información de una manera coherente, que tienen capacidad de ser leido por el ser humano y darle un sentido.

### Create (Crear)

Crear una base de datos:

```sql
CREATE DATABASE test_db;

USE DATABASE test_db;
```

```sql
CREATE SCHEMA 'platziblog' DEFAULT CHARACTER SET utf8;
USE DATABASE platziblog;
```

```sql
CREATE TABLE people (
  person_id int,
  last_name varchar(255),
  fist_name varchar(255),
  address varchar(255),
  city varchar(255)
);
```

```sql
CREATE VIEW v_brasil_customers AS
  SELECT customer_name,
contact_name
  FROM customers
  WHERE country = "Brasil";
```

Las vistas toman datos de las bases de datos, les dan un formato persistente.

### Alter (Editar/Modificar)

### Drop (Borrar)

