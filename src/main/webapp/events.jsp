<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>College Events | CEMS</title>

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
    margin-left: 22px;
    font-weight: 600;
}

nav a:hover {
    color: #6741d9;
}

.hero {
    background: linear-gradient(120deg, #6741d9, #9474ed);
    color: white;
    padding: 65px 8%;
    text-align: center;
}

.hero h1 {
    font-size: 38px;
    margin-bottom: 12px;
}

.hero p {
    font-size: 16px;
    opacity: 0.9;
}

.container {
    max-width: 1100px;
    margin: 45px auto;
    padding: 0 20px;
}

.section-title {
    text-align: center;
    font-size: 29px;
    margin-bottom: 30px;
}

.event-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 25px;
}

.event-card {
    background: white;
    border-radius: 14px;
    padding: 25px;
    box-shadow: 0 5px 20px rgba(40, 20, 90, 0.07);
    transition: 0.3s;
}

.event-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(40, 20, 90, 0.12);
}

.category {
    display: inline-block;
    background: #eee8ff;
    color: #6741d9;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    margin-bottom: 15px;
}

.event-card h3 {
    font-size: 21px;
    margin-bottom: 15px;
}

.event-info {
    color: #777;
    font-size: 14px;
    line-height: 2;
    margin-bottom: 18px;
}

.register-btn {
    display: inline-block;
    background: #6741d9;
    color: white;
    padding: 11px 20px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
}

.register-btn:hover {
    background: #5030b5;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 22px;
    margin-top: 60px;
    font-size: 14px;
}

@media(max-width: 600px) {
    header {
        flex-direction: column;
        gap: 15px;
    }

    nav a {
        margin: 0 7px;
        font-size: 13px;
    }

    .hero h1 {
        font-size: 29px;
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
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </nav>
</header>

<section class="hero">
    <h1>Explore College Events</h1>
    <p>Discover events, showcase your talent and create memories.</p>
</section>

<div class="container">

    <h2 class="section-title">Upcoming Events</h2>

    <div class="event-grid">

        <div class="event-card">
            <span class="category">Technical</span>
            <h3>Tech Fest 2026</h3>
            <div class="event-info">
                Date: 15 December 2026<br>
                Time: 10:00 AM<br>
                Venue: Main Auditorium
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

        <div class="event-card">
            <span class="category">Cultural</span>
            <h3>Annual Cultural Fest</h3>
            <div class="event-info">
                Date: 20 December 2026<br>
                Time: 11:00 AM<br>
                Venue: College Ground
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

        <div class="event-card">
            <span class="category">Sports</span>
            <h3>Sports Championship</h3>
            <div class="event-info">
                Date: 05 January 2027<br>
                Time: 09:00 AM<br>
                Venue: Sports Complex
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

        <div class="event-card">
            <span class="category">Workshop</span>
            <h3>Web Development Workshop</h3>
            <div class="event-info">
                Date: 12 January 2027<br>
                Time: 10:30 AM<br>
                Venue: Computer Lab
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

        <div class="event-card">
            <span class="category">Technical</span>
            <h3>Code Challenge</h3>
            <div class="event-info">
                Date: 18 January 2027<br>
                Time: 09:30 AM<br>
                Venue: Seminar Hall
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

        <div class="event-card">
            <span class="category">Cultural</span>
            <h3>Music and Dance Night</h3>
            <div class="event-info">
                Date: 25 January 2027<br>
                Time: 05:00 PM<br>
                Venue: Open Auditorium
            </div>
            <a href="login.jsp" class="register-btn">Register Now</a>
        </div>

    </div>
</div>

<footer>
    <p>© 2026 CEMS - College Event Management System</p>
    <p>Designed for College Students</p>
</footer>

</body>
</html>