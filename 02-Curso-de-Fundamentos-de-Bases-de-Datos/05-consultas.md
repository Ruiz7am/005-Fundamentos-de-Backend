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

Where es la sentencia que nos ayuda a filtrar tuplas o registros

```sql
SELECT *
FROM posts
WHERE id<50;
```

