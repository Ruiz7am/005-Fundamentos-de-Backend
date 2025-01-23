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
SELECT * FROM users;

SELECT user_name AS nombre, user_lastname AS apellido, cel_number AS celular FROM users;

SELECT COUNT(*) AS numero_de_usuarios FROM users;


```