import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './component/Navbar';
import Dashboard from './component/Dashboard';
import SensorDetail from './component/SensorDetails';
import Settings from './component/Setting';
import 'bootstrap/dist/css/bootstrap.min.css';
import './styles/custom.css';



const App = () => {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/details" element={<SensorDetail />} />
        <Route path="/settings" element={<Settings />} />
      </Routes>
    </Router>
  );
};

export default App;
