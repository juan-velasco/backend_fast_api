# FastAPI CRUD con PostgreSQL

API REST de ejemplo construida con FastAPI y PostgreSQL, lista para ejecutar con Docker Compose.

## 🚀 Características

- ✅ CRUD completo de productos
- 🐘 PostgreSQL como base de datos
- 🐳 Docker y Docker Compose configurados
- 📝 Documentación automática con Swagger UI
- ✨ Validación de datos con Pydantic
- 🔄 Hot reload en desarrollo

## 📋 Requisitos previos

- Docker
- Docker Compose

## 🛠️ Instalación y ejecución

1. Clonar el repositorio y navegar al directorio:
```bash
cd backend_fast_api
```

2. Construir y ejecutar los contenedores:
```bash
docker compose up --build
```

3. La API estará disponible en:
- API: http://localhost:8000
- Documentación Swagger: http://localhost:8000/docs
- Documentación ReDoc: http://localhost:8000/redoc

## 📚 Endpoints disponibles

### Productos

- `GET /` - Mensaje de bienvenida
- `GET /health` - Health check
- `POST /products/` - Crear un producto
- `GET /products/` - Listar todos los productos
- `GET /products/{product_id}` - Obtener un producto por ID
- `PUT /products/{product_id}` - Actualizar un producto
- `DELETE /products/{product_id}` - Eliminar un producto

## 🧪 Ejemplos de uso

### Crear un producto
```bash
curl -X POST "http://localhost:8000/products/" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Laptop",
    "description": "Laptop de alta gama",
    "price": 1299.99,
    "stock": 10,
    "is_available": true
  }'
```

### Listar productos
```bash
curl -X GET "http://localhost:8000/products/"
```

### Obtener un producto
```bash
curl -X GET "http://localhost:8000/products/1"
```

### Actualizar un producto
```bash
curl -X PUT "http://localhost:8000/products/1" \
  -H "Content-Type: application/json" \
  -d '{
    "price": 1199.99,
    "stock": 8
  }'
```

### Eliminar un producto
```bash
curl -X DELETE "http://localhost:8000/products/1"
```

## 🏗️ Estructura del proyecto

```
backend_fast_api/
├── app/
│   ├── __init__.py
│   ├── main.py          # Punto de entrada de la aplicación
│   ├── models.py        # Modelos de base de datos
│   ├── schemas.py       # Esquemas Pydantic
│   ├── crud.py          # Operaciones CRUD
│   └── database.py      # Configuración de base de datos
├── Dockerfile
├── compose.yaml
├── requirements.txt
├── .env.example
└── README.md
```

## 🔧 Configuración

Las variables de entorno se pueden configurar en el archivo `compose.yaml`:

- `DATABASE_URL`: URL de conexión a PostgreSQL
- `POSTGRES_USER`: Usuario de PostgreSQL
- `POSTGRES_PASSWORD`: Contraseña de PostgreSQL
- `POSTGRES_DB`: Nombre de la base de datos

## 🛑 Detener los servicios

```bash
docker compose down
```

Para eliminar también los volúmenes (datos de la base de datos):
```bash
docker compose down -v
```

## 📝 Notas

- El servidor se ejecuta con `--reload` activado para desarrollo
- Los cambios en el código se reflejan automáticamente
- Los datos de PostgreSQL persisten en un volumen Docker
- El health check asegura que la API no inicie hasta que PostgreSQL esté listo
