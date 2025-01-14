import React from 'react';
import { Bar } from 'react-chartjs-2';

const Chart = ({ data }) => {
  const chartData = {
    labels: data.map((item) => item.timestamp),
    datasets: [
      {
        label: 'Duración de eventos',
        data: data.map((item) => item.event_duration),
        backgroundColor: 'rgba(75, 192, 192, 0.6)',
      },
    ],
  };

  return <Bar data={chartData} />;
};

export default Chart;
