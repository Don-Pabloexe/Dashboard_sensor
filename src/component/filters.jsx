import React, { useState } from 'react';

const Filters = ({ onApplyFilters }) => {
  const [type, setType] = useState('');
  const [status, setStatus] = useState('');

  const applyFilters = () => {
    onApplyFilters({ type, status });
  };

  return (
    <div>
      <h2>Filtros</h2>
      <select onChange={(e) => setType(e.target.value)}>
        <option value="">Todos los tipos</option>
        <option value="proximity">Aproximación</option>
        <option value="induction">Inducción</option>
      </select>
      <select onChange={(e) => setStatus(e.target.value)}>
        <option value="">Todos los estados</option>
        <option value="active">Activo</option>
        <option value="inactive">Inactivo</option>
      </select>
      <button onClick={applyFilters}>Aplicar Filtros</button>
    </div>
  );
};

export default Filters;
