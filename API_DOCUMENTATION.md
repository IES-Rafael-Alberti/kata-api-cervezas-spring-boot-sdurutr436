# Documentación de la API - Kata Cervezas

## Descripción
API REST CRUD para la gestión de cervezas, cerveceras, categorías y estilos utilizando Spring Boot y MariaDB.

## Configuración Previa

### 1. Iniciar la base de datos con Docker
```bash
docker-compose up -d
```

Esto iniciará:
- MariaDB en el puerto `3306`
- Adminer (interfaz web para la BD) en el puerto `8888`

### 2. Ejecutar la aplicación Spring Boot
```bash
mvn spring-boot:run
```

La API estará disponible en: `http://localhost:8080`

---

## Endpoints de la API

### 🍺 CERVEZAS (Beers)

#### 1. Obtener todas las cervezas
**Endpoint:** `GET /beers`

**Ejemplo con curl:**
```bash
curl -X GET http://localhost:8080/beers
```

**Ejemplo con httpie:**
```bash
http GET http://localhost:8080/beers
```

**Respuesta exitosa (200 OK):**
```json
[
  {
    "id": 1,
    "breweryId": 1,
    "name": "Cerveza IPA",
    "catId": 3,
    "styleId": 31,
    "abv": 6.5,
    "ibu": 65.0,
    "srm": 8.0,
    "upc": 0,
    "filepath": "",
    "descript": "Una deliciosa IPA americana",
    "addUser": 0,
    "lastMod": "2025-12-09T10:30:00"
  }
]
```

---

#### 2. Obtener una cerveza por ID
**Endpoint:** `GET /beer/{id}`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/beer/1
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "breweryId": 1,
  "name": "Cerveza IPA",
  "catId": 3,
  "styleId": 31,
  "abv": 6.5,
  "ibu": 65.0,
  "srm": 8.0,
  "upc": 0,
  "filepath": "",
  "descript": "Una deliciosa IPA americana",
  "addUser": 0,
  "lastMod": "2025-12-09T10:30:00"
}
```

**Respuesta de error (404 Not Found):**
```json
{
  "timestamp": "2025-12-09T10:30:00",
  "message": "Cerveza no encontrada con id: 999",
  "status": 404
}
```

---

#### 3. Crear una nueva cerveza
**Endpoint:** `POST /beer`

**Ejemplo con curl:**
```bash
curl -X POST http://localhost:8080/beer \
  -H "Content-Type: application/json" \
  -d '{
    "breweryId": 1,
    "name": "Nueva Cerveza Artesanal",
    "catId": 3,
    "styleId": 31,
    "abv": 7.2,
    "ibu": 70.0,
    "srm": 10.0,
    "upc": 123456,
    "filepath": "/images/cerveza.jpg",
    "descript": "Una cerveza artesanal excepcional",
    "addUser": 1
  }'
```

**Ejemplo con httpie:**
```bash
http POST http://localhost:8080/beer \
  breweryId:=1 \
  name="Nueva Cerveza Artesanal" \
  catId:=3 \
  styleId:=31 \
  abv:=7.2 \
  ibu:=70.0 \
  srm:=10.0 \
  upc:=123456 \
  filepath="/images/cerveza.jpg" \
  descript="Una cerveza artesanal excepcional" \
  addUser:=1
