# Usar Python 3.11 como imagen base
FROM python:3.11-slim

# Establecer el directorio de trabajo
WORKDIR /code

# Copiar el archivo de requisitos
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copiar el código de la aplicación
COPY ./app /code/app

# Exponer el puerto 8000
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
