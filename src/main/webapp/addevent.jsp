
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Event | CEMS Admin</title>

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
    font-weight: 600;
}

nav a:hover {
    color: #b69cff;
}

.container {
    max-width: 750px;
    margin: 40px auto;
    padding: 0 20px;
}

h1 {
    margin-bottom: 10px;
}

.subtitle {
    color: #777;
    margin-bottom: 25px;
}

.form-box {
    background: white;
    padding: 30px;
    border-radius: 13px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
}

input, select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 7px;
    font-size: 15px;
    outline: none;
}

input:focus, select:focus, textarea:focus {
    border-color: #6741d9;
}

textarea {
    resize: vertical;
    min-height: 100px;
}

button {
    background: #6741d9;
    color: white;
    border: none;
    padding: 13px 25px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
}

button:hover {
    background: #5030b5;
}

.cancel-btn {
    display: inline-block;
    background: #777;
    color: white;
    text-decoration: none;
    padding: 13px 25px;
    border-radius: 8px;
    margin-left: 10px;
}

.cancel-btn:hover {
    background: #555;
}

.status {
    margin-bottom: 18px;
    color: #c0392b;
    font-weight: 600;
}

.success {
    color: #218838;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 60px;
}

@media(max-width: 600px) {
    header {
        flex-direction: column;
        gap: 15px;
    }

    nav a {
        margin: 5px;
    }

    .form-box {
        padding: 20px;
    }
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

    <h1>Add New Event</h1>

    <p class="subtitle">
        Enter the event details to add a new college event.
    </p>

    <div class="form-box">

        <% if (request.getAttribute("status") != null) { %>
            <p class="status">
                <%= request.getAttribute("status") %>
            </p>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <p class="status success">
                <%= request.getAttribute("success") %>
            </p>
        <% } %>

        <form action="addeventservlet" method="post">

            <div class="form-group">
                <label>Event Name</label>
                <input type="text" name="event_name"
                       placeholder="Enter event name" required>
            </div>

            <div class="form-group">
                <label>Category</label>
                <select name="category" required>
                    <option value="">Select Category</option>
                    <option value="Technical">Technical</option>
                    <option value="Cultural">Cultural</option>
                    <option value="Sports">Sports</option>
                    <option value="Workshop">Workshop</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Event Date</label>
                <input type="date" name="event_date" required>
            </div>

            <div class="form-group">
                <label>Event Time</label>
                <input type="time" name="event_time" required>
            </div>

            <div class="form-group">
                <label>Venue</label>
                <input type="text" name="venue"
                       placeholder="Enter event venue" required>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description"
                    placeholder="Enter event description"
                    required></textarea>
            </div>

            <div class="form-group">
                <label>Maximum Participants</label>
                <input type="number" name="max_participants"
                       min="1" placeholder="Enter maximum participants"
                       required>
            </div>

            <button type="submit">Add Event</button>

            <a href="adminevents" class="cancel-btn">Cancel</a>

        </form>

    </div>

</div>


<footer>
    <p>© 2026 CEMS - Admin Panel</p>
</footer>

</body>
</html>