```

**Respuesta exitosa (201 Created):**
```json
{
  "id": 5916,
  "breweryId": 1,
  "name": "Nueva Cerveza Artesanal",
  "catId": 3,
  "styleId": 31,
  "abv": 7.2,
  "ibu": 70.0,
  "srm": 10.0,
  "upc": 123456,
  "filepath": "/images/cerveza.jpg",
  "descript": "Una cerveza artesanal excepcional",
  "addUser": 1,
  "lastMod": "2025-12-09T10:35:00"
}
```

**Respuesta de error de validación (400 Bad Request):**
```json
{
  "timestamp": "2025-12-09T10:35:00",
  "message": "Error de validación",
  "errors": {
    "name": "El nombre de la cerveza es obligatorio",
    "abv": "El ABV es obligatorio"
  },
  "status": 400
}
```

---

#### 4. Actualizar completamente una cerveza
**Endpoint:** `PUT /beer/{id}`

**Ejemplo:**
```bash
curl -X PUT http://localhost:8080/beer/1 \
  -H "Content-Type: application/json" \
  -d '{
    "breweryId": 1,
    "name": "Cerveza IPA Actualizada",
    "catId": 3,
    "styleId": 31,
    "abv": 6.8,
    "ibu": 68.0,
    "srm": 9.0,
    "upc": 0,
    "filepath": "",
    "descript": "Descripción actualizada",
    "addUser": 0
  }'
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "breweryId": 1,
  "name": "Cerveza IPA Actualizada",
  "catId": 3,
  "styleId": 31,
  "abv": 6.8,
  "ibu": 68.0,
  "srm": 9.0,
  "upc": 0,
  "filepath": "",
  "descript": "Descripción actualizada",
  "addUser": 0,
  "lastMod": "2025-12-09T10:40:00"
}
```

---

#### 5. Actualizar parcialmente una cerveza
**Endpoint:** `PATCH /beer/{id}`

**Ejemplo (solo actualizar el nombre y ABV):**
```bash
curl -X PATCH http://localhost:8080/beer/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Nuevo Nombre",
    "abv": 7.0
  }'
```

**Ejemplo con httpie:**
```bash
http PATCH http://localhost:8080/beer/1 \
  name="Nuevo Nombre" \
  abv:=7.0
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "breweryId": 1,
  "name": "Nuevo Nombre",
  "catId": 3,
  "styleId": 31,
  "abv": 7.0,
  "ibu": 68.0,
  "srm": 9.0,
  "upc": 0,
  "filepath": "",
  "descript": "Descripción actualizada",
  "addUser": 0,
  "lastMod": "2025-12-09T10:45:00"
}
```

---

#### 6. Eliminar una cerveza
**Endpoint:** `DELETE /beer/{id}`

**Ejemplo:**
```bash
curl -X DELETE http://localhost:8080/beer/1
```

**Respuesta exitosa (204 No Content):**
Sin contenido en el cuerpo de la respuesta.

---

### 🏭 CERVECERAS (Breweries)

#### 1. Obtener todas las cerveceras
**Endpoint:** `GET /breweries`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/breweries
```

**Respuesta exitosa (200 OK):**
```json
[
  {
    "id": 1,
    "name": "Cervecería Artesanal",
    "address1": "Calle Principal 123",
    "address2": "",
    "city": "Madrid",
    "state": "Madrid",
    "code": "28001",
    "country": "España",
    "phone": "+34 912345678",
    "website": "https://cerveceriaartesanal.com",
    "filepath": "",
    "descript": "Cervecería artesanal fundada en 2010",
    "addUser": 0,
    "lastMod": "2025-12-09T10:00:00"
  }
]
```

---

#### 2. Obtener una cervecera por ID
**Endpoint:** `GET /brewerie/{id}`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/brewerie/1
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "name": "Cervecería Artesanal",
  "address1": "Calle Principal 123",
  "address2": "",
  "city": "Madrid",
  "state": "Madrid",
  "code": "28001",
  "country": "España",
  "phone": "+34 912345678",
  "website": "https://cerveceriaartesanal.com",
  "filepath": "",
  "descript": "Cervecería artesanal fundada en 2010",
  "addUser": 0,
  "lastMod": "2025-12-09T10:00:00"
}
```

---

### 📋 CATEGORÍAS (Categories)

#### 1. Obtener todas las categorías
**Endpoint:** `GET /categories`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/categories
```

**Respuesta exitosa (200 OK):**
```json
[
  {
    "id": 1,
    "catName": "British Ale",
    "lastMod": "2010-10-24T13:50:10"
  },
  {
    "id": 2,
    "catName": "Irish Ale",
    "lastMod": "2010-06-08T00:00:00"
  }
]
```

---

#### 2. Obtener una categoría por ID
**Endpoint:** `GET /categorie/{id}`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/categorie/1
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "catName": "British Ale",
  "lastMod": "2010-10-24T13:50:10"
}
```

---

### 🎨 ESTILOS (Styles)

#### 1. Obtener todos los estilos
**Endpoint:** `GET /styles`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/styles
```

