#!/bin/bash
# Script de pruebas para la API de Cervezas
# Asegúrate de que la aplicación esté corriendo en http://localhost:8080

BASE_URL="http://localhost:8080"

echo "======================================"
echo "  PRUEBAS DE LA API DE CERVEZAS"
echo "======================================"
echo ""

# Colores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 1. Obtener todas las cervezas
echo -e "${BLUE}1. GET /beers - Obtener todas las cervezas${NC}"
curl -X GET "$BASE_URL/beers" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 2. Obtener una cerveza específica
echo -e "${BLUE}2. GET /beer/1 - Obtener cerveza con ID 1${NC}"
curl -X GET "$BASE_URL/beer/1" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 3. Crear una nueva cerveza
echo -e "${BLUE}3. POST /beer - Crear una nueva cerveza${NC}"
curl -X POST "$BASE_URL/beer" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "breweryId": 1,
    "name": "Test Beer API",
    "catId": 3,
    "styleId": 31,
    "abv": 7.5,
    "ibu": 75.0,
    "srm": 12.0,
    "upc": 999999,
    "filepath": "/test/beer.jpg",
    "descript": "Cerveza de prueba creada mediante API",
    "addUser": 1
  }' | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 4. Actualizar completamente una cerveza
echo -e "${BLUE}4. PUT /beer/1 - Actualizar cerveza completa${NC}"
curl -X PUT "$BASE_URL/beer/1" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "breweryId": 1,
    "name": "Updated Beer Name",
    "catId": 3,
    "styleId": 31,
    "abv": 8.0,
    "ibu": 80.0,
    "srm": 15.0,
    "upc": 111111,
    "filepath": "/updated/beer.jpg",
    "descript": "Cerveza actualizada completamente",
    "addUser": 1
  }' | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 5. Actualizar parcialmente una cerveza
echo -e "${BLUE}5. PATCH /beer/1 - Actualizar parcialmente${NC}"
curl -X PATCH "$BASE_URL/beer/1" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "name": "Partially Updated Beer",
    "abv": 8.5
  }' | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 6. Obtener todas las cerveceras
echo -e "${BLUE}6. GET /breweries - Obtener todas las cerveceras${NC}"
curl -X GET "$BASE_URL/breweries" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 7. Obtener una cervecera específica
echo -e "${BLUE}7. GET /brewerie/1 - Obtener cervecera con ID 1${NC}"
curl -X GET "$BASE_URL/brewerie/1" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 8. Obtener todas las categorías
echo -e "${BLUE}8. GET /categories - Obtener todas las categorías${NC}"
curl -X GET "$BASE_URL/categories" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 9. Obtener una categoría específica
echo -e "${BLUE}9. GET /categorie/1 - Obtener categoría con ID 1${NC}"
curl -X GET "$BASE_URL/categorie/1" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 10. Obtener todos los estilos
echo -e "${BLUE}10. GET /styles - Obtener todos los estilos${NC}"
curl -X GET "$BASE_URL/styles" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 11. Obtener un estilo específico
echo -e "${BLUE}11. GET /style/1 - Obtener estilo con ID 1${NC}"
curl -X GET "$BASE_URL/style/1" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 12. Probar error 404
echo -e "${BLUE}12. GET /beer/99999 - Probar error 404${NC}"
curl -X GET "$BASE_URL/beer/99999" -H "Accept: application/json" | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

# 13. Probar validación (POST sin campos obligatorios)
echo -e "${BLUE}13. POST /beer - Probar validación (datos incompletos)${NC}"
curl -X POST "$BASE_URL/beer" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "name": "Invalid Beer"
  }' | json_pp
echo -e "\n${GREEN}✓ Completado${NC}\n"

echo "======================================"
echo "  PRUEBAS COMPLETADAS"
echo "======================================"
