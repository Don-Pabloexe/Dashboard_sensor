import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5000', // Cambiar cuando tengamos el backend
});

export default api;
