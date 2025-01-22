import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { fetchSensors } from "../services/api";
import Papa from "papaparse"; // Importar la librería para manejar CSV

// Componente para mostrar los detalles de un evento
const EventDetails = ({ event }) => {
  if (!event) return <p>No hay detalles disponibles.</p>;

  return (
    <table className="table table-bordered">
      <tbody>
        <tr>
          <th>ID</th>
          <td>{event.sensor_id}</td>
        </tr>
        <tr>
          <th>Tipo</th>
          <td>{event.type}</td>
        </tr>
        <tr>
          <th>Estado</th>
          <td>{event.status}</td>
        </tr>
        <tr>
          <th>Timestamp</th>
          <td>{new Date(event.timestamp).toLocaleString()}</td>
        </tr>
        <tr>
          <th>Tipo de Objeto</th>
          <td>{event.object_type || "N/A"}</td>
        </tr>
        <tr>
          <th>Duración del Evento</th>
          <td>{event.event_duration || "N/A"} s</td>
        </tr>
        <tr>
          <th>Temperatura</th>
          <td>{event.temperature || "N/A"} °C</td>
        </tr>
        <tr>
          <th>Voltaje</th>
          <td>{event.voltage || "N/A"} V</td>
        </tr>
      </tbody>
    </table>
  );
};

const SensorDashboard = () => {
  const [sensors, setSensors] = useState([]); // Lista de sensores
  const [groupedSensors, setGroupedSensors] = useState([]); // Sensores agrupados
  const [selectedSensorEvents, setSelectedSensorEvents] = useState([]); // Eventos del sensor seleccionado
  const [selectedEvent, setSelectedEvent] = useState(null); // Evento seleccionado
  const [loadingSensors, setLoadingSensors] = useState(true); // Estado de carga para la lista de sensores
  const navigate = useNavigate(); // Navegación para ir a gráficos

  // Obtener lista de sensores al cargar la vista
  useEffect(() => {
    const getSensors = async () => {
      try {
        const data = await fetchSensors();
        setSensors(data || []); // Asegurarte de que sea un array
        groupSensors(data || []); // Agrupar sensores
      } catch (error) {
        console.error("Error al cargar los sensores:", error);
      } finally {
        setLoadingSensors(false);
      }
    };

    getSensors();
  }, []);

  // Agrupar sensores por sensor_id
  const groupSensors = (sensors) => {
    const grouped = sensors.reduce((acc, sensor) => {
      const existing = acc.find((s) => s.sensor_id === sensor.sensor_id);
      if (!existing) {
        acc.push({ ...sensor, events: [sensor] });
      } else {
        existing.events.push(sensor);
      }
      return acc;
    }, []);
    setGroupedSensors(grouped);
  };

  // Manejar la selección de un sensor
  const handleSensorClick = (sensorId) => {
    const sensorData = groupedSensors.find((sensor) => sensor.sensor_id === sensorId);
    if (sensorData) {
      setSelectedSensorEvents(sensorData.events);
      setSelectedEvent(null); // Limpiamos el evento seleccionado
    }
  };

  // Manejar la selección de un evento desde el dropdown
  const handleEventSelect = (eventIndex) => {
    const selected = selectedSensorEvents[eventIndex];
    setSelectedEvent(selected);
  };

  // Exportar datos a CSV
  const exportToCSV = () => {
    const csvData = sensors.map((sensor) => ({
      ID: sensor.sensor_id,
      Tipo: sensor.type,
      Estado: sensor.status,
      Timestamp: new Date(sensor.timestamp).toLocaleString(),
      Distancia: sensor.distance || "N/A",
      "Tipo de Objeto": sensor.object_type || "N/A",
      "Duración del Evento": sensor.event_duration || "N/A",
      Temperatura: sensor.temperature || "N/A",
      Voltaje: sensor.voltage || "N/A",
    }));

    const csv = Papa.unparse(csvData);

    const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);

    const link = document.createElement("a");
    link.href = url;
    link.setAttribute("download", "sensors_data.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Dashboard de Sensores</h1>
      <div className="d-flex justify-content-between mb-4">
        {/* Botón para ir a los gráficos */}
        <button
          className="btn btn-success"
          onClick={() => navigate("/charts")}
        >
          Ver Gráficos
        </button>

        {/* Botón para exportar CSV */}
        <button className="btn btn-primary" onClick={exportToCSV}>
          Exportar Datos a CSV
        </button>
      </div>
      <div className="row">
        {/* Columna de la lista de sensores */}
        <div className="col-md-6">
          <h3>Lista de Sensores</h3>
          {loadingSensors ? (
            <div className="text-center">
              <div className="spinner-border" role="status">
                <span className="visualmente-hidden">Cargando...</span>
              </div>
            </div>
          ) : (
            <table className="table table-striped table-bordered">
              <thead className="table-dark">
                <tr>
                  <th>ID</th>
                  <th>Tipo</th>
                  <th>Total Eventos</th>
                  <th>Acción</th>
                </tr>
              </thead>
              <tbody>
                {groupedSensors.map((sensor) => (
                  <tr key={sensor.sensor_id}>
                    <td>{sensor.sensor_id}</td>
                    <td>{sensor.type}</td>
                    <td>{sensor.events.length}</td>
                    <td>
                      <button
                        className="btn btn-info btn-sm"
                        onClick={() => handleSensorClick(sensor.sensor_id)}
                      >
                        Ver Eventos
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>

        {/* Columna de los eventos del sensor */}
        <div className="col-md-6">
          <h3>Eventos del Sensor</h3>
          {selectedSensorEvents.length > 0 ? (
            <div>
              {/* Dropdown de eventos */}
              <select
                className="form-select"
                onChange={(e) => handleEventSelect(e.target.value)}
                defaultValue=""
              >
                <option value="" disabled>
                  Seleccionar Evento
                </option>
                {selectedSensorEvents.map((event, index) => (
                  <option key={index} value={index}>
                    Evento {index + 1}
                  </option>
                ))}
              </select>

              {/* Detalles del evento seleccionado */}
              <div className="mt-3">
                {selectedEvent ? (
                  <EventDetails event={selectedEvent} />
                ) : (
                  <p className="text-center">Selecciona un evento para ver los detalles.</p>
                )}
              </div>
            </div>
          ) : (
            <p className="text-center">Selecciona un sensor para ver los eventos.</p>
          )}
        </div>
      </div>
    </div>
  );
};

export default SensorDashboard;
