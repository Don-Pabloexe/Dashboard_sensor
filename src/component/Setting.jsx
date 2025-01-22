import React, { useState } from "react";

const Settings = () => {
  const [defaultFilter, setDefaultFilter] = useState("");
  const [showColumns, setShowColumns] = useState({
    id: true,
    type: true,
    status: true,
    timestamp: true,
  });
  const [theme, setTheme] = useState("light");
  const [refreshInterval, setRefreshInterval] = useState(30);

  const handleSave = () => {
    alert("Configuración guardada correctamente.");
  };

  return (
    <div className="container mt-5">
      <h2>Configuración del Dashboard</h2>
      <p>Puedes personalizar la visualización de datos y gestionar los sensores desde esta vista.</p>

      {/* Filtros Predeterminados */}
      <div className="mb-4">
        <h4>Filtros Predeterminados</h4>
        <label className="form-label">Tipo de Sensor:</label>
        <select
          className="form-select"
          value={defaultFilter}
          onChange={(e) => setDefaultFilter(e.target.value)}
        >
          <option value="">Todos</option>
          <option value="proximity">Proximidad</option>
          <option value="induction">Inducción</option>
        </select>
      </div>

      {/* Opciones de Visualización */}
      <div className="mb-4">
        <h4>Opciones de Visualización</h4>
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            checked={showColumns.id}
            onChange={(e) => setShowColumns({ ...showColumns, id: e.target.checked })}
          />
          <label className="form-check-label">Mostrar ID</label>
        </div>
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            checked={showColumns.type}
            onChange={(e) => setShowColumns({ ...showColumns, type: e.target.checked })}
          />
          <label className="form-check-label">Mostrar Tipo</label>
        </div>
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            checked={showColumns.status}
            onChange={(e) => setShowColumns({ ...showColumns, status: e.target.checked })}
          />
          <label className="form-check-label">Mostrar Estado</label>
        </div>
        <div className="form-check">
          <input
            className="form-check-input"
            type="checkbox"
            checked={showColumns.timestamp}
            onChange={(e) => setShowColumns({ ...showColumns, timestamp: e.target.checked })}
          />
          <label className="form-check-label">Mostrar Timestamp</label>
        </div>
      </div>

      {/* Tema */}
      <div className="mb-4">
        <h4>Tema</h4>
        <select
          className="form-select"
          value={theme}
          onChange={(e) => setTheme(e.target.value)}
        >
          <option value="light">Claro</option>
          <option value="dark">Oscuro</option>
        </select>
      </div>

      {/* Intervalo de Actualización */}
      <div className="mb-4">
        <h4>Intervalo de Actualización</h4>
        <label className="form-label">Intervalo en segundos:</label>
        <input
          type="number"
          className="form-control"
          value={refreshInterval}
          onChange={(e) => setRefreshInterval(e.target.value)}
          min="5"
          max="300"
        />
      </div>

      {/* Botón Guardar */}
      <button className="btn btn-success" onClick={handleSave}>
        Guardar Configuración
      </button>
    </div>
  );
};

export default Settings;
