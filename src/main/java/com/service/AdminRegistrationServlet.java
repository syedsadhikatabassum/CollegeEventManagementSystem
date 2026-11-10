package com.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RegistrationDAO;

@WebServlet("/adminregistrations")
public class AdminRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Admin session validation
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        RegistrationDAO dao = new RegistrationDAO();

        try {

            // Get selected event ID
            String eventIdParam = request.getParameter("eventId");

            Integer eventId = null;

            if (eventIdParam != null && !eventIdParam.trim().isEmpty()) {

                try {
                    eventId = Integer.parseInt(eventIdParam);

                    if (eventId <= 0) {
                        response.sendError(
                                HttpServletResponse.SC_BAD_REQUEST,
                                "Invalid event ID");
                        return;
                    }

                } catch (NumberFormatException e) {
                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid event ID");
                    return;
                }
            }

            // Retrieve all events
            List<Map<String, Object>> events =
                    dao.getAllEvents();

            // Retrieve registrations
            List<Map<String, Object>> registrations =
                    dao.getRegistrations(eventId);

            // Send data to JSP
            request.setAttribute("events", events);

            request.setAttribute("registrations",
                    registrations);

            request.setAttribute("selectedEventId",
                    eventId == null ? "" : eventId.toString());

            request.setAttribute("totalRegistrations",
                    registrations.size());

            request.getRequestDispatcher(
                    "adminregistrations.jsp")
                    .forward(request, response);

        } catch (SQLException e) {

            e.printStackTrace();

            throw new ServletException(
                    "Unable to retrieve registration details", e);
        }
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}