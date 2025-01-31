import RPi.GPIO as GPIO
import psycopg2  # Librería para conectarse a PostgreSQL
import time
from datetime import datetime

# Configuración de los pines GPIO
GPIO.setmode(GPIO.BCM)  # Usamos el sistema de numeración BCM
GPIO_SENSOR = 23       # Pin GPIO al que está conectado el sensor

# Configuración del pin
GPIO.setup(GPIO_SENSOR, GPIO.IN)  # Configuramos el pin como entrada

# Configuración de la base de datos PostgreSQL
DB_CONFIG = {
    "host": "192.168.1.100",  # IP del PC donde está la base de datos
    "database": "dashboard_sensor",  # Nombre de la base de datos
    "user": "postgres",  # Usuario de PostgreSQL
    "password": "12345"  # Contraseña de PostgreSQL
}

# Valores estáticos
TEMPERATURE = 25.0  # Temperatura estándar en °C (ajústala según el sensor)
VOLTAGE = 4.5  # Voltaje calculado en V

# Conexión a la base de datos
try:
    connection = psycopg2.connect(**DB_CONFIG)
    cursor = connection.cursor()
    print("Conexión exitosa a la base de datos")

    print("Iniciando lectura del sensor de detección de metales...")

    while True:
        sensor_state = GPIO.input(GPIO_SENSOR)  # Leemos el estado del pin
        timestamp = datetime.now()  # Capturamos el tiempo actual

        # Determinar el estado del sensor
        status = "active" if sensor_state == GPIO.LOW else "inactive"
        object_type = "metal"  # Siempre es metal
        event_duration = 0.5  # Duración del evento en segundos (tiempo entre lecturas)

        # Mostrar en consola el estado y los datos generados
        print(f"Estado del sensor: {status} - Timestamp: {timestamp}")
        print(f"Tipo de objeto: {object_type}, Duración del evento: {event_duration}s")
        print(f"Temperatura: {TEMPERATURE} °C, Voltaje: {VOLTAGE} V")

        # Insertar el dato en la base de datos
        try:
            query = """
                INSERT INTO sensors (sensor_id, type, status, timestamp, object_type, event_duration, temperature, voltage)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                "1",  # ID del sensor (puedes hacerlo dinámico si tienes múltiples sensores)
                "induction",  # Tipo de sensor
                status,  # Estado del sensor
                timestamp,  # Timestamp del evento
                object_type,  # Tipo de objeto detectado
                event_duration,  # Duración del evento
                TEMPERATURE,  # Temperatura estándar
                VOLTAGE  # Voltaje calculado
            )
            cursor.execute(query, values)
            connection.commit()
            print("Dato insertado en la base de datos")
        except Exception as e:
            print(f"Error al insertar en la base de datos: {e}")

        time.sleep(0.5)  # Pausa de 500 ms entre lecturas

except KeyboardInterrupt:
    print("\nDetenido por el usuario")
except Exception as e:
    print(f"Error al conectar con la base de datos: {e}")
finally:
    GPIO.cleanup()  # Limpia la configuración de los GPIO al salir
    if connection:
        cursor.close()
        connection.close()
        print("Conexión a la base de datos cerrada")
