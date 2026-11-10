package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.Registration;

public class RegistrationDAO {

    // Register a student for an event
    public boolean registerForEvent(int studentId, int eventId) {

        String sql = "INSERT INTO registrations "
                + "(student_id, event_id) VALUES (?, ?)";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setInt(2, eventId);

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

    // Display registrations of a student
    public List<Registration> getStudentRegistrations(int studentId) {

        List<Registration> registrationList =
                new ArrayList<Registration>();

        String sql = "SELECT * FROM registrations WHERE student_id = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return registrationList;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Registration registration = new Registration();

                registration.setRegistrationId(
                        rs.getInt("registration_id"));

                registration.setStudentId(
                        rs.getInt("student_id"));

                registration.setEventId(
                        rs.getInt("event_id"));

                registration.setRegistrationDate(
                        rs.getString("registration_date"));

                registration.setStatus(
                        rs.getString("status"));

                registrationList.add(registration);
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

        return registrationList;
    }

    // Cancel a student registration
    public boolean cancelRegistration(int registrationId) {

        String sql = "DELETE FROM registrations "
                + "WHERE registration_id = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, registrationId);

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
 // Get all registrations or filter by event ID
    public List<Map<String, Object>> getRegistrations(
            Integer eventId) throws SQLException {

        List<Map<String, Object>> registrations =
                new ArrayList<>();

        String sql = "SELECT "
                + "r.registration_id, "
                + "r.registration_date, "
                + "r.status, "
                + "s.student_id, "
                + "s.name AS student_name, "
                + "s.email, "
                + "e.event_id, "
                + "e.event_name "
                + "FROM registrations r "
                + "JOIN students s ON r.student_id = s.student_id "
                + "JOIN events e ON r.event_id = e.event_id ";

        if (eventId != null) {
            sql += "WHERE e.event_id = ? ";
        }

        sql += "ORDER BY e.event_name, r.registration_date DESC";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new SQLException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                if (eventId != null) {
                    ps.setInt(1, eventId);
                }

                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {

                        Map<String, Object> registration =
                                new HashMap<>();

                        registration.put("registration_id",
                                rs.getInt("registration_id"));

                        registration.put("student_id",
                                rs.getInt("student_id"));

                        registration.put("student_name",
                                rs.getString("student_name"));

                        registration.put("email",
                                rs.getString("email"));

                        registration.put("event_id",
                                rs.getInt("event_id"));

                        registration.put("event_name",
                                rs.getString("event_name"));

                        registration.put("registration_date",
                                rs.getTimestamp("registration_date"));

                        registration.put("status",
                                rs.getString("status"));

                        registrations.add(registration);
                    }
                }
            }
        }

        return registrations;
    }


    // Get all events for dropdown
    public List<Map<String, Object>> getAllEvents()
            throws SQLException {

        List<Map<String, Object>> events = new ArrayList<>();

        String sql = "SELECT event_id, event_name FROM events "
                + "ORDER BY event_name";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new SQLException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Map<String, Object> event = new HashMap<>();

                    event.put("event_id", rs.getInt("event_id"));
                    event.put("event_name",
                            rs.getString("event_name"));

                    events.add(event);
                }
            }
        }

        return events;
    }
}