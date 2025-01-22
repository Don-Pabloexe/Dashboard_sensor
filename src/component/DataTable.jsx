import React from 'react';

const DataTable = ({ sensors }) => {
  return (
    <div className="table-responsive">
      <table className="table table-striped table-bordered">
        <thead className="table-dark">
          <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Estado</th>
            <th>Fecha</th>
            <th>Distancia</th>
          </tr>
        </thead>
        <tbody>
          {sensors.map((sensor) => (
            <tr key={sensor.id}>
              <td>{sensor.id}</td>
              <td>{sensor.type}</td>
              <td>{sensor.status}</td>
              <td>{sensor.timestamp}</td>
              <td>{sensor.distance || '-'}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default DataTable;
