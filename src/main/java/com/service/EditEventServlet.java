package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/editevent")
public class EditEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("id");

        if (id == null) {
            response.sendRedirect("adminevents");
            return;
        }

        String sql = "SELECT * FROM events WHERE event_id = ?";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new ServletException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, Integer.parseInt(id));

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        request.setAttribute("eventId",
                                rs.getInt("event_id"));

                        request.setAttribute("eventName",
                                rs.getString("event_name"));

                        request.setAttribute("category",
                                rs.getString("category"));

                        request.setAttribute("eventDate",
                                rs.getString("event_date"));

                        request.setAttribute("eventTime",
                                rs.getString("event_time"));

                        request.setAttribute("venue",
                                rs.getString("venue"));

                        request.setAttribute("description",
                                rs.getString("description"));

                        request.setAttribute("maxParticipants",
                                rs.getInt("max_participants"));

                        request.getRequestDispatcher("editevent.jsp")
                                .forward(request, response);

                    } else {
                        response.sendRedirect("adminevents");
                    }
                }
            }

        } catch (Exception e) {
            throw new ServletException("Unable to retrieve event", e);
        }
    }
}