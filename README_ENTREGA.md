# Kata API Cervezas - Spring Boot

**Alumno:** Sergio Durutrián  
**Curso:** DAW 2  
**Asignatura:** Desarrollo Web en Entorno Servidor

---

## 📋 Descripción del Proyecto

API REST CRUD completa implementada con **Spring Boot 3.2.0** y **Java 17** para la gestión de cervezas, cerveceras, categorías y estilos sobre una base de datos MySQL/MariaDB.

Este proyecto implementa una [API](https://github.com/OAI/OpenAPI-Specification) funcional [CRUD](https://www.codecademy.com/articles/what-is-crud) sobre varias tablas en MySQL/MariaDB usando Spring Boot y Maven.

---

## 🎯 Objetivos Cumplidos

### ✅ Objetivos Obligatorios del Módulo

- ✅ **Comprender métodos HTTP**: GET, POST, PUT, DELETE correctamente implementados
- ✅ **CRUD Completo en `/beer*`**:
   - ✅ **CREATE** - POST /beer (Crear cerveza)
   - ✅ **READ** - GET /beers, GET /beer/{id} (Leer cervezas)
   - ✅ **UPDATE** - PUT /beer/{id} (Actualizar completa y parcialmente)
   - ✅ **DELETE** - DELETE /beer/{id} (Eliminar cerveza)
- ✅ **Lectura de otros endpoints**:
   - GET /breweries, GET /brewerie/{id}
   - GET /categories, GET /categorie/{id}
   - GET /styles, GET /style/{id}
- ✅ **Pruebas de la API**: Script automatizado `test-api.ps1` incluido
- ✅ **Documentación completa**: [`API_DOCUMENTATION.md`](./API_DOCUMENTATION.md) con ejemplos de todas las consultas

### 📝 Notas sobre la Implementación

- **PUT en lugar de PATCH**: El endpoint PUT `/beer/{id}` maneja tanto actualizaciones completas como parciales. Si solo se envían algunos campos, solo esos se actualizan (implementado mediante el método `partialUpdateBeer` en el servicio).
- **Sin Docker obligatorio**: Aunque se incluye `docker-compose.yml` funcional, la aplicación puede conectarse a cualquier MySQL/MariaDB local usando los scripts SQL del directorio `initSQL/`.

---

## 🔧 Tecnologías Utilizadas

- **Java 17**
- **Spring Boot 3.2.0**
  - Spring Web (REST API)
  - Spring Data JPA (Persistencia)
  - Spring Validation (Validaciones)
- **MySQL/MariaDB** (Base de datos)
- **Lombok** (Reducción de código boilerplate)
- **Maven** (Gestión de dependencias)

---

## 📦 Instalación y Configuración

### Opción 1: Con Docker Compose (Recomendado)

#### 1. Levantar la base de datos
```bash
docker compose up -d db
```

Esto iniciará MariaDB en el puerto `3306` con los datos precargados.

#### 2. Ejecutar la aplicación
```bash
mvn spring-boot:run
```

La API estará disponible en: **http://localhost:8080**

---

### Opción 2: Con MySQL Local

#### 1. Crear la base de datos

Ejecuta los scripts SQL en este orden desde el directorio `initSQL/`:

```sql
-- 1. Crear la base de datos
SOURCE initSQL/01-create-db.sql;

-- 2. Crear tablas y cargar datos
SOURCE initSQL/categories.sql;
SOURCE initSQL/styles.sql;
SOURCE initSQL/breweries.sql;
SOURCE initSQL/beers.sql;
```

O desde la línea de comandos:
```bash
mysql -u root -p < initSQL/01-create-db.sql
mysql -u root -p kata-api < initSQL/categories.sql
mysql -u root -p kata-api < initSQL/styles.sql
mysql -u root -p kata-api < initSQL/breweries.sql
mysql -u root -p kata-api < initSQL/beers.sql
```

#### 2. Configurar la conexión

Edita `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/kata-api
spring.datasource.username=TU_USUARIO
spring.datasource.password=TU_CONTRASEÑA
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

Si usas MariaDB, el driver está configurado por defecto.

#### 3. Ejecutar la aplicación
```bash
mvn spring-boot:run
```

---

## 🧪 Probar la API

### Script de Pruebas Automatizado

```powershell
.\test-api.ps1
```

Este script prueba todos los endpoints automáticamente.

### Herramientas Recomendadas

- **Postman** - [https://www.postman.com/](https://www.postman.com/)
- **Insomnia** - [https://insomnia.rest](https://insomnia.rest)
- **curl** - Línea de comandos
- **httpie** - [https://httpie.org/](https://httpie.org/)

### Ejemplos Rápidos con curl

```bash
# Obtener todas las cervezas
curl http://localhost:8080/beers

# Obtener una cerveza específica
curl http://localhost:8080/beer/1

# Crear una cerveza
curl -X POST http://localhost:8080/beer \
  -H "Content-Type: application/json" \
  -d '{
    "breweryId": 1,
    "name": "Mi Cerveza",
    "catId": 3,
    "styleId": 31,
    "abv": 7.0,
    "ibu": 65.0,
    "srm": 10.0
  }'

# Actualizar una cerveza (completa o parcial)
curl -X PUT http://localhost:8080/beer/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Nombre Actualizado", "abv": 8.0}'

