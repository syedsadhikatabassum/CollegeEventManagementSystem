
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

    List<Map<String, Object>> registrations =
        (List<Map<String, Object>>) request.getAttribute("registrations");

    List<Map<String, Object>> events =
        (List<Map<String, Object>>) request.getAttribute("events");

    String selectedEventId =
        (String) request.getAttribute("selectedEventId");

    Integer totalRegistrations =
        (Integer) request.getAttribute("totalRegistrations");
%>

<%!
    // Escape database values before displaying them in HTML
    public String escapeHtml(Object value) {
        if (value == null) return "";

        return value.toString()
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#x27;");
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Registrations | CEMS Admin</title>

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

/* Header */

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

/* Container */

.container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 0 20px;
}

h1 {
    margin-bottom: 10px;
}

.subtitle {
    color: #777;
    margin-bottom: 30px;
}

/* Count card */

.count-card {
    background: white;
    padding: 22px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
    margin-bottom: 25px;
}

.count-card h3 {
    color: #777;
    font-size: 15px;
}

.count-card p {
    color: #6741d9;
    font-size: 28px;
    font-weight: 800;
    margin-top: 10px;
}

/* Filter */

.filter-box {
    background: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

.filter-box form {
    display: flex;
    align-items: center;
    gap: 15px;
    flex-wrap: wrap;
}

label {
    font-weight: 600;
}

select {
    padding: 11px;
    border: 1px solid #ddd;
    border-radius: 7px;
    min-width: 220px;
}

.filter-btn {
    background: #6741d9;
    color: white;
    border: none;
    padding: 11px 20px;
    border-radius: 7px;
    cursor: pointer;
    font-weight: 600;
}

.reset-btn {
    background: #777;
    color: white;
    padding: 11px 20px;
    border-radius: 7px;
    text-decoration: none;
}

/* Table */

.table-box {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

.table-box h2 {
    margin-bottom: 20px;
}

.table-container {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 850px;
}

th, td {
    padding: 15px;
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

.status {
    display: inline-block;
    background: #e3f8e8;
    color: #218838;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
}

.empty {
    text-align: center;
    padding: 35px;
    color: #777;
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
    }

    nav a {
        margin: 5px;
    }

    .filter-box form {
        align-items: stretch;
        flex-direction: column;
    }

    select {
        width: 100%;
    }
}

</style>

</head>

<body>

<!-- Admin Header -->

<header>

    <div class="logo">CEMS Admin</div>

    <nav>
        <a href="adminservlet">Dashboard</a>
        <a href="adminevents">Manage Events</a>
        <a href="adminregistrations">Registrations</a>
        <a href="logoutservlet">Logout</a>
    </nav>

</header>


<!-- Main Container -->

<div class="container">

    <h1>Student Registrations</h1>

    <p class="subtitle">
        View students registered for college events.
    </p>


    <!-- Registration Count -->

    <div class="count-card">

        <h3>Total Registrations</h3>

        <p><%= totalRegistrations == null ? 0 : totalRegistrations %></p>

    </div>


    <!-- Event Filter -->

    <div class="filter-box">

        <form action="adminregistrations" method="get">

            <label>Select Event:</label>

            <select name="eventId">

                <option value="">All Events</option>

                <%
                    if (events != null) {
                        for (Map<String, Object> event : events) {

                            String id = String.valueOf(event.get("event_id"));

                            boolean selected = id.equals(selectedEventId);
                %>

                    <option value="<%= escapeHtml(id) %>"
                        <%= selected ? "selected" : "" %>>

                        <%= escapeHtml(event.get("event_name")) %>

                    </option>

                <%
                        }
                    }
                %>

            </select>

            <button type="submit" class="filter-btn">
                Filter
            </button>

            <a href="adminregistrations" class="reset-btn">
                View All
            </a>

        </form>

    </div>


    <!-- Registrations Table -->

    <div class="table-box">

        <h2>Registered Students</h2>

        <div class="table-container">

            <table>

                <thead>

                    <tr>
                        <th>Registration ID</th>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Email</th>
                        <th>Event Name</th>
                        <th>Registration Date</th>
                        <th>Status</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    if (registrations != null && !registrations.isEmpty()) {

                        for (Map<String, Object> registration : registrations) {
                %>

                    <tr>

                        <td>
                            <%= escapeHtml(registration.get("registration_id")) %>
                        </td>

                        <td>
                            <%= escapeHtml(registration.get("student_id")) %>
                        </td>

                        <td>
                            <%= escapeHtml(registration.get("student_name")) %>
                        </td>

                        <td>
                            <%= escapeHtml(registration.get("email")) %>
                        </td>

                        <td>
                            <%= escapeHtml(registration.get("event_name")) %>
                        </td>

                        <td>
                            <%= escapeHtml(registration.get("registration_date")) %>
                        </td>

                        <td>
                            <span class="status">
                                <%= escapeHtml(registration.get("status")) %>
                            </span>
                        </td>

                    </tr>

                <%
                        }

                    } else {
                %>

                    <tr>

                        <td colspan="7" class="empty">
                            No students registered for this event.
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
