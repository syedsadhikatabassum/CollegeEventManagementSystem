package com.service;

import java.util.List;

import com.dao.RegistrationDAO;
import com.model.Registration;

public class RegistrationService {

    private RegistrationDAO registrationDAO =
            new RegistrationDAO();

    // Register student for an event
    public boolean registerForEvent(int studentId, int eventId) {
        return registrationDAO.registerForEvent(studentId, eventId);
    }

    // Get all registrations of a student
    public List<Registration> getStudentRegistrations(int studentId) {
        return registrationDAO.getStudentRegistrations(studentId);
    }

    // Cancel registration
    public boolean cancelRegistration(int registrationId) {
        return registrationDAO.cancelRegistration(registrationId);
    }
}