
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Student;

public class StudentDAO {

    // Register a new student
    public boolean registerStudent(Student student) {

        String sql = "INSERT INTO students "
                + "(name, email, password, department, mobile) "
                + "VALUES (?, ?, ?, ?, ?)";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getPassword());
            ps.setString(4, student.getDepartment());
            ps.setString(5, student.getMobile());

            int result = ps.executeUpdate();

            connection.commit();
            ps.close();
            connection.close();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return false;
        }
    }

    // Student login
    public Student loginStudent(String email, String password) {

        String sql = "SELECT * FROM students WHERE email = ? AND password = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return null;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            Student student = null;

            if (rs.next()) {
                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                student.setDepartment(rs.getString("department"));
                student.setMobile(rs.getString("mobile"));
            }

            rs.close();
            ps.close();
            connection.close();

            return student;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return null;
        }
    }

    // Fetch student details using student ID
    public Student getStudentById(int studentId) {

        String sql = "SELECT * FROM students WHERE student_id = ?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return null;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            Student student = null;

            if (rs.next()) {
                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setDepartment(rs.getString("department"));
                student.setMobile(rs.getString("mobile"));
            }

            rs.close();
            ps.close();
            connection.close();

            return student;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return null;
        }
    }

    // Update student profile
    public boolean updateStudent(Student student) {

        String sql = "UPDATE students SET name=?, email=?, department=?, mobile=? "
                + "WHERE student_id=?";

        Connection connection = ConnectionManager.getConnection();

        if (connection == null) {
            return false;
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getDepartment());
            ps.setString(4, student.getMobile());
            ps.setInt(5, student.getStudentId());

            int result = ps.executeUpdate();

            connection.commit();
            ps.close();
            connection.close();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                connection.rollback();
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return false;
        }
    }
}
