package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Student;

@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        String mobile = request.getParameter("mobile");

        Student student = new Student();

        student.setName(name);
        student.setEmail(email);
        student.setPassword(password);
        student.setDepartment(department);
        student.setMobile(mobile);

        StudentService service = new StudentService();

        boolean status = service.registerStudent(student);

        RequestDispatcher dispatcher = null;

        if (status) {
            request.setAttribute("status", "Registration Successful!");
            dispatcher = request.getRequestDispatcher("login.jsp");
        } else {
            request.setAttribute("status", "Registration Failed. Please try again.");
            dispatcher = request.getRequestDispatcher("register.jsp");
        }

        dispatcher.forward(request, response);
    }
}