
package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Student;

@WebServlet("/editprofile")
public class EditProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Open edit profile page
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("student");

        request.setAttribute("student", student);

        request.getRequestDispatcher("editprofile.jsp")
                .forward(request, response);
    }

    // Save updated profile
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Student oldStudent = (Student) session.getAttribute("student");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String mobile = request.getParameter("mobile");

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {

            request.setAttribute("status",
                    "Name and email are required.");
            request.setAttribute("student", oldStudent);

            request.getRequestDispatcher("editprofile.jsp")
                    .forward(request, response);
            return;
        }

        Student student = new Student();

        student.setStudentId(oldStudent.getStudentId());
        student.setName(name.trim());
        student.setEmail(email.trim());
        student.setPassword(oldStudent.getPassword());
        student.setDepartment(department);
        student.setMobile(mobile);

        StudentService service = new StudentService();

        boolean result = service.updateStudent(student);

        if (result) {
            session.setAttribute("student", student);
            session.setAttribute("email", student.getEmail());

            request.setAttribute("status",
                    "Profile updated successfully!");
        } else {
            request.setAttribute("status",
                    "Profile update failed. Email may already be in use.");
        }

        request.setAttribute("student", student);

        request.getRequestDispatcher("editprofile.jsp")
                .forward(request, response);
    }
}
