package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/adminevents")
public class AdminEventsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, Object>> events = new ArrayList<>();

        String sql = "SELECT * FROM events ORDER BY event_id";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new ServletException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Map<String, Object> event = new HashMap<>();

                    event.put("event_id", rs.getInt("event_id"));
                    event.put("event_name", rs.getString("event_name"));
                    event.put("category", rs.getString("category"));
                    event.put("event_date", rs.getString("event_date"));
                    event.put("event_time", rs.getString("event_time"));
                    event.put("venue", rs.getString("venue"));
                    event.put("description", rs.getString("description"));
                    event.put("max_participants",
                            rs.getInt("max_participants"));

                    events.add(event);
                }
            }

            request.setAttribute("events", events);

            request.getRequestDispatcher("adminevents.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Unable to load events", e);
        }
    }
}