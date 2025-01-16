# APIs REST

## Que es una API

**Application Programming Interface**: Nos ayuda a comunicar dos sistemas entre sí a traves de un código determinado.

En nuestra arquitectura cliente-servidor, las peticiones del cliente son atendidas por una API.

## Estrucutura REST API

```html
domain.com

domain.com/users
domain.com/tasks
domain.com/companies
```

### CRUD

- **C**reate = POST
- **R**ead = GET
- **U**pdate = PUT / PATCH
- **D**elete = DELETE

Endpoint | Method | Body | Response | status
:---: | :---: | :---: | :---: | :---:
/users (obtener usuarios) | GET | N/A | json: [{...}, {...}, ...] | 200: ok
/users/:id (obtener usuario especifico) | GET | N/A | json: {...} | 200: ok
/users (crear usuario) | POST | {...} | {...} | 201: created
/users/:id (modificar usuario) | PUT/PATCH | {...} | {...} | 201: created
/users/:id (eliminar usuario) | DELETE | N/A | ✅ | 201: created

## Explorando una API

Descargamos el software: 
