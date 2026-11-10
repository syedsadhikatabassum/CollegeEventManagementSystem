package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/addeventservlet")
public class AddEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String eventName = request.getParameter("event_name");
        String category = request.getParameter("category");
        String eventDate = request.getParameter("event_date");
        String eventTime = request.getParameter("event_time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");
        String maxParticipants = request.getParameter("max_participants");

        String sql = "INSERT INTO events "
                + "(event_name, category, event_date, event_time, "
                + "venue, description, max_participants) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new Exception("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, eventName);
                ps.setString(2, category);
                ps.setDate(3, Date.valueOf(LocalDate.parse(eventDate)));
                ps.setTime(4, Time.valueOf(LocalTime.parse(eventTime)));
                ps.setString(5, venue);
                ps.setString(6, description);
                ps.setInt(7, Integer.parseInt(maxParticipants));

                int result = ps.executeUpdate();

                if (result > 0) {
                    con.commit();
                    response.sendRedirect("adminevents");
                } else {
                    con.rollback();
                    request.setAttribute("status", "Unable to add event.");
                    request.getRequestDispatcher("addevent.jsp")
                            .forward(request, response);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("status",
                    "Error adding event. Please check the details.");

            request.getRequestDispatcher("addevent.jsp")
                    .forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("addevent.jsp");
    }
}