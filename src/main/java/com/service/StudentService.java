
package com.service;

import com.dao.StudentDAO;
import com.model.Student;

public class StudentService {

    private StudentDAO studentDAO = new StudentDAO();

    // Student registration
    public boolean registerStudent(Student student) {
        return studentDAO.registerStudent(student);
    }

    // Student login
    public Student loginStudent(String email, String password) {
        return studentDAO.loginStudent(email, password);
    }

    // Get student details
    public Student getStudentById(int studentId) {
        return studentDAO.getStudentById(studentId);
    }

    // Update student profile
    public boolean updateStudent(Student student) {
        return studentDAO.updateStudent(student);
    }
}
