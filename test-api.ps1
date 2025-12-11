# Script de pruebas para Windows PowerShell
# Asegurate de que la aplicacion este corriendo en http://localhost:8080

$baseUrl = "http://localhost:8080"
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  PRUEBAS DE LA API DE CERVEZAS" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# 1. Obtener todas las cervezas
Write-Host "1. GET /beers - Obtener todas las cervezas" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beers" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 2. Obtener una cerveza especifica
Write-Host "2. GET /beer/1 - Obtener cerveza con ID 1" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer/1" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 3. Crear una nueva cerveza
Write-Host "3. POST /beer - Crear una nueva cerveza" -ForegroundColor Blue
$newBeer = @{
    breweryId = 1
    name = "Test Beer API"
    catId = 3
    styleId = 31
    abv = 7.5
    ibu = 75.0
    srm = 12.0
    upc = 999999
    filepath = "/test/beer.jpg"
    descript = "Cerveza de prueba creada mediante API"
    addUser = 1
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer" -Method Post -Headers $headers -Body $newBeer
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 4. Actualizar completamente una cerveza
Write-Host "4. PUT /beer/1 - Actualizar cerveza completa" -ForegroundColor Blue
$updateBeer = @{
    breweryId = 1
    name = "Updated Beer Name"
    catId = 3
    styleId = 31
    abv = 8.0
    ibu = 80.0
    srm = 15.0
    upc = 111111
    filepath = "/updated/beer.jpg"
    descript = "Cerveza actualizada completamente"
    addUser = 1
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer/1" -Method Put -Headers $headers -Body $updateBeer
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 5. Actualizar parcialmente una cerveza
Write-Host "5. PATCH /beer/1 - Actualizar parcialmente" -ForegroundColor Blue
$patchBeer = @{
    name = "Partially Updated Beer"
    abv = 8.5
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer/1" -Method Patch -Headers $headers -Body $patchBeer
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 6. Obtener todas las cerveceras
Write-Host "6. GET /breweries - Obtener todas las cerveceras" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/breweries" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 7. Obtener una cervecera especifica
Write-Host "7. GET /brewerie/1 - Obtener cervecera con ID 1" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/brewerie/1" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 8. Obtener todas las categorias
Write-Host "8. GET /categories - Obtener todas las categorias" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/categories" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 9. Obtener una categoria especifica
Write-Host "9. GET /categorie/1 - Obtener categoria con ID 1" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/categorie/1" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 10. Obtener todos los estilos
Write-Host "10. GET /styles - Obtener todos los estilos" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/styles" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 11. Obtener un estilo especifico
Write-Host "11. GET /style/1 - Obtener estilo con ID 1" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/style/1" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
    Write-Host "[OK] Completado" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "[ERROR] $_" -ForegroundColor Red
    Write-Host ""
}

# 12. Probar error 404
Write-Host "12. GET /beer/99999 - Probar error 404" -ForegroundColor Blue
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer/99999" -Method Get -Headers $headers
    $response | ConvertTo-Json -Depth 10
} catch {
    Write-Host "Error esperado (404): $_" -ForegroundColor Yellow
}
Write-Host "[OK] Completado" -ForegroundColor Green
Write-Host ""

# 13. Probar validacion
Write-Host "13. POST /beer - Probar validacion (datos incompletos)" -ForegroundColor Blue
$invalidBeer = @{
    name = "Invalid Beer"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "$baseUrl/beer" -Method Post -Headers $headers -Body $invalidBeer
    $response | ConvertTo-Json -Depth 10
} catch {
    Write-Host "Error esperado (validacion): $_" -ForegroundColor Yellow
}
Write-Host "[OK] Completado" -ForegroundColor Green
Write-Host ""

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  PRUEBAS COMPLETADAS" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
