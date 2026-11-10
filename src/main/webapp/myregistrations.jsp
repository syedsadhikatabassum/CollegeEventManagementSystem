<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Registrations | CEMS</title>

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
    background: white;
    padding: 20px 8%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 12px rgba(0,0,0,0.05);
}

.logo {
    color: #6741d9;
    font-size: 27px;
    font-weight: 800;
}

nav a {
    text-decoration: none;
    color: #555;
    margin-left: 20px;
    font-weight: 600;
}

nav a:hover {
    color: #6741d9;
}

.hero {
    background: linear-gradient(120deg, #6741d9, #9474ed);
    color: white;
    text-align: center;
    padding: 55px 20px;
}

.hero h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.container {
    max-width: 1050px;
    margin: 45px auto;
    padding: 0 20px;
}

.container h2 {
    margin-bottom: 25px;
}

.table-container {
    background: white;
    padding: 20px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(40,20,90,0.07);
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 650px;
}

th, td {
    padding: 16px 12px;
    text-align: left;
    border-bottom: 1px solid #eee;
    font-size: 14px;
}

th {
    color: #6741d9;
    background: #f4f0ff;
}

.status {
    display: inline-block;
    background: #e5f8ec;
    color: #218044;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
}

.empty-message {
    text-align: center;
    color: #777;
    padding: 30px;
}

.explore-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 11px 20px;
    background: #6741d9;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 22px;
    margin-top: 70px;
}

@media(max-width: 600px) {
    header {
        flex-direction: column;
        gap: 15px;
    }

    nav a {
        margin: 0 6px;
        font-size: 13px;
    }

    .hero h1 {
        font-size: 27px;
    }
}
</style>
</head>

<body>

<header>
    <div class="logo">CEMS</div>

    <nav>
        <a href="index.html">Home</a>
        <a href="events.jsp">Events</a>
        <a href="myregistrations.jsp">My Registrations</a>
        <a href="login.jsp">Logout</a>
    </nav>
</header>

<section class="hero">
    <h1>My Registrations</h1>
    <p>View and manage your registered college events.</p>
</section>

<div class="container">

    <h2>Your Registered Events</h2>

    <div class="table-container">

        <table>
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Category</th>
                    <th>Event Date</th>
                    <th>Venue</th>
                    <th>Registration Status</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>Tech Fest 2026</td>
                    <td>Technical</td>
                    <td>15 December 2026</td>
                    <td>Main Auditorium</td>
                    <td><span class="status">Registered</span></td>
                </tr>

                <tr>
                    <td>Annual Cultural Fest</td>
                    <td>Cultural</td>
                    <td>20 December 2026</td>
                    <td>College Ground</td>
                    <td><span class="status">Registered</span></td>
                </tr>
            </tbody>
        </table>

        <div class="empty-message">
            <a href="events.jsp" class="explore-btn">
                Explore More Events
            </a>
        </div>

    </div>

</div>

<footer>
    <p>© 2026 CEMS - College Event Management System</p>
    <p>College Event Management Portal</p>
</footer>

</body>
</html>