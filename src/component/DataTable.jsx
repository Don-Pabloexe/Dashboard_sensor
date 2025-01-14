import React from 'react';

const DataTable = ({ data }) => {
  return (
    <table border="1" style={{ width: '100%', marginTop: '1rem' }}>
      <thead>
        <tr>
          <th>ID del Sensor</th>
          <th>Tipo</th>
          <th>Estado</th>
          <th>Fecha</th>
          <th>Distancia</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item) => (
          <tr key={item.sensor_id}>
            <td>{item.sensor_id}</td>
            <td>{item.type}</td>
            <td>{item.status}</td>
            <td>{item.timestamp}</td>
            <td>{item.distance || '-'}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default DataTable;
