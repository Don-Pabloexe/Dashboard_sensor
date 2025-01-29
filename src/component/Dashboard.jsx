import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { fetchSensors } from "../services/api";
import Papa from "papaparse";

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
  const [sensors, setSensors] = useState([]);
  const [filteredSensors, setFilteredSensors] = useState([]);
  const [groupedSensors, setGroupedSensors] = useState([]);
  const [selectedSensorEvents, setSelectedSensorEvents] = useState([]);
  const [selectedEvent, setSelectedEvent] = useState(null);
  const [loadingSensors, setLoadingSensors] = useState(true);

  // Configuración desde Settings
  const [typeFilter, setTypeFilter] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");
  const [visibleColumns, setVisibleColumns] = useState({
    id: true,
    type: true,
    status: true,
    timestamp: true,
  });
  const [theme, setTheme] = useState("light");

  const navigate = useNavigate();

  useEffect(() => {
    const getSensors = async () => {
      try {
        const data = await fetchSensors();
        setSensors(data || []);
        setFilteredSensors(data || []);
        groupSensors(data || []);
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
      setSelectedEvent(null);
    }
  };

  // Manejar la selección de un evento desde el dropdown
  const handleEventSelect = (eventIndex) => {
    const selected = selectedSensorEvents[eventIndex];
    setSelectedEvent(selected);
  };

  // Aplicar filtros
  const applyFilters = () => {
    let filtered = sensors;

    if (typeFilter) {
      filtered = filtered.filter((sensor) => sensor.type === typeFilter);
    }

    if (statusFilter) {
      filtered = filtered.filter((sensor) => sensor.status === statusFilter);
    }

    if (startDate) {
      filtered = filtered.filter(
        (sensor) => new Date(sensor.timestamp) >= new Date(startDate)
      );
    }

    if (endDate) {
      filtered = filtered.filter(
        (sensor) => new Date(sensor.timestamp) <= new Date(endDate)
      );
    }

    setFilteredSensors(filtered);
    groupSensors(filtered);
  };

  // Exportar datos a CSV
  const exportToCSV = () => {
    const csvData = filteredSensors.map((sensor) => ({
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
    link.setAttribute("download", "filtered_sensors_data.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <div className={`container mt-5 ${theme === "dark" ? "bg-dark text-white" : ""}`}>
      <h1 className="text-center mb-4">Dashboard de Sensores</h1>
      <div className="d-flex justify-content-between mb-4">
        <button className="btn btn-success" onClick={() => navigate("/charts")}>
          Ver Gráficos
        </button>
        <button className="btn btn-primary" onClick={exportToCSV}>
          Exportar Datos Filtrados a CSV
        </button>
      </div>

      {/* Filtros */}
      <div className="row mb-4">
        <div className="col-md-3">
          <label>Tipo de Sensor:</label>
          <select
            className="form-select"
            value={typeFilter}
            onChange={(e) => setTypeFilter(e.target.value)}
          >
            <option value="">Todos</option>
            <option value="proximity">Aproximación</option>
            <option value="induction">Inducción</option>
          </select>
        </div>
        <div className="col-md-3">
          <label>Estado del Sensor:</label>
          <select
            className="form-select"
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
          >
            <option value="">Todos</option>
            <option value="active">Activo</option>
            <option value="inactive">Inactivo</option>
          </select>
        </div>
        <div className="col-md-3">
          <label>Fecha de Inicio:</label>
          <input
            type="date"
            className="form-control"
            value={startDate}
            onChange={(e) => setStartDate(e.target.value)}
          />
        </div>
        <div className="col-md-3">
          <label>Fecha de Fin:</label>
          <input
            type="date"
            className="form-control"
            value={endDate}
            onChange={(e) => setEndDate(e.target.value)}
          />
        </div>
      </div>
      <button className="btn btn-secondary mb-4" onClick={applyFilters}>
        Aplicar Filtros
      </button>

      {/* Tabla de Sensores */}
      <div className="row">
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
                  {visibleColumns.id && <th>ID</th>}
                  {visibleColumns.type && <th>Tipo</th>}
                  {visibleColumns.status && <th>Estado</th>}
                  {visibleColumns.timestamp && <th>Timestamp</th>}
                  <th>Acción</th>
                </tr>
              </thead>
              <tbody>
                {groupedSensors.map((sensor) => (
                  <tr key={sensor.sensor_id}>
                    {visibleColumns.id && <td>{sensor.sensor_id}</td>}
                    {visibleColumns.type && <td>{sensor.type}</td>}
                    {visibleColumns.status && <td>{sensor.status}</td>}
                    {visibleColumns.timestamp && <td>{new Date(sensor.timestamp).toLocaleString()}</td>}
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

        {/* Detalles del Sensor */}
        <div className="col-md-6">
          <h3>Eventos del Sensor</h3>
          {selectedSensorEvents.length > 0 ? (
            <div>
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
    