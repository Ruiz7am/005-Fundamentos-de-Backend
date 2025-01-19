# Escalabilidad y rendimiento en el Backend

## Escalabilidad Vertical y Horizontal

Una vez que nuestra aplicación tiene éxito y la cantidad de usuario se comienza a incrementar, puede que nuestra plataforma no sea lo suficientemente capaz de cumplir con las exigencias de recuros y colapse, a menos que tengamos un plan de escalabilidad.

Hay dos formas de escalar un proyecto, Vertical u Horizontal

### Escalabilidad Vertical

Escalar verticalmente se refiere a aumentar los recursos físicos del sistema (CPU, RAM, HDD), para evitar el colapso por la sobredemanda de peticiones, tan simple como eso, vas a tu proveedor de PaaS solicitas mas recursos y listo. Problema resuelto.

Pero no todo son maravillas, hay ciertas desventajas en optar por escalar de esta manera, la primera es el coste, es muy caro este tipo de upgrade, la segunda que muchas de las veces no tienes opción de desescalar y la tercera que al escalar, sigue siendo un solo servidor, que si falla, dejaría a la aplicación totalmente colapsada.

### Escalabilidad Horizontal

Como ya nos imaginabamos esta es una opción más viable para poder escalar, ya que lo que hacemos no es incrementar los recursos en el mismo servidor si no _"clonarlo"_, es decir levantar otro servidor.

Al configurar un segundo servidor, o incluso mas, totalmente identicos al principal, logramos cumplir las demandas del crecimiento y evitar la caida total de la aplicación en caso de fallos.

> A un conjunto de servidores como los descritos se les conoce como Cluster

Esta parte de la escalada permite tener a mas de un servidor trabajando en conjunto para satisfacer todas las peticiones, y lo logran gracias a un Load Balancer que ayuda a balancear la carga de peticiones entre todos los servidores del cluster. Es más barato y nos ayuda a proteger nuestra aplicación de una caida total.

Desventajas:

- Es mas complejo de configurar.
- Si la base de datos esta en el mismo servidor cada servidor tendrá su base de datos, por lo que no habrá una sincronización de la base completa.

#### Replicación

Para eso tenemos que aplicar un metodo denominado replicación la cual consta de copiar cada escritura en las demas bases de datos.

![replica](./assets/Screenshot%202025-01-18%20152104.png)

## Caché

La caché permite almacenar respuestas a solicitudes ya antes recibidas, esto permite mejorar el rendimiento a la hora de entregar un recurso solicitado.

![cache](./assets/Screenshot%202025-01-18%20152525.png)

La caché nos es muy útil para:

- E-Commerce
- Sitios de noticias
- Blogs
- Evitar ataques DDoS

La caché no es buena para:

- Aplicacines en tiempo real

## Colas de tareas

En este capitulos veremos en que situaciones es conveniente implementar colas de tareas.

Primero es necesario identificar los tipos de tareas:

- Reportes
- Backups
- Graficos
- ZIPs, PDFs, CSVs

Consultar o gestionar este tipo de recuros tomara tiempo por la naturaleza de su estructura, por lo cual sería una desventaja utilizar web API con arquitecturas como REST, ya que nos mermaría el rendimiento.

Para resolver este problema nos valemos de las colas de tareas, y para entenderlas debemos prestar mucha atención a dos cosas en específico:

- La ejecución
- La respuesta

Un request se ejecuta lo más pronto posible y responde por el mismo medio.  
Una cola de tareas eventualmente ejecutará un proceso y puede responder por otros medios.

Un buen ejemplo de esto, sería la opción de facebook en la que te permite descargar un backup completo de toda tu información de tu perfil almacenada. Cuando le damos al _"call to action"_ la respuesta no es con el backup si no con un mensaje diciendonos que tomará tiempo realizar esa copia de seguridad, y la respuesta con el backup es entregada por otro medio el cual es un email.

Las tareas se ejecutan una por una.

## Server-Side Rendering

El servidor puede entregar diferentes tipos de archivos:

- JSON
- XML
- FILES
- HTML

Es posible hacer renderizado del lado del servidor, pero no es bueno en todos los casos

- HTML es rápido y bueno para los motores de busqueda, pero no es interactivo.

El renderizado del lado del cliente no es tan rapido (JSON) y es malo para motores de busqueda pero es altamente interactivo. Este tipo de interactividad la podemos construir con frameworks como Angular, React o VueJS.

Hay frameworks que unen lo mejor de los dos bandos, que permite:

- Ser interactivo
- ser rápido
- bueno para los buscadores
- HTML / JSON

Una vez llegado hasta este punto tenemos nuestra arquitectura de esta manera:

- Tenemos nuestro APIs Server, el agente más próximo al frontend y el que nos ayudará a enlazarlo con el backend.
- Tenemos nuestro Task Server.
- Nuestro DB Server.
- Y lo último que vimos el Render Server:
  - Vercel
  - Netfly
  - Firebase Hosting

Esto También es preferible dejarselo a terceros