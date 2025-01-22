import React from 'react';
import { Pie } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  ArcElement,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, ArcElement, Tooltip, Legend);

const SensorStatusChart = ({ sensors }) => {
  // Contar sensores por estado
  const statusCounts = sensors.reduce(
    (acc, sensor) => {
      if (sensor.status === 'active') acc.active++;
      if (sensor.status === 'inactive') acc.inactive++;
      return acc;
    },
    { active: 0, inactive: 0 }
  );

  const data = {
    labels: ['Activo', 'Inactivo'],
    datasets: [
      {
        data: [statusCounts.active, statusCounts.inactive],
        backgroundColor: ['rgba(54, 235, 162, 0.6)', 'rgba(255, 99, 132, 0.6)'],
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      legend: { position: 'top' },
      title: { display: true, text: 'Estado de los Sensores' },
    },
  };

  return <Pie data={data} options={options} />;
};

export default SensorStatusChart;
