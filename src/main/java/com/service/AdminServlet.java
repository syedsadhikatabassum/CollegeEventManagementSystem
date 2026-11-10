package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/adminservlet")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Admin session validation
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int totalStudents = 0;
        int totalEvents = 0;
        int totalRegistrations = 0;

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new SQLException("Database connection failed");
            }

            // Total Students
            String studentQuery = "SELECT COUNT(*) FROM students";

            try (PreparedStatement ps = con.prepareStatement(studentQuery);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    totalStudents = rs.getInt(1);
                }
            }

            // Total Events
            String eventQuery = "SELECT COUNT(*) FROM events";

            try (PreparedStatement ps = con.prepareStatement(eventQuery);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    totalEvents = rs.getInt(1);
                }
            }

            // Total Registrations
            String registrationQuery =
                    "SELECT COUNT(*) FROM registrations";

            try (PreparedStatement ps =
                    con.prepareStatement(registrationQuery);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    totalRegistrations = rs.getInt(1);
                }
            }

            // Store counts in request
            request.setAttribute("totalStudents", totalStudents);
            request.setAttribute("totalEvents", totalEvents);
            request.setAttribute("totalRegistrations",
                    totalRegistrations);

            request.getRequestDispatcher("admin.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load admin dashboard.");
        }
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}