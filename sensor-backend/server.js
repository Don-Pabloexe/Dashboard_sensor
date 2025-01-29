const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { Pool } = require('pg');

const app = express();
const PORT = 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Configuración de PostgreSQL
const pool = new Pool({
  user: 'postgres', // Cambia esto según tu configuración
  host: '192.168.101.7',
  database: 'dashboard_sensor', // Nombre de tu base de datos
  password: '12345', // Contraseña de tu usuario
  port: 5432,
});

// Verificar conexión con la base de datos
pool.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
  } else {
    console.log('Conexión exitosa a la base de datos');
  }
});

// Rutas
// Obtener todos los sensores
app.get('/api/sensors', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM sensors');
    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener sensores:', error);
    res.status(500).send('Error al obtener sensores');
  }
});

// Obtener un sensor por ID
app.get('/api/sensors/:id', async (req, res) => {
    const { id } = req.params; // ID del sensor desde la URL
  
    // Validar que el ID sea un número
    if (!id || isNaN(id)) {
      return res.status(400).send('El ID proporcionado no es válido');
    }
  
    try {
      const result = await pool.query('SELECT * FROM sensors WHERE sensor_id = $1', [id]);
      if (result.rows.length === 0) {
        return res.status(404).send('Sensor no encontrado');
      }
      res.json(result.rows[0]);
    } catch (error) {
      console.error('Error al obtener el sensor:', error);
      res.status(500).send('Error al obtener el sensor');
    }
  });
  

// Agregar un sensor
app.post('/api/sensors', async (req, res) => {
  const { type, status, timestamp, distance, object_type, event_duration, field_intensity, temperature, voltage } = req.body;

  try {
    const result = await pool.query(
      `INSERT INTO sensors 
        (type, status, timestamp, distance, object_type, event_duration, field_intensity, temperature, voltage) 
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *`,
      [type, status, timestamp, distance, object_type, event_duration, field_intensity, temperature, voltage]
    );
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error('Error al agregar sensor:', error);
    res.status(500).send('Error al agregar sensor');
  }
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