**Respuesta exitosa (200 OK):**
```json
[
  {
    "id": 1,
    "catId": 1,
    "styleName": "Classic English-Style Pale Ale",
    "lastMod": "2010-10-24T13:53:31"
  },
  {
    "id": 2,
    "catId": 1,
    "styleName": "English-Style India Pale Ale",
    "lastMod": "2010-06-15T19:14:38"
  }
]
```

---

#### 2. Obtener un estilo por ID
**Endpoint:** `GET /style/{id}`

**Ejemplo:**
```bash
curl -X GET http://localhost:8080/style/1
```

**Respuesta exitosa (200 OK):**
```json
{
  "id": 1,
  "catId": 1,
  "styleName": "Classic English-Style Pale Ale",
  "lastMod": "2010-10-24T13:53:31"
}
```

---

## Códigos de Estado HTTP

| Código | Descripción |
|--------|-------------|
| 200 | OK - Solicitud exitosa |
| 201 | Created - Recurso creado exitosamente |
| 204 | No Content - Recurso eliminado exitosamente |
| 400 | Bad Request - Error de validación |
| 404 | Not Found - Recurso no encontrado |
| 500 | Internal Server Error - Error del servidor |

---

## Probar la API con Postman

### Importar colección
1. Abre Postman
2. Crea una nueva colección llamada "Kata API Cervezas"
3. Añade las siguientes peticiones:

**Variables de entorno:**
- `base_url`: `http://localhost:8080`

**Peticiones sugeridas:**
1. GET {{base_url}}/beers
2. GET {{base_url}}/beer/1
3. POST {{base_url}}/beer (con body JSON)
4. PUT {{base_url}}/beer/1 (con body JSON)
5. PATCH {{base_url}}/beer/1 (con body JSON)
6. DELETE {{base_url}}/beer/1
7. GET {{base_url}}/breweries
8. GET {{base_url}}/brewerie/1
9. GET {{base_url}}/categories
10. GET {{base_url}}/categorie/1
11. GET {{base_url}}/styles
12. GET {{base_url}}/style/1

---

## Estructura del Proyecto

```
kata-api-cervezas-spring-boot/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/kataapi/
│   │   │       ├── controller/
│   │   │       │   ├── BeerController.java
│   │   │       │   ├── BreweryController.java
│   │   │       │   ├── CategoryController.java
│   │   │       │   └── StyleController.java
│   │   │       ├── dto/
│   │   │       │   └── BeerDTO.java
│   │   │       ├── exception/
│   │   │       │   ├── GlobalExceptionHandler.java
│   │   │       │   └── ResourceNotFoundException.java
│   │   │       ├── model/
│   │   │       │   ├── Beer.java
│   │   │       │   ├── Brewery.java
│   │   │       │   ├── Category.java
│   │   │       │   └── Style.java
│   │   │       ├── repository/
│   │   │       │   ├── BeerRepository.java
│   │   │       │   ├── BreweryRepository.java
│   │   │       │   ├── CategoryRepository.java
│   │   │       │   └── StyleRepository.java
│   │   │       ├── service/
│   │   │       │   ├── BeerService.java
│   │   │       │   ├── BreweryService.java
│   │   │       │   ├── CategoryService.java
│   │   │       │   └── StyleService.java
│   │   │       └── KataApiApplication.java
│   │   └── resources/
│   │       └── application.properties
├── docker-compose.yml
├── pom.xml
└── README.md
```

---

## Tecnologías Utilizadas

- **Java 17**
- **Spring Boot 3.2.0**
  - Spring Web
  - Spring Data JPA
  - Spring Validation
- **MariaDB** (Base de datos)
- **Lombok** (Reducción de código boilerplate)
- **Maven** (Gestión de dependencias)

---

## Notas Adicionales

### Validaciones en BeerDTO
Los campos obligatorios para crear/actualizar una cerveza son:
- `breweryId` (Integer)
- `name` (String, no vacío)
- `catId` (Integer)
- `styleId` (Integer)
- `abv` (Float)
- `ibu` (Float)
- `srm` (Float)

### Diferencia entre PUT y PATCH
- **PUT**: Reemplaza completamente el recurso. Todos los campos deben proporcionarse.
- **PATCH**: Actualización parcial. Solo los campos proporcionados se actualizan.

### CORS
La API está configurada con `@CrossOrigin(origins = "*")` para permitir peticiones desde cualquier origen durante el desarrollo. En producción, se debe restringir a dominios específicos.
