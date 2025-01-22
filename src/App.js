import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './component/Navbar';
import SensorDashboard from './component/Dashboard';
import Settings from './component/Setting';
import ChartsPage from './component/ChartPage';
import { fetchSensors } from './services/api'; // Importa la función para obtener los datos
import 'bootstrap/dist/css/bootstrap.min.css';
import './styles/custom.css';

const App = () => {
  const [sensors, setSensors] = useState([]); // Estado para almacenar los sensores
  const [loading, setLoading] = useState(true); // Estado para manejar el loading

  // Obtener los datos de los sensores al cargar la aplicación
  useEffect(() => {
    const getSensors = async () => {
      try {
        const data = await fetchSensors();
        setSensors(data || []); // Asegurarte de que siempre sea un array
      } catch (error) {
        console.error('Error al cargar los sensores:', error.message);
      } finally {
        setLoading(false);
      }
    };

    getSensors();
  }, []);

  // Mostrar un mensaje de carga mientras se obtienen los datos
  if (loading) {
    return <div className="text-center mt-5">Cargando...</div>;
  }

  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<SensorDashboard />} />
        <Route path="/settings" element={<Settings />} />
        <Route path="/charts" element={<ChartsPage sensors={sensors} />} />
      </Routes>
    </Router>
  );
};

export default App;
