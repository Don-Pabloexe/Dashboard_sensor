import React from 'react';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const EventDurationByObjectChart = ({ sensors }) => {
  const objectTypes = [...new Set(sensors.map(sensor => sensor.object_type))];
  const data = {
    labels: objectTypes.filter(type => type !== null), // Excluir nulos
    datasets: [
      {
        label: 'Duración Promedio (s)',
        data: objectTypes.map(type => {
          const filtered = sensors.filter(sensor => sensor.object_type === type);
          const totalDuration = filtered.reduce((acc, curr) => acc + (curr.event_duration || 0), 0);
          return filtered.length ? totalDuration / filtered.length : 0;
        }),
        backgroundColor: 'rgba(75, 192, 192, 0.6)',
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      title: { display: true, text: 'Duración del Evento por Tipo de Objeto Detectado' },
    },
  };

  return <Bar data={data} options={options} />;
};

export default EventDurationByObjectChart;
