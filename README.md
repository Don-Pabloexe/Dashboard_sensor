# Sensor Monitoring Dashboard

## Descripción del Proyecto

Este proyecto es un **dashboard de monitoreo** para sensores de aproximación e inducción. Permite visualizar y filtrar datos en tiempo real, facilitando el análisis de eventos detectados por los sensores.

## Características Principales

- **Visualización en tiempo real** de eventos capturados por los sensores.
- **Filtros avanzados** para refinar la búsqueda de datos.
- **Gráficos interactivos** para representar patrones de detección.
- **Soporte para múltiples tipos de sensores** con características específicas.

## Datos Capturados

### Sensores de Aproximación

- Estado del sensor (Activado/Desactivado)
- Distancia detectada (mm, cm, m)
- Timestamp de detección
- Duración del evento (segundos)
- Tipo de objeto detectado (si aplica)
- Frecuencia de activación
- Temperatura del sensor
- Estado de la alimentación (voltaje o batería restante)

### Sensores de Inducción

- Estado del sensor (Activado/Desactivado)
- Tipo de metal detectado (si aplica)
- Distancia de detección (mm, cm, m)
- Intensidad del campo electromagnético (µT)
- Timestamp de detección
- Duración del evento (segundos)
- Frecuencia de eventos
- Condiciones del sensor (temperatura, corriente, voltaje)

## Filtros Disponibles

### Básicos

- **Tipo de sensor** (Aproximación o Inducción)
- **Fecha y hora** (Intervalo de tiempo)
- **Estado** (Activado/Desactivado)
- **Distancia detectada** (Rango de proximidad)
- **Frecuencia de eventos** (Mínimo/máximo)
- **Tipo de objeto detectado** (si aplica)

### Avanzados

- **Duración del evento**
- **Intensidad del campo electromagnético**
- **Condiciones del sensor** (Voltaje, temperatura)

## Tecnologías Utilizadas

- **Frontend:** React
- **Backend:** Node.js con PostgREST
- **Visualización de Datos:** Chart.js, D3.js
- **Base de Datos:** PostgreSQL

## Instalación y Ejecución

### Requisitos Previos

Para ejecutar este proyecto, asegúrate de tener instalado:

- **Node.js** (descargar desde [nodejs.org](https://nodejs.org/))
- **Yarn o npm** para la gestión de paquetes
- **PostgreSQL** (descargar desde [postgresql.org](https://www.postgresql.org/))
- **PostgREST** para la API (instalar según la documentación en [postgrest.org](https://postgrest.org/))

### Instalación

```sh
# Clonar el repositorio
git clone https://github.com/tuusuario/sensor-dashboard.git
cd sensor-dashboard

# Instalar dependencias
yarn install # o npm install
```

### Configuración

Crear un archivo `.env` en la raíz del proyecto con las siguientes variables:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USER=usuario
DB_PASSWORD=contraseña
DB_NAME=sensores
```

### Ejecución

```sh
# Ejecutar el backend
yarn start:backend # o npm run start:backend

# Ejecutar el frontend
yarn start:frontend # o npm run start:frontend
```

## Uso

1. Iniciar sesión en el dashboard.
2. Seleccionar el tipo de sensor a visualizar.
3. Aplicar filtros según los criterios deseados.
4. Analizar los datos mostrados en tablas y gráficos.

## Contribución

1. Realizar un fork del repositorio.
2. Crear una rama nueva (`feature-nombre`).
3. Realizar cambios y confirmar (`git commit -m 'Descripción del cambio'`).
4. Enviar un pull request.

## Licencia

Este proyecto está licenciado bajo MIT License - consulta el archivo [LICENSE](LICENSE) para más detalles.

efwefw

