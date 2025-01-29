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

const VoltageBySensorChart = ({ sensors }) => {
  const data = {
    labels: ['Proximidad', 'Inducción'],
    datasets: [
      {
        label: 'Voltaje Promedio (V)',
        data: [
          sensors.filter(sensor => sensor.type === 'proximity').reduce((acc, curr) => acc + (curr.voltage || 0), 0) /
            sensors.filter(sensor => sensor.type === 'proximity').length,
          sensors.filter(sensor => sensor.type === 'induction').reduce((acc, curr) => acc + (curr.voltage || 0), 0) /
            sensors.filter(sensor => sensor.type === 'induction').length,
        ],
        backgroundColor: ['rgba(54, 162, 235, 0.6)', 'rgba(255, 99, 132, 0.6)'],
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      title: { display: true, text: 'Voltaje Promedio por Tipo de Sensor' },
    },
    scales: {
      y: { beginAtZero: true, title: { display: true, text: 'Voltaje (V)' } },
    },
  };

  return <Bar data={data} options={options} />;
};

export default VoltageBySensorChart;
