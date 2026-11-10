package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Student;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Admin login validation
        String adminEmail = "admin@gmail.com";
        String adminPassword = "123456";

        if (adminEmail.equals(email) && adminPassword.equals(password)) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", "admin");
            session.setAttribute("email", email);

            response.sendRedirect("adminservlet");
        } else {

            // Student login validation
            StudentService service = new StudentService();
            Student student = service.loginStudent(email, password);

            if (student != null) {

                HttpSession session = request.getSession();

                session.setAttribute("student", student);
                session.setAttribute("email", student.getEmail());

                response.sendRedirect("studentdashboard");

            } else {

                request.setAttribute("status",
                        "Invalid Email or Password!");

                RequestDispatcher dispatcher =
                        request.getRequestDispatcher("login.jsp");

                dispatcher.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }
}