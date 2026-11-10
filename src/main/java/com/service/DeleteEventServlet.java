package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ConnectionManager;

@WebServlet("/deleteevent")
public class DeleteEventServlet extends HttpServlet {

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

        if (id == null || !id.matches("\\d+")) {
            response.sendRedirect("adminevents");
            return;
        }

        String sql = "DELETE FROM events WHERE event_id=?";

        try (Connection con = ConnectionManager.getConnection()) {

            if (con == null) {
                throw new ServletException("Database connection failed");
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, Integer.parseInt(id));

                int result = ps.executeUpdate();

                if (result > 0) {
                    con.commit();
                } else {
                    con.rollback();
                }
            }

            response.sendRedirect("adminevents");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Unable to delete event.", e);
        }
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("adminevents");
    }
}