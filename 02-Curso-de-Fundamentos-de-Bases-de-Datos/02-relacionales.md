# Introducción a las bases de datos relacionales

## Entidades

Para comenzar a entender el concepto de base de datos, debemos comenzar con la unidad que la conforma, la entidad u objeto.
Hasta este punto ya debimos de haber pasado por la teoría y un poco de práctica de la programación orientada a objetos.
El paradigma de la POO nos dice que podemos tomar cualquier objeto del mundo real y representarlo de manera digital mediante el código, podemos representar también los atributos o propiedades que lo conforman, al ejercicio de convertir objetos de la vida real en objetos representados digitalmente se le denomina **Abrastacción** y es uno de los 4 fundamentos que conforman la POO.

> Las entidades se representan en plural:
>
> - Laptops
> - Automoviles
> - borregos
> - chivos
> - conejos
> - cerdos

Tenemos el ejemplo:

![objeto](./assets/Screenshot%202025-01-18%20172817.png)

En una laptop tenemos los siguientes atributos:

- Color
- Año
- Modelo
- No. de serie: Atributo _"llave"_ o _"clave"_ ID (del inglés _"key"_ ), es el atributo que nos permitirá diferenciar un objeto de otro que tenga los mismos atributos
- disco duro: se representa con doble linea porque puede tener más de 1, se les denomina atributo multivaluado.
- metodo de entrada: Atributo que se conforma de otros atributos, se les denomina atributos compuestos
  - trackpad
  - teclado
- antiguedad: atributo especial que se maneja de diferente forma que las demás
- pantalla

**Los atributos llave pueden ser de dos tipos:**

- **Claves Naturales**: atributos inherentes al objeto: El número de serie en nuestro ejemplo.
- **Claves Artificiales**: clave declarada por nosotros.

## Tipos de entidades

### Entidades Fuertes

Hasta ahora hemos visto ejemplos de entidades _"fuertes"_, esto quiere decir que no necesitan de ninguna otra entidad para poder existir.

### Entidades Débiles

Pero existen otras que son exactamente lo opuesto, entidades _"débiles"_, que necesitan de otras entidades para poder existir.

Pongamos otro ejemplo:

En una biblioteca, la entidad **Ejemplares** no puede existir sin la entidad **Libros**, ya que una biblioteca no puede tener ejemplares de un libro que no existe o que no tiene ni siquiera 1 en su inventario.

Estas identidades pueden ser de dos tipos:

- Por identidad: No se diferencían entre sí, más que por la clave de su entidad fuerte.

![debiles](./assets/Screenshot%202025-01-18%20175241.png)

- Por existencia: no depender de la clave de la entidad fuerte pero si de una propia, y la convierte en débil también.

## Historia de las bases de datos relacionales

En las primeras bases de datos, no tenían una forma eficiente de traer y ordenar los datos, así nacieron las RDB (Relational Data Base)

> Edgar Codd, inventor de las RDB
> Álgebra relacional

## Abstrayendo entidades

Haremos nuestra abstracción de entidades de un manejador de blogposts:

- Posts
- Usuarios
- Comentarios
- Categorías

## Relaciones

## Diagrama Entidad-Relación
