package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/updateevent")
public class UpdateEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("event_id");
        String name = request.getParameter("event_name");
        String category = request.getParameter("category");
        String date = request.getParameter("event_date");
        String time = request.getParameter("event_time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");
        String max = request.getParameter("max_participants");

        String sql = "UPDATE events SET event_name=?, category=?, "
                + "event_date=?, event_time=?, venue=?, description=?, "
                + "max_participants=? WHERE event_id=?";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new ServletException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, name);
                ps.setString(2, category);
                ps.setDate(3, Date.valueOf(LocalDate.parse(date)));
                ps.setTime(4, Time.valueOf(LocalTime.parse(time)));
                ps.setString(5, venue);
                ps.setString(6, description);
                ps.setInt(7, Integer.parseInt(max));
                ps.setInt(8, Integer.parseInt(id));

                int result = ps.executeUpdate();

                if (result > 0) {
                    con.commit();
                } else {
                    con.rollback();
                    throw new ServletException("Event not found.");
                }
            }

            response.sendRedirect("adminevents");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Unable to update event.", e);
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("adminevents");
    }
}