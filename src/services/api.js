import axios from 'axios';

const api = axios.create({
  baseURL: 'http://192.168.101.6:5000/api', // Cambia la URL según tu backend
});

// Función para obtener todos los sensores
export const fetchSensors = async () => {
  try {
    const response = await api.get('/sensors');
    return response.data;
  } catch (error) {
    console.error('Error al obtener sensores:', error);
    throw error;
  }
};

// Función para obtener un sensor por su ID
export const fetchSensorById = async (id) => {
  try {
    const response = await api.get(`/sensors/${id}`);
    return response.data;
  } catch (error) {
    console.error('Error al obtener el sensor por ID:', error);
    throw error;
  }
};

export default api;
