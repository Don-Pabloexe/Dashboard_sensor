import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { fetchSensors } from "../services/api";

// Componente para mostrar detalles del evento
const EventDetails = ({ event }) => {
  if (!event) return <p>No hay detalles disponibles.</p>;

  return (
    <table className="table table-bordered">
      <tbody>
        <tr>
          <th>ID</th>
          <td>{event.sensor_id}</td>
        </tr>
        <tr>
          <th>Tipo</th>
          <td>{event.type}</td>
        </tr>
        <tr>
          <th>Estado</th>
          <td>{event.status}</td>
        </tr>
        <tr>
          <th>Timestamp</th>
          <td>{new Date(event.timestamp).toLocaleString()}</td>
        </tr>
      </tbody>
    </table>
  );
};

const EventsPage = () => {
  const { id } = useParams(); // ID del sensor seleccionado
  const [events, setEvents] = useState([]); // Eventos del sensor
  const [selectedEvent, setSelectedEvent] = useState(null); // Evento seleccionado
  const navigate = useNavigate();

  useEffect(() => {
    const getEvents = async () => {
      try {
        const data = await fetchSensors(); // Obtener eventos desde la API
        const sensorEvents = data.filter((sensor) => sensor.sensor_id === id);
        setEvents(sensorEvents);
      } catch (error) {
        console.error("Error al cargar los eventos:", error);
      }
    };

    getEvents();
  }, [id]);

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Eventos del Sensor {id}</h1>
      <button className="btn btn-secondary mb-4" onClick={() => navigate("/")}>
        Volver al Dashboard
      </button>
      <div className="row">
        <div className="col-md-6">
          <h3>Eventos</h3>
          <ul className="list-group">
            {events.map((event, index) => (
              <li
                key={index}
                className={`list-group-item ${
                  selectedEvent === event ? "active" : ""
                }`}
                onClick={() => setSelectedEvent(event)}
              >
                Evento {index + 1} - {new Date(event.timestamp).toLocaleString()}
              </li>
            ))}
          </ul>
        </div>
        <div className="col-md-6">
          <h3>Detalles del Evento</h3>
          <EventDetails event={selectedEvent} />
        </div>
      </div>
    </div>
  );
};

export default EventsPage;
