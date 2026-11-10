package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Event;

public class EventDAO {

    // Add a new event
    public boolean addEvent(Event event) {

        String sql = "INSERT INTO events "
                + "(event_name, category, event_date, event_time, "
                + "venue, description, max_participants) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, event.getEventName());
            ps.setString(2, event.getCategory());
            ps.setString(3, event.getEventDate());
            ps.setString(4, event.getEventTime());
            ps.setString(5, event.getVenue());
            ps.setString(6, event.getDescription());
            ps.setInt(7, event.getMaxParticipants());

            int result = ps.executeUpdate();

            connection.commit();
            ps.close();
            connection.close();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return false;
        }
    }

    // Display all events
    public List<Event> getAllEvents() {

        List<Event> eventList = new ArrayList<Event>();

        String sql = "SELECT * FROM events";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return eventList;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Event event = new Event();

                event.setEventId(rs.getInt("event_id"));
                event.setEventName(rs.getString("event_name"));
                event.setCategory(rs.getString("category"));
                event.setEventDate(rs.getString("event_date"));
                event.setEventTime(rs.getString("event_time"));
                event.setVenue(rs.getString("venue"));
                event.setDescription(rs.getString("description"));
                event.setMaxParticipants(rs.getInt("max_participants"));

                eventList.add(event);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return eventList;
    }

    // Get event using event ID
    public Event getEventById(int eventId) {

        String sql = "SELECT * FROM events WHERE event_id = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return null;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eventId);

            ResultSet rs = ps.executeQuery();

            Event event = null;

            if (rs.next()) {
                event = new Event();

                event.setEventId(rs.getInt("event_id"));
                event.setEventName(rs.getString("event_name"));
                event.setCategory(rs.getString("category"));
                event.setEventDate(rs.getString("event_date"));
                event.setEventTime(rs.getString("event_time"));
                event.setVenue(rs.getString("venue"));
                event.setDescription(rs.getString("description"));
                event.setMaxParticipants(rs.getInt("max_participants"));
            }

            rs.close();
            ps.close();
            connection.close();

            return event;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return null;
        }
    }

    // Delete an event
    public boolean deleteEvent(int eventId) {

        String sql = "DELETE FROM events WHERE event_id = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eventId);

            int result = ps.executeUpdate();

            connection.commit();
            ps.close();
            connection.close();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return false;
        }
    }
}