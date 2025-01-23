# SQL hasta en la sopa

SQL: Structured Query Language.

Tiene una estructura muy clara y muy fija.

Lenguaje que utilizamos para comunicarnos con los manejadores de bases de datos.

NoSQL: Not Only SQL

#### Database (Schemas)

Almacén de datos, esquema de base de datos, conformado por distintas tablas

#### Table (Tablas de entidades y relaciones)

Tabla que relaciona entidades con propiedades.

#### View (Presentación de la información)

Presentación de la información de una manera coherente, que tienen capacidad de ser leido por el ser humano y darle un sentido.

SQL tiene dos grandes rubros o sublenguajes:

- **DDL** (Data Definition Language)
- **DML** (Data Modification Language)

## DDL (Data Definition Language)

### Create (Crear)

#### Crear una base de datos (Schema)

```sql
CREATE DATABASE test_db;

USE DATABASE test_db;
```

```sql
CREATE SCHEMA 'platziblog' DEFAULT CHARACTER SET utf8;
USE DATABASE platziblog;
```

#### Crear una tabla

```sql
CREATE TABLE people (
  person_id int,
  last_name varchar(255),
  fist_name varchar(255),
  address varchar(255),
  city varchar(255)
);
```

#### Crear una vista

Las vistas toman datos de las bases de datos, les dan un formato persistente.

```sql
CREATE VIEW v_brasil_customers AS
  SELECT customer_name,
contact_name
  FROM customers
  WHERE country = "Brasil";
```


### Alter (Editar/Modificar)

Crear columna:

```sql
ALTER TABLE people
ADD date_of_birth date;

ALTER TABLE people
ALTER COLUMN date_of_birth year;

ALTER TABLE people
DROP COLUMN date_of_birth;
```

Borrar columna:

```sql
ALTER TABLE `platziblog`.`people` 
DROP COLUMN `date_of_birth`;
```

### Drop (Borrar)

Drop es la sentencia mas peligrosa si no sabes manejarla o no tienes cuidado de lo que estas haciendo

```sql
DROP TABLE people;

DROP DATABASE test_db;

DROP TABLE `platziblog`.`people`;

DROP DATABASE `platziblog`;
```

## DML (Data Manipulation Language)

### Insert (Insertar)

Inserta, agrega un nuevo registro o tupla a la tabla en la base de datos.

```sql
INSERT INTO peope (last_name, first_name, address, city)

VALUES ('Hernandez', 'Laura', 'Calle 21', 'Monterrey');
```

### Update (Actualizar)

```sql
-- Esta sentencia nos dice que cambiará los atributos last_name y city en la fila en donde el atributo person_id sea igual a 1
UPDATE people
SET last_name = 'Chavez', city= 'Mérida'
WHERE person_id = 1;

-- Esta otra nos dice que cambiará el atributo first_name en todas las filas que tengan el atrbuto city igual a Mérida.
UPDATE people
SET first_name = 'Juan'
WHERE city = 'Mérida';

-- Esta sentencia es mas ambigua en su sintaxis, ya que no tiene la parte del _where_ y por lo tanto también algo peligrosa, ya que cambiaría el atributo first_name en todas las filas de la tabla
UPDATE people
SET first_name = 'Juan';
```

### Delete (Borrar)

```sql
-- Se borra la fila donde el atributo persona_id es igual a 1
DELETE FROM people
WHERE persona_id = 1;

DELETE FROM people;
```

### Select (Seleccionar)

```sql
SELECT first_name, last_name
FROM people;
```

## ¿Qué tan estándar es SQL?

```sql
CREATE TABLE people (
  person_id int,
  last_name varchar(255),
  first_name varchar(255),
  address varchar(255),
  city varchar(255)
)

INSERT INTO people (last_name, first_name, address, city)
VALUES ('Hernandez', 'Hilda', 'Hidalgo 339', 'Ciudad Fernandez')

SELECT first_name, last_name
FROM people;

DROP TABLE people;
```

Hacemos lo mismo pero en GCP (Google cloud platform)

## Tablas independientes

Son tablas que no contienen claves foraneas, existen sin ninguna ligadura con identificadores.

> Se recomienda trabajar sin los caracteres ñ y acentos, ya que puede causar algunos problemas

```sql
CREATE TABLE `platziblog_db`.`new_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `platziblog_db`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `platziblog_db`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```

## Tablas dependientes

Tablas que tienen dependencia a la clave primaria de otra tabla, la cual se agrega a la misma tabla con el nombre foreign key o clave foranea

## Tablas transitivas