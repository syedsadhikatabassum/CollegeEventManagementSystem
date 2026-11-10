<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Event | CEMS Admin</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    background: #f7f6fc;
    color: #29243b;
}

header {
    background: #211b35;
    color: white;
    padding: 20px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    color: #b69cff;
    font-size: 25px;
    font-weight: 800;
}

nav a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
}

.container {
    max-width: 750px;
    margin: 40px auto;
    padding: 0 20px;
}

.form-box {
    background: white;
    padding: 30px;
    border-radius: 13px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

h1 {
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
}

input, select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 7px;
    font-size: 15px;
}

textarea {
    min-height: 100px;
    resize: vertical;
}

button {
    background: #6741d9;
    color: white;
    border: none;
    padding: 13px 25px;
    border-radius: 8px;
    cursor: pointer;
}

.cancel {
    display: inline-block;
    background: #777;
    color: white;
    text-decoration: none;
    padding: 13px 25px;
    border-radius: 8px;
    margin-left: 10px;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 60px;
}

</style>

</head>

<body>

<header>
    <div class="logo">CEMS Admin</div>

    <nav>
        <a href="adminservlet">Dashboard</a>
        <a href="adminevents">Manage Events</a>
        <a href="logoutservlet">Logout</a>
    </nav>
</header>

<div class="container">

    <h1>Edit Event</h1>

    <div class="form-box">

        <form action="updateevent" method="post">

            <input type="hidden" name="event_id"
                   value="<%= request.getAttribute("eventId") %>">

            <div class="form-group">
                <label>Event Name</label>
                <input type="text" name="event_name"
                       value="<%= request.getAttribute("eventName") %>"
                       required>
            </div>

            <div class="form-group">
                <label>Category</label>

                <select name="category" required>

                    <option value="Technical"
                    <%= "Technical".equals(request.getAttribute("category")) ? "selected" : "" %>>
                        Technical
                    </option>

                    <option value="Cultural"
                    <%= "Cultural".equals(request.getAttribute("category")) ? "selected" : "" %>>
                        Cultural
                    </option>

                    <option value="Sports"
                    <%= "Sports".equals(request.getAttribute("category")) ? "selected" : "" %>>
                        Sports
                    </option>

                    <option value="Workshop"
                    <%= "Workshop".equals(request.getAttribute("category")) ? "selected" : "" %>>
                        Workshop
                    </option>

                    <option value="Other"
                    <%= "Other".equals(request.getAttribute("category")) ? "selected" : "" %>>
                        Other
                    </option>

                </select>
            </div>

            <div class="form-group">
                <label>Event Date</label>
                <input type="date" name="event_date"
                       value="<%= request.getAttribute("eventDate") %>"
                       required>
            </div>

            <div class="form-group">
                <label>Event Time</label>
                <input type="time" name="event_time"
                       value="<%= request.getAttribute("eventTime") %>"
                       required>
            </div>

            <div class="form-group">
                <label>Venue</label>
                <input type="text" name="venue"
                       value="<%= request.getAttribute("venue") %>"
                       required>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description" required><%= request.getAttribute("description") %></textarea>
            </div>

            <div class="form-group">
                <label>Maximum Participants</label>
                <input type="number" name="max_participants"
                       min="1"
                       value="<%= request.getAttribute("maxParticipants") %>"
                       required>
            </div>

            <button type="submit">Update Event</button>

            <a href="adminevents" class="cancel">Cancel</a>

        </form>

    </div>

</div>

<footer>
    <p>© 2026 CEMS - Admin Panel</p>
</footer>

</body>
</html>