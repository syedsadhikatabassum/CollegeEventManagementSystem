<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Prevent browser caching after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Admin session validation
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

<title>Admin Dashboard | CEMS</title>

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
    padding: 20px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    color: #b69cff;
    font-size: 26px;
    font-weight: 800;
}

header a {
    color: white;
    text-decoration: none;
}

/* Logout button */

.logout-btn {
    background: #6741d9;
    color: white;
    padding: 10px 20px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
}

.logout-btn:hover {
    background: #5030b5;
}

/* Container */

.container {
    max-width: 1100px;
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

/* Dashboard Cards */

.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 35px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 13px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}

.card h3 {
    color: #777;
    font-size: 15px;
    margin-bottom: 12px;
}

.card p {
    color: #6741d9;
    font-size: 28px;
    font-weight: 800;
}

/* Actions */

.actions {
    background: white;
    padding: 28px;
    border-radius: 13px;
    box-shadow: 0 5px 18px rgba(40,20,90,0.07);
}

.actions h2 {
    margin-bottom: 20px;
}

.action-btn {
    display: inline-block;
    background: #6741d9;
    color: white;
    padding: 13px 20px;
    margin: 7px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
}

.action-btn:hover {
    background: #5030b5;
}

/* Footer */

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 60px;
}

/* Responsive */

@media(max-width: 600px) {

    header {
        padding: 18px 5%;
    }

    .logo {
        font-size: 21px;
    }

    .container {
        margin: 25px auto;
    }

    .actions {
        padding: 20px;
    }

    .action-btn {
        display: block;
        text-align: center;
    }
}

</style>

</head>

<body>

<!-- Header -->

<header>

    <div class="logo">CEMS Admin</div>

    <a href="logoutservlet" class="logout-btn">
        Logout
    </a>

</header>


<!-- Dashboard Container -->

<div class="container">

    <h1>Admin Dashboard</h1>

    <p class="subtitle">
        Welcome to the College Event Management System administration panel.
    </p>


    <!-- Dynamic Dashboard Cards -->

    <div class="cards">

        <div class="card">

            <h3>Total Students</h3>

            <p>${totalStudents}</p>

        </div>


        <div class="card">

            <h3>Total Events</h3>

            <p>${totalEvents}</p>

        </div>


        <div class="card">

            <h3>Total Registrations</h3>

            <p>${totalRegistrations}</p>

        </div>

    </div>


    <!-- Admin Actions -->

    <div class="actions">

        <h2>Manage CEMS</h2>

        <a href="adminevents" class="action-btn">
            View Events
        </a>

       

        <a href="adminregistrations" class="action-btn">
            View Registrations
        </a>

    </div>

</div>


<!-- Footer -->

<footer>

    <p>© 2026 CEMS - Admin Panel</p>

</footer>

</body>

</html>