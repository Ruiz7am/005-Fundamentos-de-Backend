# Fundamentos del Backend

## Como se contruye el backend

Para entender como funciona el backend, y por ende, construirlo, veremos una analogía muy simple con un restaurante:

En este restaurante tenemos a los comensales o clientes, tenemos, meseros, cartas con el menu que brinda la información de los platillos que sirven, la cocina, en donde los cocineros/chefs preparan los platillos con la comida y los implementos o utensilios.

![backend](./assets/Screenshot%202025-01-15%20130221.png)

- Los clientes, comparandolos con nuestra arquitectura,  podrian ser, por ejemplo, los navegadores (Chrome, Firefox, Edge, Opera, etc.)

- Por medio de la carta (Frontend) los comensales (clientes) ven el listado de los platillos (información) disponibles que pueden solicitar, a estos se les conoce como **Endpoints**.
- Una vez que saben que platillo (dato) quieren, el mesero (API) se encarga de recibir la orden (solicitud) y llevarla hasta la cocina (backend) y espera el platillo (respuesta).
- Ya en la cocina (backend) los chefs/cocineros (desarrolladores) por medio de su técnica (código) reciben la orden (solicitud), se valen de la comida (Base de datos) y con sus implementos (librerias) preparan (procesan) el platillo (respuesta).

Se debe tomar en cuenta que se puede producir un mismo platillo con recetas, insumos y utensilios (metodologia, arquitectura, algoritmo, etc) diferentes entre sí, y esto puede variar la experiencia del usuario.

Siguiendo con nuestra analogía, podemos tambien comparar las recetas ya existentes con los frameworks, los cuales nos ayudan a realizar los platillos (producto, información, datos) más eficazmente.

## Como escoger lenguajes y frameworks para Backend

### Duplas mas utilizadas

Lo importante es escoger un lenguaje, a partir de aqui se escoge el framework.

Lenguaje | Frameworks
:---: | :---:
Python | Django, Flask, FastAPI
JavaScript | Express, NestJS
PHP | Laravel, Symphony
Java | Spring
Go | Gin
Ruby | Ruby on Rails
C# | .NET Core

## Protocolo HTTP

Para comenzar tenemos que definir algunos conceptos.

### URL

Por sus siglas en inglés, Uniform Resource Locator (Localizador de Recuros Uniforme), es la dirección de un único recuros en internet. Es uno de los mecanismos clave usado por los navegadores web para obtener recursos publicos, tales como paginas HTML, documentos CSS, imagenes, etc.

#### Anatomía de una URL

```html
https://platzi.com/cursos
```

##### De manera simple

![anatomia-url1](./assets/Screenshot%202025-01-15%20134929.png)

**https**: Protocolo
**platzi .com**: Dominio
**/Cursos**: Ruta o Endpoint

##### Definición de MDN

Una URL esta compuesta por diferentes partes, unas obligatorias, otras opcionales.

![anatomia-url2](./assets/mdn-url-all.png)

**http**: Protocolo.
**www .example .com**: Dominio.
**80**: Puerto.
**/path/to/myfyle.html**: Ruta o Endpoint.
**?key1=value1&key2=value2**: Parametros.
**#SomehwereInTheDocument**: ancla.

### Petición HTTP

```javascript
CLIENT(browser) => request(platzi.com) => DNS_SERVER(platzi.com => ip: XXX.XXX.XXX.XXX) /
=> WEB_SERVER(resources) => response(frontend: html, css, js; datos: xml, json;) /
=> CLIENT(browser)
```

#### Códigos de estado

Existen códigos que indican el estado en el que se encuentran las peticiones o respuestas, los clientes o servidores. Estan divididos en rangos según su función.

Rango 1XX = Información
102 = Processing

Rango 2XX = Success
200 = OK
201 = CREATED
204 = NO CONTENT

Rango 3XX = Redirect
301 = MOVED
307 = TEMPORARY
308 = PERMANENT

Rango 4XX = Client error
401 = Unauthorized
404 = Not found
409 = Conflict

Rango 5XX = Server error
500 = Internal
502 = Bad gateway
504 = Gateway timeout
