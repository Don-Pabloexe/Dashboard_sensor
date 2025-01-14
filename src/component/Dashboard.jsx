import React from 'react';

const Dashboard = () => {
  return (
    <div className="container mt-5">
      <div className="card">
        <div className="card-body">
          <h2 className="card-title">Bienvenido al Sensor Dashboard</h2>
          <p className="card-text">
            Aquí podrás monitorear y analizar datos de sensores de proximidad e
            inducción.
          </p>
          <a href="/details" className="btn btn-primary">
            Ver Detalles de Sensores
          </a>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
