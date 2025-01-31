import RPi.GPIO as GPIO
import psycopg2
import time
import random
from datetime import datetime

# Configuración de los pines GPIO
TRIG = 23  # Pin para TRIG
ECHO = 24  # Pin para ECHO

# Configuración de la base de datos
DB_CONFIG = {
    "host": "localhost",
    "database": "dashboard_sensor",
    "user": "postgres",
    "password": "12345"
}

# Configuración de GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(TRIG, GPIO.OUT)
GPIO.setup(ECHO, GPIO.IN)

# Conexión a la base de datos
try:
    connection = psycopg2.connect(**DB_CONFIG)
    cursor = connection.cursor()
    print("✅ Conexión exitosa a la base de datos")

    while True:
        # Iniciar medición de tiempo del evento
        tiempo_inicio_evento = time.time()

        # Enviar pulso al TRIG
        GPIO.output(TRIG, True)
        time.sleep(0.00001)  # Pulso de 10 microsegundos
        GPIO.output(TRIG, False)

        # Esperar por el eco
        while GPIO.input(ECHO) == 0:
            inicio = time.time()
        while GPIO.input(ECHO) == 1:
            final = time.time()

        # Calcular duración del evento (tiempo total de toma de datos)
        tiempo_fin_evento = time.time()
        event_duration = round((tiempo_fin_evento - tiempo_inicio_evento) * 1000, 2)  # Convertir a milisegundos

        # Calcular distancia
        duracion = final - inicio
        distancia = (duracion * 34300) / 2  # Velocidad del sonido: 343 m/s

        # Simulación de temperatura en °C (entre 20 y 30 grados)
        temperatura = round(random.uniform(20, 30), 2)

        # Voltaje fijo (5V por la configuración del sistema con resistencias de 3kΩ)
        voltaje = 5.0

        # Datos del sensor
        sensor_data = {
            "sensor_id": "2",
            "type": "ultrasonic",  # Asegurar que tenga siempre un valor
            "status": "active",
            "timestamp": datetime.now(),
            "distance": distancia,
            "event_duration": event_duration,
            "temperature": temperatura,
            "voltage": voltaje
        }

        # Consulta SQL actualizada con event_duration
        query = """
            INSERT INTO sensors 
            (sensor_id, type, status, timestamp, distance, event_duration, temperature, voltage) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = (
            sensor_data["sensor_id"],
            sensor_data["type"],
            sensor_data["status"],
            sensor_data["timestamp"],
            sensor_data["distance"],
            sensor_data["event_duration"],  # Ahora se registra el tiempo del evento
            sensor_data["temperature"],
            sensor_data["voltage"]
        )

        cursor.execute(query, values)
        connection.commit()

        print(f"📏 Distancia: {distancia:.2f} cm | ⏳ Duración: {event_duration} ms | 🌡️ Temp: {temperatura}°C | 🔋 Voltaje: {voltaje}V - Datos registrados en la base de datos")

        # Pausa de 1 segundo antes de la próxima medición
        time.sleep(1)

except Exception as e:
    print(f"❌ Error al conectar con la base de datos o al registrar datos: {e}")

finally:
    GPIO.cleanup()
    if connection:
        cursor.close()
        connection.close()
        print("🔌 Conexión cerrada y GPIO limpiado")
