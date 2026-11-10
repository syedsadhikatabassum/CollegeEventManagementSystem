<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us | CEMS</title>

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
    max-width: 1050px;
    margin: 45px auto;
    padding: 0 20px;
}

.contact-grid {
    display: grid;
    grid-template-columns: 1fr 1.3fr;
    gap: 25px;
}

.contact-info, .contact-form {
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(40,20,90,0.07);
}

h2 {
    margin-bottom: 22px;
    color: #29243b;
}

.info-box {
    margin-bottom: 25px;
}

.info-box h3 {
    color: #6741d9;
    font-size: 16px;
    margin-bottom: 7px;
}

.info-box p {
    color: #777;
    font-size: 14px;
    line-height: 1.7;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    font-size: 14px;
}

input, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 8px;
    outline: none;
    font-size: 14px;
}

input:focus, textarea:focus {
    border-color: #6741d9;
}

textarea {
    resize: vertical;
    min-height: 120px;
}

.submit-btn {
    background: #6741d9;
    color: white;
    border: none;
    padding: 13px 25px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    font-weight: 600;
}

.submit-btn:hover {
    background: #5030b5;
}

footer {
    background: #211b35;
    color: white;
    text-align: center;
    padding: 22px;
    margin-top: 60px;
}

@media(max-width: 700px) {
    header {
        flex-direction: column;
        gap: 15px;
    }

    nav a {
        margin: 0 6px;
        font-size: 13px;
    }

    .contact-grid {
        grid-template-columns: 1fr;
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
        <a href="contactus.jsp">Contact</a>
    </nav>
</header>

<section class="hero">
    <h1>Contact Us</h1>
    <p>We are happy to help you with your event-related questions.</p>
</section>

<div class="container">

    <div class="contact-grid">

        <div class="contact-info">

            <h2>Get In Touch</h2>

            <div class="info-box">
                <h3>College Address</h3>
                <p>Your College Name,<br>
                Your College Address,<br>
                Andhra Pradesh, India.</p>
            </div>

            <div class="info-box">
                <h3>Email Address</h3>
                <p>cems@example.com</p>
            </div>

            <div class="info-box">
                <h3>Phone Number</h3>
                <p>+91 9876543210</p>
            </div>

            <div class="info-box">
                <h3>Working Hours</h3>
                <p>Monday - Saturday<br>
                9:00 AM - 5:00 PM</p>
            </div>

        </div>

        <div class="contact-form">

            <h2>Send Us a Message</h2>

            <form action="ContactServlet" method="post">

                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name"
                           placeholder="Enter your name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email"
                           placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject"
                           placeholder="Enter subject" required>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message"
                              placeholder="Write your message here..."
                              required></textarea>
                </div>

                <button type="submit" class="submit-btn">
                    Send Message
                </button>

            </form>

        </div>

    </div>

</div>

<footer>
    <p>© 2026 CEMS - College Event Management System</p>
    <p>College Event Management Portal</p>
</footer>

</body>
</html>