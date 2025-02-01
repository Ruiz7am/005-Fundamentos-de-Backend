# Consultas a una base de datos

## ¿Porqué las consultas son tan importantes?

Con consultas bien hechas se pueden conseguir cosas muy impresionantes.

## Estructura básica de un Query

Los queries (consultas), son un pilar fundamental en una base de datos, ya que estas, mediante nuestra estructura previamente construida, con sus constrains o restricciones, podemos manipular y entregar de cierta forma la inforamción rquerida.

Los queries pueden ser muy simples o muy complejos dependiendo de las necesidades del frontend

Los queries tiene dos partes obligatorias:

- SELECT
- FROM

Y una parte opcional:

- WHERE

```sql
SELECT city, count(*) AS total
FROM people
WHERE active = true
GROUP BY city
ORDER BY total DESC
HAVING total >= 2;
```

## SELECT

Este comando en pocas palabras lo que hace es proyectar, mostrar de cierta forma la información.

```sql
-- El asterisco, asi como en muchos sistemas y lenguajes, es un wildcard para referenciar a todo
SELECT * FROM users;

SELECT user_name AS nombre, user_lastname AS apellido, cel_number AS celular FROM users;

SELECT COUNT(*) AS numero_de_usuarios FROM users;


```

## FROM

Este comando indica de donde vamos a solicitar información, de que tablas se obtendran los datos.


## JOIN

Otro de los comandos es JOIN, el cual va muy relacionado con FROM

> Teoria de conjuntos y diagramas de ben

### Diferencia

![diferencias](./assets/Screenshot%202025-01-24%20194517.png)

### Intersección

![interseccion](./assets/Screenshot%202025-01-24%20194757.png)

### Unión y diferencia simétrica

![union](./assets/Screenshot%202025-01-24%20194914.png)

## Utilizando la sentencia FROM


### Con LEFT JOIN

```sql
SELECT *
FROM usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuario_id;
```

```sql
SELECT *
FROM usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;
```

### Con RIGHT JOIN

```sql
SELECT *
FROM usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuario_id;
```

```sql
SELECT *
FROM usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;
```

### Con INNER JOIN

```sql
SELECT *
FROM usuarios
 INNER JOIN posts ON usuario.id = posts.usuario_id;
```

### Con FULL OUTER JOIN


```sql
SELECT *
FROM usuarios
 FULL OUTER JOIN posts ON usuario.id = posts.usuario_id;
```

### Con UNION

```sql
SELECT *
FROM usuarios
 LEFT JOIN posts ON usuario.id = posts.usuario_id
 UNION
 SELECT *
 FROM usuarios
 RIGHT JOIN posts ON usuarios.id = posts.usuario_id;;
```

```sql
SELECT *
FROM usuarios
 LEFT JOIN posts ON usuario.id = posts.usuario_id
 WHERE posts.usuario_id IS NULL
 UNION
 SELECT *
 FROM usuarios
 RIGHT JOIN posts ON usuarios.id = posts.usuario_id
 WHERE posts.usuario_id IS NULL;
```

## WHERE

Where es la sentencia que nos ayuda a filtrar tuplas o registros (rows)

En el siguiente ejemplo incluirá del 49 hacia abajo
```sql
SELECT *
FROM posts
WHERE id<50;
```

En el siguiente ejemplo incluirá del 50 hacia abajo
```sql
SELECT *
FROM posts
WHERE id<=50;
```

En el siguiente ejemplo incluirá del 51 hacia arriba
```sql
SELECT *
FROM posts
WHERE id>50;
```

En el siguiente ejemplo incluirá del 50 hacia arriba
```sql
SELECT *
FROM posts
WHERE id>=50;
```

```sql
SELECT *
FROM posts
WHERE estatus = 'activo';
```

```sql
SELECT *
FROM posts
WHERE estatus = 'inactivo';
```

```sql
SELECT *
FROM posts
WHERE estatus != 'inactivo';
```

