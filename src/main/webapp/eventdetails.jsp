<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Details | CEMS</title>

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
    font-size: 36px;
    margin-bottom: 10px;
}

.container {
    max-width: 850px;
    margin: 45px auto;
    padding: 0 20px;
}

.event-card {
    background: white;
    padding: 35px;
    border-radius: 16px;
    box-shadow: 0 5px 20px rgba(40,20,90,0.08);
}

.category {
    display: inline-block;
    background: #eee8ff;
    color: #6741d9;
    padding: 7px 15px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 18px;
}

.event-card h2 {
    font-size: 28px;
    margin-bottom: 18px;
}

.description {
    color: #777;
    line-height: 1.8;
    margin-bottom: 25px;
}

.details {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 30px;
}

.detail-box {
    background: #f8f6ff;
    padding: 18px;
    border-radius: 10px;
}

.detail-box h4 {
    color: #6741d9;
    margin-bottom: 8px;
    font-size: 14px;
}

.detail-box p {
    color: #444;
    font-size: 15px;
}

.register-btn {
    display: inline-block;
    background: #6741d9;
    color: white;
    padding: 13px 25px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
}

.register-btn:hover {
    background: #5030b5;
}

.back-link {
    display: inline-block;
    margin-left: 15px;
    color: #6741d9;
    text-decoration: none;
    font-weight: 600;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 22px;
    margin-top: 60px;
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

    .details {
        grid-template-columns: 1fr;
    }

    .event-card {
        padding: 22px;
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
    <h1>Event Details</h1>
    <p>Discover all information about your favourite event.</p>
</section>

<div class="container">

    <div class="event-card">

        <span class="category">Technical Event</span>

        <h2>Tech Fest 2026</h2>

        <p class="description">
            Tech Fest 2026 is an exciting technical event organized
            by our college. Students can participate in coding
            competitions, technical quizzes, project presentations
            and other innovative activities. Join us to showcase
            your technical skills and creativity.
        </p>

        <div class="details">

            <div class="detail-box">
                <h4>Event Date</h4>
                <p>15 December 2026</p>
            </div>

            <div class="detail-box">
                <h4>Event Time</h4>
                <p>10:00 AM</p>
            </div>

            <div class="detail-box">
                <h4>Venue</h4>
                <p>Main Auditorium</p>
            </div>

            <div class="detail-box">
                <h4>Category</h4>
                <p>Technical</p>
            </div>

            <div class="detail-box">
                <h4>Maximum Participants</h4>
                <p>100 Students</p>
            </div>

            <div class="detail-box">
                <h4>Registration Status</h4>
                <p>Open</p>
            </div>

        </div>

        <a href="login.jsp" class="register-btn">Register for Event</a>

        <a href="events.jsp" class="back-link">Back to Events</a>

    </div>

</div>

<footer>
    <p>© 2026 CEMS - College Event Management System</p>
    <p>College Event Management Portal</p>
</footer>

</body>
</html>