package com.service;

import java.util.List;

import com.dao.EventDAO;
import com.model.Event;

public class EventService {

    private EventDAO eventDAO = new EventDAO();

    // Add a new event
    public boolean addEvent(Event event) {
        return eventDAO.addEvent(event);
    }

    // Get all events
    public List<Event> getAllEvents() {
        return eventDAO.getAllEvents();
    }

    // Get event by ID
    public Event getEventById(int eventId) {
        return eventDAO.getEventById(eventId);
    }

    // Delete an event
    public boolean deleteEvent(int eventId) {
        return eventDAO.deleteEvent(eventId);
    }
}