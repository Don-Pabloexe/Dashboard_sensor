import React from 'react';
import { Scatter } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(CategoryScale, LinearScale, PointElement, Title, Tooltip, Legend);

const TemperatureStatusChart = ({ sensors }) => {
  const data = {
    datasets: [
      {
        label: 'Estado del Sensor (1 = Activo, 0 = Inactivo)',
        data: sensors.map(sensor => ({
          x: sensor.temperature,
          y: sensor.status === 'active' ? 1 : 0,
        })),
        backgroundColor: 'rgba(255, 159, 64, 0.6)',
      },
    ],
  };

  const options = {
    responsive: true,
    plugins: {
      title: { display: true, text: 'Temperatura vs Estado del Sensor' },
    },
    scales: {
      x: { title: { display: true, text: 'Temperatura (°C)' } },
      y: { title: { display: true, text: 'Estado del Sensor' }, ticks: { stepSize: 1 } },
    },
  };

  return <Scatter data={data} options={options} />;
};

export default TemperatureStatusChart;
