
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Student;

@WebServlet("/eventregister")
public class EventRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");

        try {
            int eventId = Integer.parseInt(
                    request.getParameter("eventId"));

            RegistrationService service = new RegistrationService();

            boolean status = service.registerForEvent(
                    student.getStudentId(), eventId);

            if (status) {
                session.setAttribute("dashboardMessage",
                        "Successfully registered for the event!");
            } else {
                session.setAttribute("dashboardMessage",
                        "Registration failed. You may already be registered for this event.");
            }

        } catch (NumberFormatException e) {
            session.setAttribute("dashboardMessage",
                    "Invalid event selection.");
        }

        response.sendRedirect("studentdashboard");
    }
}
