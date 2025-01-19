# Backend en el dia a dia

## DEVOPS

Devops es el area en la que se une la parte de desarrollo con la de operaciones (DEVeloping-OPerationS), de manera muy resumida funciona de la siguiente manera.

Despues del desarrollo, nuestro producto pasa a una fase de prueba en la que ingenieros crean pruebas de calidad y seguridad antes de ingresarlo a la nuebe (si ese es nuestro cometido)

![devops](./assets/Screenshot%202025-01-17%20200436.png)

## El servidor

Recordando que la "nube" es solo la computadora de alquien mas, tenemos estos "alguien mas" osease las compañias de almacenamiento en la nube, que ofrecen varios tipos de arquitecturas para almacenar y ejecutar nuestro proyecto o producto:

- IaaS: Infrastructure as a Service.
- PaaS: Platform as a Service.
- SaaS: Software as a Service.

![arquitecture](./assets/Screenshot%202025-01-17%20201718.png)


## Cookies y sesiones

Las cookies son fragmentos de código que nos ayudan a almacenar información en los navegadores. Por ejemplo, el idioma, mantener una sesión abierta aunque se cierre el navegador.

En el caso concreto de la persistencia en los inicios de sesión, el cliente al hacer login en algun sitio que maneje cookies, mandara los datos como una petición, el servidor la recive la procesa y manda una cookie al navegador.

Hay un problema con las cookies, esta tecnología funciona solo entre un navegador web (browser) y el servidor, no es posible aplicarla en plataformas moviles (smartphones), ya que estas estan construidads con una tecnología diferente.

Para poder aplicar la misma funcionalidad en moviles, hay que utilizar JWT (JSON Web Tokens) y lo mejor de esta tecnología es que se puede implementar también en navegadores web.

## Bases de Datos

La desmenusamos de la siguiente manera. En el server tenemos:

- Lógica de negocio
- Reglas de negocio
- Validación
- Autorización
- entre varias tareas más

(El software)

y físicamente tenemos:

- CPU (Central Processing Unit)
- RAM (Random Access Memory)
- HDD (Hard Drive Disk) o SSD (Solid State Drive)

Dentro del servidor tenemos los servicios de backend por su puesto, nuestra aplicación, pero también es posible tener servicios de bases de datos corriendo en paralelo en ese mismo servidor. En un mismo sistema podemos tener diferentes servicios de backend corriendo simultaneamente, por ejemplo, podemos tener un stack de backend con python y django, con php y laravel, con javascript y node.js, etc.

Estas APIs por lo regular consumen mas cpu y ram, y los servicios de bases de datos son las que consumen más recursos de almacenamiento.

Ok, hasta aquí todo bien, lo siguiente, conforme a lo que hemos estado estudiando, puesto que el backend necesita de la información de una base de datos para poder entregar la información requerida por nuestro frontend, necesitamos una forma de conectar estas dos, y esto se logra mediante los **Drivers**, cada base de datos tiene su propio driver en particular y pude estar adaptado para diferentes lenguajes. Es necesario este fragmento de código para poder enlazar desde el mísmo código con la base de datos.

### Tipos de bases de datos

Existen dos tipos de bases de datos:

- Relacionales (SQL):
  - MySQL
  - PostgreSQL
  - Oracle
  - MariaDB.
- No relacionales (NoSQL):
  - MongoDB
  - Apache Cassandra
  - Couchbase.

Las bases de datos relacionales tienen el lenguaje de consultas de bases de datos SQL (Structured Query Language) como lenguaje en común. Esto permite que los frameworks para backend  aprovechan esta caracteristica y nos ofrecen el paradigma de la OOP para resolver la conexión e interacción con la base de datos, esta solución es llamada ORM: Object-Relational Mapping. Frameworks tales com (laravel, django, typeorm).

Backend developer no se encarga de la administración de bases de datos, de esto se encarga el DB Admin, el cual realiza backups, optimización, replicación, etc.
