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

const ActivationFrequencyChart = ({ sensors }) => {
  // Contar activaciones por tipo de sensor
  const activationCounts = sensors.reduce(
    (acc, sensor) => {
      if (sensor.type === 'proximity') acc.proximity++;
      if (sensor.type === 'induction') acc.induction++;
      return acc;
    },
    { proximity: 0, induction: 0 }
  );

  const data = {
    labels: ['Proximidad', 'Inducción'],
    datasets: [
      {
        label: 'Frecuencia de Activación',
        data: [activationCounts.proximity, activationCounts.induction],
        backgroundColor: ['rgba(54, 162, 235, 0.6)', 'rgba(255, 99, 132, 0.6)'],
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      legend: { position: 'top' },
      title: { display: true, text: 'Frecuencia de Activación por Tipo de Sensor' },
    },
  };

  return <Bar data={data} options={options} />;
};

export default ActivationFrequencyChart;
