
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<%@ page import="com.model.Event" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard | CEMS</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    background: #f5f2ff;
    color: #333;
}

header {
    background: #6741d9;
    color: white;
    padding: 20px 6%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h2 {
    font-size: 25px;
}

header a {
    color: white;
    text-decoration: none;
    background: #5030b5;
    padding: 10px 18px;
    border-radius: 7px;
}

.container {
    width: 88%;
    max-width: 1150px;
    margin: 30px auto;
}

.welcome {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.06);
    margin-bottom: 25px;
}

.welcome h2 {
    color: #6741d9;
    margin-bottom: 10px;
}

.details {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
    margin-top: 20px;
}

.detail-box {
    background: #f5f2ff;
    padding: 15px;
    border-radius: 8px;
}

.detail-box p {
    color: #777;
    font-size: 13px;
    margin-bottom: 5px;
}

.detail-box h3 {
    font-size: 16px;
    word-break: break-word;
}

.message {
    background: #e9e1ff;
    color: #5030b5;
    padding: 14px;
    margin-bottom: 20px;
    border-radius: 8px;
}

.section-title {
    color: #5030b5;
    margin: 30px 0 18px;
}

.event-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 20px;
}

.event-card {
    background: white;
    padding: 22px;
    border-radius: 12px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.06);
}

.event-card h3 {
    color: #6741d9;
    margin-bottom: 12px;
}

.event-card p {
    margin: 9px 0;
    font-size: 14px;
    line-height: 1.5;
}

.event-card form {
    margin-top: 15px;
}

.register-btn {
    background: #6741d9;
    color: white;
    border: none;
    padding: 11px 18px;
    border-radius: 7px;
    cursor: pointer;
    font-weight: bold;
}

.register-btn:hover {
    background: #5030b5;
}

.registered-label {
    display: inline-block;
    background: #e7f6e9;
    color: #267b38;
    padding: 8px 13px;
    border-radius: 6px;
    margin-top: 12px;
    font-size: 13px;
}

.empty {
    background: white;
    padding: 20px;
    border-radius: 8px;
    color: #777;
}

footer {
    text-align: center;
    padding: 25px;
    color: #777;
    margin-top: 30px;
}
</style>

</head>

<body>

<%
Student student = (Student) request.getAttribute("student");

List<Event> registeredEvents =
    (List<Event>) request.getAttribute("registeredEvents");

List<Event> availableEvents =
    (List<Event>) request.getAttribute("availableEvents");

String message = (String) request.getAttribute("dashboardMessage");
%>

<header>
    <h2>CEMS Student Dashboard</h2>
    <a href="editprofile">Edit My Profile</a>
    <a href="logoutservlet">Logout</a>
</header>

<div class="container">

    <div class="welcome">
        <h2>Welcome, <%= student.getName() %>!</h2>
        <p>Welcome to your College Event Management dashboard.</p>

        <div class="details">

            <div class="detail-box">
                <p>Student Name</p>
                <h3><%= student.getName() %></h3>
            </div>

            <div class="detail-box">
                <p>Email Address</p>
                <h3><%= student.getEmail() %></h3>
            </div>

            <div class="detail-box">
                <p>Department</p>
                <h3><%= student.getDepartment() %></h3>
            </div>

            <div class="detail-box">
                <p>Mobile Number</p>
                <h3><%= student.getMobile() %></h3>
            </div>

        </div>
    </div>

    <% if (message != null) { %>
        <div class="message">
            <%= message %>
        </div>
    <% } %>

    <h2 class="section-title">My Registered Events</h2>

    <div class="event-grid">

        <% if (registeredEvents != null && !registeredEvents.isEmpty()) {
            for (Event event : registeredEvents) {
        %>

            <div class="event-card">

                <h3><%= event.getEventName() %></h3>

                <p><strong>Category:</strong>
                    <%= event.getCategory() %></p>

                <p><strong>Date:</strong>
                    <%= event.getEventDate() %></p>

                <p><strong>Time:</strong>
                    <%= event.getEventTime() %></p>

                <p><strong>Venue:</strong>
                    <%= event.getVenue() %></p>

                <p><strong>Description:</strong>
                    <%= event.getDescription() %></p>

                <span class="registered-label">
                    Registered
                </span>

            </div>

        <% }
        } else { %>

            <div class="empty">
                You have not registered for any events yet.
            </div>

        <% } %>

    </div>


    <h2 class="section-title">Explore New Events</h2>

    <div class="event-grid">

        <% if (availableEvents != null && !availableEvents.isEmpty()) {
            for (Event event : availableEvents) {
        %>

            <div class="event-card">

                <h3><%= event.getEventName() %></h3>

                <p><strong>Category:</strong>
                    <%= event.getCategory() %></p>

                <p><strong>Date:</strong>
                    <%= event.getEventDate() %></p>

                <p><strong>Time:</strong>
                    <%= event.getEventTime() %></p>

                <p><strong>Venue:</strong>
                    <%= event.getVenue() %></p>

                <p><strong>Description:</strong>
                    <%= event.getDescription() %></p>

                <form action="eventregister" method="post">

                    <input type="hidden" name="eventId"
                        value="<%= event.getEventId() %>">

                    <button type="submit" class="register-btn">
                        Register Now
                    </button>

                </form>

            </div>

        <% }
        } else { %>

            <div class="empty">
                No new events are currently available for registration.
            </div>

        <% } %>

    </div>

</div>

<footer>
    College Event Management System | CEMS
</footer>

</body>
</html>
