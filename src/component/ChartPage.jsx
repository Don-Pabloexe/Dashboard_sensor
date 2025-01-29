import React from 'react';
import ActivationFrequencyChart from './ActivationFrequencyChart';
import DistanceOverTimeChart from './DistanceOverTimeChart';
import SensorStatusChart from './SensorStatusChart';
import TemperatureStatusChart from './TemperatureStatusChart';
import VoltageBySensorChart from './VoltageBySensorChart';
import EventDurationByObjectChart from './EventDurationByObjectChart';


const ChartsPage = ({ sensors }) => {
  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Gráficos de Sensores</h1>
      <div className="row">
        <div className="col-md-6 mb-4">
          <ActivationFrequencyChart sensors={sensors} />
        </div>
        <div className="col-md-6 mb-4">
          <SensorStatusChart sensors={sensors} />
        </div>
        <div className="col-md-12">
          <DistanceOverTimeChart sensors={sensors} />
        </div>
        <div className="col-md-6 mb-4">
          <TemperatureStatusChart sensors={sensors} />
        </div>
        <div className="col-md-6 mb-4">
          <VoltageBySensorChart sensors={sensors} />
        </div>
        <div className="col-md-6 mb-4">
          <EventDurationByObjectChart sensors={sensors} />
        </div>
      </div>
    </div>
  );
};

export default ChartsPage;
