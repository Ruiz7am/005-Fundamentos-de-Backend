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