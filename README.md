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
- **PostgreSQL** (descargar desde [postgresql.org](https://www.postgresql.org/))
- **PostgREST** para la API (instalar según la documentación en [postgrest.org](https://postgrest.org/))

### Instalación
El backend y el frontend están en la misma carpeta, pero se inician por separado.

1. Clonar el repositorio:
```sh
git clone https://github.com/tuusuario/sensor-dashboard.git
cd sensor-dashboard
```

2. Instalar dependencias necesarias:
```sh
npm install
```

### Ejecución del Backend
El backend está contenido en el archivo `server.js` dentro del mismo directorio del frontend y no requiere configuración adicional.

Para iniciar el backend, usa:
```sh
node server.js
```

### Ejecución del Frontend
El frontend consume los datos desde el backend a través del archivo `api.js`. Para iniciarlo, ejecuta:
```sh
npm start
```

El backend se ejecutará en `http://localhost:5000` y el frontend en `http://localhost:3000`.

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

