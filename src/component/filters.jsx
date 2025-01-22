import React, { useState } from 'react';

const Filters = ({ onFilter }) => {
  const [type, setType] = useState('');
  const [status, setStatus] = useState('');

  const handleFilter = () => {
    onFilter({ type, status });
  };

  return (
    <div>
      <h3>Filtrar Sensores</h3>
      <label>
        Tipo:
        <input
          type="text"
          value={type}
          onChange={(e) => setType(e.target.value)}
        />
      </label>
      <label>
        Estado:
        <input
          type="text"
          value={status}
          onChange={(e) => setStatus(e.target.value)}
        />
      </label>
      <button onClick={handleFilter}>Aplicar Filtros</button>
    </div>
  );
};

export default Filters;
