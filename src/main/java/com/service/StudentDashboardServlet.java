
package com.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Student;
import com.model.Event;
import com.model.Registration;

@WebServlet("/studentdashboard")
public class StudentDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");

        EventService eventService = new EventService();
        RegistrationService registrationService =
                new RegistrationService();

        List<Event> allEvents = eventService.getAllEvents();

        List<Registration> registrations =
                registrationService.getStudentRegistrations(
                        student.getStudentId());

        Set<Integer> registeredIds = new HashSet<Integer>();

        for (Registration registration : registrations) {
            registeredIds.add(registration.getEventId());
        }

        List<Event> registeredEvents = new ArrayList<Event>();
        List<Event> availableEvents = new ArrayList<Event>();

        for (Event event : allEvents) {

            if (registeredIds.contains(event.getEventId())) {
                registeredEvents.add(event);
            } else {
                availableEvents.add(event);
            }
        }

        request.setAttribute("student", student);
        request.setAttribute("registeredEvents", registeredEvents);
        request.setAttribute("availableEvents", availableEvents);

        String message = (String) session.getAttribute("dashboardMessage");

        if (message != null) {
            request.setAttribute("dashboardMessage", message);
            session.removeAttribute("dashboardMessage");
        }

        request.getRequestDispatcher("studentdashboard.jsp")
                .forward(request, response);
    }
}
