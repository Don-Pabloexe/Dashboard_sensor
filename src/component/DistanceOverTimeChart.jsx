import React from 'react';
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const DistanceOverTimeChart = ({ sensors }) => {
  // Ordenar los datos por timestamp
  const sortedData = sensors
    .filter((sensor) => sensor.distance) // Filtrar solo sensores con distancia registrada
    .sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));

  const data = {
    labels: sortedData.map((sensor) => new Date(sensor.timestamp).toLocaleString()), // Timestamps
    datasets: [
      {
        label: 'Distancia Detectada (mm)',
        data: sortedData.map((sensor) => sensor.distance), // Distancia detectada
        borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        tension: 0.3,
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      legend: { position: 'top' },
      title: { display: true, text: 'Distancia Detectada vs. Tiempo' },
    },
  };

  return <Line data={data} options={options} />;
};

export default DistanceOverTimeChart;