```sql
SELECT *
FROM posts
WHERE id != 50;
```

Cuando no se conoce la cadena exacta:

En medio
```sql
SELECT *
FROM posts
WHERE titulo LIKE %escandalo%;
```

Al principio
```sql
SELECT *
FROM posts
WHERE titulo LIKE escandalo%;
```

Al final
```sql
SELECT *
FROM posts
WHERE titulo LIKE %escandalo;
```

```sql
SELECT *
FROM posts
WHERE fecha_publicacion > '2025-01-01';
```

```sql
SELECT *
FROM posts
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31;
```

```sql
SELECT *
FROM posts
WHERE id BETWEEN 50 AND 60;
```

```sql
SELECT *
FROM posts
WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';
```

```sql
SELECT *
FROM posts
WHERE MONTH(fecha_publicacion) = '04';
```

### WHERE con valores nulos y no nulos

```sql
SELECT *
FROM posts
WHERE usuario_id IS NULL;
```

```sql
SELECT *
FROM posts
WHERE categoria_id IS NULL;
```

```sql
SELECT *
FROM posts
WHERE usuario_id IS NOT NULL;
```

```sql
SELECT *
FROM posts
WHERE ususario_id IS NOT NULL
AND estatus = 'activo'
AND id < 50
AND categoria_id = 2
AND YEAR(fecha_publicacion) = '2025';
```

## GROUP BY

```sql
SELECT estatus, COUNT(*) post_quantity
FROM posts
GROUP BY estatus;
```

```sql
SELECT YEAR(fecha_publicación) AS post_year, count(*) AS post_quantity
FROM posts
GROUP BY post_year;
```

```sql
SELECT MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_month;
```

```sql
SELECT estatus, MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month;
```

## ORDER BY y HAVING

### ORDER BY

```sql
SELECT *
FROM posts
-- ASC = ascending DESC = descendig
ORDER BY fecha_publicacion ASC;
```

Cuando se hace una consulta y la informacion son strings lo va a organizar de manera alfabetica.

```sql
SELECT *
FROM posts
ORDER BY titulo DESC;
```

```sql
SELECT *
FROM posts
ORDER BY user_id DESC;
```

```sql
SELECT *
FROM posts
ORDER BY fecha_publicacion ASC
LIMIT 5;
```

### HAVING

No es muy utilizada pero hay casos. Tiene un poco de similitud con WHERE

```sql
SELECT MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS post_quantity
FROM posts
WHERE post_quantity > 1
GROUP BY estatus, post_month
ORDER BY post_month;
```

En esta consulta nos da un error ya que no encuentra la columna post_quantity

```sql
SELECT MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month
HAVING post_quantity > 1
ORDER BY post_month;
```

En esta otra se sustituye WHERE por HAVING. esta sentencia lo que tiene de diferencia es que hace la consulta en los campos dinamicos ya que se agrupo de cierta forma.

## El interminable agujero de conejo (nested quieries)

Nested queries, Consultas anidadas o subqueries, con esto es posible hacer quieries dentro de otros queries

Un cuero dentro de otro cuero
y puede ser infinito

Query
  Query
    Query
      Query
        Query
          Query
            Query
              Query
                Query
                  Query

### Cuando ocupar los quieries anidados

Cuando hay un problema que no se puede solucionar simplemente consultando la tabla

Aporte de compañero:

![compa](./assets/Screenshot%202025-01-31%20224305.png)

## Como convertir una pregunta en un query sql

1. Lo que quieres mostrar = _**SELECT**_
2. De donde voy a tomar los datos = _**FROM**_
3. Los filtros de los datos que quieres mostrar = _**WHERE**_
4. Los rubros por los que me interas agrupar la información = _**GROUP BY**_
5. El orden en que quiero presentar mi información = _**ORDER BY**_
6. Los filtros que quiero que mis datos agrupados tengan = _**HAVING**_
## Preguntandole a la base de datos