# Eliminar una cerveza
curl -X DELETE http://localhost:8080/beer/1
```

---

## 📚 Documentación de la API

### Endpoints Implementados

| Endpoint         | Método | Descripción                              |
|------------------|--------|------------------------------------------|
| `/beers`         | GET    | Listar todas las cervezas                |
| `/beer`          | POST   | Crear una nueva cerveza                  |
| `/beer/{id}`     | GET    | Obtener cerveza por ID                   |
| `/beer/{id}`     | PUT    | Actualizar cerveza (completa o parcial)  |
| `/beer/{id}`     | DELETE | Eliminar cerveza                         |
| `/breweries`     | GET    | Listar todas las cerveceras              |
| `/brewerie/{id}` | GET    | Obtener cervecera por ID                 |
| `/categories`    | GET    | Listar todas las categorías              |
| `/categorie/{id}`| GET    | Obtener categoría por ID                 |
| `/styles`        | GET    | Listar todos los estilos                 |
| `/style/{id}`    | GET    | Obtener estilo por ID                    |

### Códigos de Estado HTTP

| Código | Significado                              |
|--------|------------------------------------------|
| 200    | OK - Operación exitosa                   |
| 201    | Created - Recurso creado correctamente   |
| 204    | No Content - Eliminación exitosa         |
| 400    | Bad Request - Error de validación        |
| 404    | Not Found - Recurso no encontrado        |
| 500    | Internal Server Error - Error del servidor |

📖 **Ver documentación completa con ejemplos:** [`API_DOCUMENTATION.md`](./API_DOCUMENTATION.md)

---

## 🏗️ Arquitectura del Proyecto

```
kata-api-cervezas-spring-boot/
├── src/main/java/com/example/kataapi/
│   ├── KataApiApplication.java          # Clase principal
│   ├── controller/                      # Controladores REST
│   │   ├── BeerController.java         # CRUD completo
│   │   ├── BreweryController.java      # Solo lectura
│   │   ├── CategoryController.java     # Solo lectura
│   │   └── StyleController.java        # Solo lectura
│   ├── model/                          # Entidades JPA
│   │   ├── Beer.java
│   │   ├── Brewery.java
│   │   ├── Category.java
│   │   └── Style.java
│   ├── repository/                     # Acceso a datos
│   │   ├── BeerRepository.java
│   │   ├── BreweryRepository.java
│   │   ├── CategoryRepository.java
│   │   └── StyleRepository.java
│   ├── service/                        # Lógica de negocio
│   │   ├── BeerService.java
│   │   ├── BreweryService.java
│   │   ├── CategoryService.java
│   │   └── StyleService.java
│   ├── dto/                            # Data Transfer Objects
│   │   └── BeerDTO.java
│   └── exception/                      # Manejo de errores
│       ├── GlobalExceptionHandler.java
│       └── ResourceNotFoundException.java
├── src/main/resources/
│   └── application.properties          # Configuración
├── initSQL/                            # Scripts de base de datos
│   ├── 01-create-db.sql
│   ├── categories.sql
│   ├── styles.sql
│   ├── breweries.sql
│   └── beers.sql
├── pom.xml                             # Dependencias Maven
├── docker-compose.yml                  # Configuración Docker
├── test-api.ps1                        # Script de pruebas
└── API_DOCUMENTATION.md                # Documentación completa
```

---

## ✨ Características Destacadas

### Arquitectura en Capas
- **Controller**: Maneja las peticiones HTTP y respuestas
- **Service**: Contiene la lógica de negocio
- **Repository**: Acceso a la base de datos con Spring Data JPA
- **Model**: Entidades JPA mapeadas a tablas

### Validaciones
- Validación de campos obligatorios con Bean Validation
- Mensajes de error descriptivos
- Manejo global de excepciones

### Actualizaciones Flexibles
El endpoint PUT `/beer/{id}` acepta:
- **Actualización completa**: Todos los campos proporcionados
- **Actualización parcial**: Solo los campos que se quieren cambiar

```json
// Actualización parcial - solo cambia el nombre
PUT /beer/1
{
  "name": "Nuevo Nombre"
}

// Actualización completa - todos los campos
PUT /beer/1
{
  "breweryId": 1,
  "name": "Nombre Completo",
  "catId": 3,
  "styleId": 31,
  "abv": 7.5,
  "ibu": 70.0,
  "srm": 12.0
}
```

### Manejo de Errores
- Respuestas JSON consistentes
- Mensajes de error claros
- Códigos HTTP apropiados

---

## 📝 Notas de Implementación

### PUT vs PATCH
Aunque la especificación original incluía PATCH, este proyecto implementa un **PUT inteligente** que maneja tanto actualizaciones completas como parciales:
- Si se envían todos los campos → Actualización completa
- Si se envían solo algunos campos → Actualización parcial (solo esos campos se modifican)

Esta implementación cumple con los requisitos del proyecto sin necesidad de un endpoint PATCH separado.

### Base de Datos
- Compatible con **MySQL** y **MariaDB**
- Scripts SQL incluidos en el directorio `initSQL/`
- Datos de ejemplo precargados (5914 cervezas, 1423 cerveceras, 11 categorías, 141 estilos)

---

## 🔍 Resolución de Problemas

### Error de conexión a la base de datos
```
Caused by: java.net.ConnectException: Connection refused
```
**Solución**: Verifica que MySQL/MariaDB esté corriendo:
```bash
# Con Docker
docker compose up -d db

# Sin Docker
systemctl start mysql  # Linux
brew services start mysql  # Mac
# Windows: Iniciar servicio MySQL desde Servicios
```

### Puerto 8080 ya en uso
**Solución**: Cambia el puerto en `application.properties`:
```properties
server.port=8081
```

### Error al compilar
**Solución**: Verifica la versión de Java:
```bash
java -version  # Debe ser Java 17 o superior
```

---

## 📖 Referencias

- [Documentación Spring Boot](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Spring Data JPA](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [REST API Best Practices](https://restfulapi.net/)

---

## 👨‍💻 Autor

**Sergio Durutrián**  
Desarrollo Web en Entorno Servidor - DAW 2  
IES Rafael Alberti

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.
