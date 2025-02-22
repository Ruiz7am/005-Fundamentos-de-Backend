# Configurar PostgreSQL

## Que aprenderas sobre PostgreSQL

- Instalarlo, configurarlo y crear una base de datos
- PL SQL
- Triggers y como crear réplicas para evitar bloqueos entre las tablas.

## ¿Qué es PostgreSQL?

Es un motor de base de datos.

En sus propias palabras:

> _**"The world's most advanced open source relational database"**_

Existen 3 conceptos importantes que rodean a las bases de datos:

1. El lenguaje
2. El motor
3. El servidor

El motor de base de datos es el que permite estructurar toda la información dentro de un servidor.

El servidor es un equipo de computo.

### Otros conceptos

- Open Source
- Objeto relacional
- Usa SQL
Desde 1986 (University of California at Berkeley)
- PostGIS
PL/PgSQL
- Cumple ACID (Atomicity, Consitency, Isolation, Durability)

### Por que PostgreSQL

- Tipos de datos
- Integridad de datos
- Concurrencia. Rendimiento
- Fiabilidad, recuperación ante desastres
- Seguridad
- Extensibilidad
- Internacionalización, busqueda de texto.

## Interacción con postgres desde la consola

### Comandos _Backslash_

Se utiliza el caracter _backslash_ `\` seguido de el/los caracter/es del comando

- `\?`: Lista todos los comandos y una descripción breve.
- `\l`: Lista las bases de datos.
- `\c <database>`: Se conecta a la base de datos especificada.
- `\dt`: Muestra las tablas de la base de datos a la que estamos conectados.
- `\d <table>`: Muestra las columnas de la tabla especificada.
- `\h`: Muestra los comandos de consulta.
- `\g`: Ejecuta el ultimo comando ejecutado.
- `\timing`: muestra el tiempo que tarda en ejecutarse una tarea.

## Interacción con postgres desde la interfaz gráfica

![psql-gui](./assets/Screenshot%202025-02-20%20134629.png)

## Archivos de Configuración

- postgresql.conf
- pg_hba.conf
- pg_ident.conf

## Comandos más utilizados en PostgreSQL

### Comandos de ayuda

- `\?` Con el cual podemos ver la lista de todos los comandos disponibles en consola, comandos que empiezan con backslash ( \ )
- `\h` Con este comando veremos la información de todas las consultas SQL disponibles en consola. Sirve también para buscar ayuda sobre una consulta específica, para buscar información sobre una consulta específica basta con escribir \h seguido del inicio de la consulta de la que se requiera ayuda, así: \h ALTER

### Comandos de navegación y consulta de información

- `\c` Saltar entre bases de datos
- `\l` Listar base de datos disponibles
- `\dt` Listar las tablas de la base de datos
- `\d` <nombre_tabla> Describir una tabla
- `\dn` Listar los esquemas de la base de datos actual
- `\df` Listar las funciones disponibles de la base de datos actual
- `\dv` Listar las vistas de la base de datos actual
- `\du` Listar los usuarios y sus roles de la base de datos actual

### Comandos de inspección y ejecución

- `\g` Volver a ejecutar el comando ejecutando justo antes
- `\s` Ver el historial de comandos ejecutados
- `\s` <nombre_archivo> Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano
- `\i` <nombre_archivo> Ejecutar los comandos desde un archivo
- `\e` Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. \e abre el editor de texto, escribir allí todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.
- `\ef` Equivalente al comando anterior pero permite editar también funciones en PostgreSQL

### Comandos para debug y optimización

- `\timing` Activar / Desactivar el contador de tiempo por consulta

### Comandos para cerrar la consola

- `\q` Cerrar la consola

## Ejecutando consultas en la base de datos usando la consola

```sql
CREATE DATABASE transporte;
```

```sh
\c transporte
```

```sql
CREATE TABLE tren(
  id serial NOT NULL,
  modelo character varying,
  capacidad integer,
  CONSTRAINT tren_pkey PRIMARY KEY (id)
);
```

```sh
\d tren
```

```sh
\d tren_id_seq
```

```sql
INSERT INTO tren( modelo, capacidad ) VALUES ('Volvo 1', 100);
```

```sql
SELECT * FROM tren;
```

```sql
UPDATE tren SET modelo = 'Honda 0726' WHERE id = 1;
```

```sql
SELECT * FROM tren;
```

```sql
DELETE FROM tren WHERE id = 1;
```

```sql
SELECT * FROM tren;
```

```sh
\timing
```

```sql
SELECT MD5('Vamos a encriptar este texto')
```

## Presentación del proyecto

_**Sistema de transporte masivo**_

- Pasajero
- Trayecto
- Estación
- Tren
- Viaje

## Tipos de datos

Postgres, al igual que otros motores, soporte diferentes tipos de datos, estan los comunes, que podemos encontrar en cualquier lenguaje de programación:

- Numéricos
- Monetarios
- Texto
- Binarios
- Fecha/Hora
- Boolean

Existen también otro tipo de datos que son propios de postrgres y que puede que no se encuentren en otras bases de datos:

- Geométricos (utilizando _X_ y _Y_ nos permite calcular distancias y áreas)
- Direcciones de red (direcciones ip, permite hacer cálculos de máscara de subred)
- Textos tipo bit (permite hacer cálculos en otros sistemas, ej. hexadecimal o binario)
- XML y JSON
- Arreglos 

## Diseñando nuestra base de datos: estructura de las tablas

Hacemos un diagrama de como será nuestra base de datos, las tablas y las relaciones entre ellas.

![diagrama-db](./assets/Screenshot%202025-02-21%20210759.png)

## Jerarquía de Bases de Datos

- **Servidor de base de datos**: Computadora que tiene un motor de base de datos instalado y en ejecución.
- **Motor de base de datos**: Software que provee un conjunto de servicios encargados de administrar una base de datos.
- **Base de datos**: Grupo de datos que pertenecen a un mismo contexto.
- **Esquema de base de datos en PostgreSQL**: Grupo de objetos de base de datos que guarda relación entre sí (tabla, funciones, relaciones, secuencias).
- **Tablas de base de datos**: Estructura que organiza los datos en filas y columnas formando una matríz.

PostgreSQL es un motor de base de datos.

La estructura de la base de datos diseñada para el proyecto del reto corresponde a los siguientes elementos:

Base de datos: _Transporte_  
Esquema: _Public_

El esquema público contiene las siguientes tablas:

- Estación
- Pasajero
- Tren

Y las tablas de relaciones entre cada uno de los elementos anteriores son:

- Trayecto
- Viaje

El esquema relacional entre las tablas corresponde al siguiente diagrama:

![diagrama](./assets/diagrama.webp)