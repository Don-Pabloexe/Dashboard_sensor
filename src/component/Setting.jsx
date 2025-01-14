import React from 'react';

const Settings = () => {
  return (
    <div className="container mt-5">
      <h2>Configuración del Dashboard</h2>
      <p>
        Puedes personalizar la visualización de datos y gestionar los
        sensores desde esta vista.
      </p>
      <button className="btn btn-success">Guardar Configuración</button>
    </div>
  );
};

export default Settings;
