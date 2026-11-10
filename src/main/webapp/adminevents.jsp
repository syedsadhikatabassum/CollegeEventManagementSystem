<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,java.util.Map" %>

<%
    response.setHeader("Cache-Control",
            "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String, Object>> events =
        (List<Map<String, Object>>) request.getAttribute("events");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Manage Events | CEMS Admin</title>

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
    padding: 20px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;
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
    max-width: 1250px;
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

.add-btn {
    display: inline-block;
    background: #6741d9;
    color: white;
    padding: 12px 20px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    margin-bottom: 25px;
}

.add-btn:hover {
    background: #5030b5;
}

.events-box {
    background: white;
    padding: 25px;
    border-radius: 13px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

.events-box h2 {
    margin-bottom: 20px;
}

.table-container {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 950px;
}

th, td {
    padding: 14px;
    text-align: left;
    border-bottom: 1px solid #eee;
}

th {
    background: #f1edfc;
    color: #5030b5;
}

tr:hover {
    background: #faf9ff;
}

.empty {
    text-align: center;
    padding: 30px;
    color: #777;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 60px;
}
.edit-btn {
    display: inline-block;
    background: #6741d9;
    color: white;
    padding: 8px 13px;
    border-radius: 6px;
    text-decoration: none;
    margin-right: 5px;
}

.delete-btn {
    background: #dc3545;
    color: white;
    padding: 8px 13px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.edit-btn:hover {
    background: #5030b5;
}

.delete-btn:hover {
    background: #b52a37;
}
</style>

</head>

<body>

<!-- Admin Navigation -->

<header>

    <div class="logo">CEMS Admin</div>

    <nav>
        <a href="adminservlet">Dashboard</a>
        <a href="adminevents">Manage Events</a>
        <a href="logoutservlet">Logout</a>
    </nav>

</header>


<!-- Main Content -->

<div class="container">

    <h1>Manage Events</h1>

    <p class="subtitle">
        View and manage all college events.
    </p>

    <a href="addevent.jsp" class="add-btn">
        + Add New Event
    </a>


    <!-- Events Table -->

    <div class="events-box">

        <h2>All Events</h2>

        <div class="table-container">
        <table>

         <tbody>

<%
    if (events != null && !events.isEmpty()) {
        for (Map<String, Object> event : events) {
%>

<tr>
    <td><%= event.get("event_id") %></td>
    <td><%= event.get("event_name") %></td>
    <td><%= event.get("category") %></td>
    <td><%= event.get("event_date") %></td>
    <td><%= event.get("event_time") %></td>
    <td><%= event.get("venue") %></td>
    <td><%= event.get("description") %></td>
    <td><%= event.get("max_participants") %></td>

    <td>
        <a class="edit-btn"
           href="editevent?id=<%= event.get("event_id") %>">
            Edit
        </a>

        <form action="deleteevent" method="post"
              style="display:inline;"
              onsubmit="return confirm('Are you sure you want to delete this event?');">

            <input type="hidden" name="event_id"
                   value="<%= event.get("event_id") %>">

            <button type="submit" class="delete-btn">
                Delete
            </button>

        </form>
    </td>
</tr>

<%
        }
    } else {
%>

<tr>
    <td colspan="9" style="text-align:center;">
        No events found.
    </td>
</tr>

<%
    }
%>

</tbody>
</table>
        </div>

    </div>

</div>


<footer>
    <p>© 2026 CEMS - Admin Panel</p>
</footer>

</body>
</html>