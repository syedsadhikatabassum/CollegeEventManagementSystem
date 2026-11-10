<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CEMS | College Event Management System</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: #f8f9ff;
            color: #172033;
        }

        /* Navigation */

        header {
            width: 100%;
            padding: 20px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            box-shadow: 0 3px 20px rgba(0,0,0,0.04);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 25px;
            font-weight: 800;
            color: #6046e8;
            letter-spacing: -1px;
        }

        .logo span {
            color: #172033;
        }

        nav {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        nav a {
            text-decoration: none;
            color: #555d70;
            font-size: 14px;
            font-weight: 600;
            transition: 0.3s;
        }

        nav a:hover {
            color: #6046e8;
        }

        .nav-btn {
            background: #6046e8;
            color: white !important;
            padding: 12px 22px;
            border-radius: 8px;
        }

        .nav-btn:hover {
            background: #4931c5;
        }

        /* Hero Section */

        .hero {
            min-height: 570px;
            padding: 90px 8%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            background:
                radial-gradient(circle at 85% 20%, #ddd6ff 0, transparent 30%),
                linear-gradient(120deg, #f7f5ff, #eef0ff);
        }

        .hero-content {
            max-width: 600px;
        }

        .tag {
            display: inline-block;
            background: #e8e2ff;
            color: #6046e8;
            padding: 9px 16px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .hero h1 {
            font-size: 55px;
            line-height: 1.15;
            font-weight: 800;
            color: #172033;
            margin-bottom: 22px;
            letter-spacing: -2px;
        }

        .hero h1 span {
            color: #6046e8;
        }

        .hero p {
            color: #697386;
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 32px;
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .primary-btn, .secondary-btn {
            display: inline-block;
            text-decoration: none;
            padding: 15px 25px;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 700;
            transition: 0.3s;
        }

        .primary-btn {
            background: #6046e8;
            color: white;
            box-shadow: 0 8px 20px rgba(96,70,232,0.2);
        }

        .primary-btn:hover {
            background: #4931c5;
            transform: translateY(-3px);
        }

        .secondary-btn {
            border: 1px solid #d8d8e8;
            color: #333;
            background: white;
        }

        .secondary-btn:hover {
            border-color: #6046e8;
            color: #6046e8;
        }

        .hero-image {
            width: 45%;
            min-height: 340px;
            border-radius: 25px;
            background:
                linear-gradient(rgba(25,20,60,0.12), rgba(25,20,60,0.12)),
                url("https://images.unsplash.com/photo-1506157786151-b8491531f063")
                center/cover;
            box-shadow: 0 25px 50px rgba(45,35,100,0.15);
        }

        /* Statistics */

        .stats {
            display: flex;
            justify-content: center;
            gap: 80px;
            flex-wrap: wrap;
            padding: 35px 8%;
            background: white;
            border-bottom: 1px solid #eeeef5;
        }

        .stat {
            text-align: center;
        }

        .stat h2 {
            color: #6046e8;
            font-size: 30px;
            margin-bottom: 5px;
        }

        .stat p {
            color: #788094;
            font-size: 13px;
        }

        /* Section Heading */

        .section {
            padding: 85px 8%;
        }

        .section-heading {
            text-align: center;
            margin-bottom: 45px;
        }

        .section-heading small {
            color: #6046e8;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .section-heading h2 {
            font-size: 35px;
            margin: 12px 0;
            color: #172033;
        }

        .section-heading p {
            color: #788094;
            font-size: 14px;
        }

        /* Event Cards */

        .event-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .event-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 25px rgba(30,30,60,0.06);
            transition: 0.3s;
        }

        .event-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(30,30,60,0.12);
        }

        .event-image {
            height: 190px;
            background-size: cover;
            background-position: center;
        }

        .event-one {
            background-image: url("https://images.unsplash.com/photo-1519389950473-47ba0277781c");
        }

        .event-two {
            background-image: url("https://images.unsplash.com/photo-1492684223066-81342ee5ff30");
        }

        .event-three {
            background-image: url("https://images.unsplash.com/photo-1514525253161-7a46d19cd819");
        }

        .event-details {
            padding: 24px;
        }

        .event-category {
            display: inline-block;
            color: #6046e8;
            background: #eeeaff;
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 14px;
        }

        .event-details h3 {
            font-size: 19px;
            margin-bottom: 12px;
        }

        .event-details p {
            color: #788094;
            font-size: 13px;
            line-height: 1.7;
            margin-bottom: 18px;
        }

        .event-link {
            color: #6046e8;
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
        }

        /* Categories */

        .categories {
            background: #f0eeff;
            padding: 75px 8%;
        }

        .category-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .category-box {
            background: white;
            padding: 30px 15px;
            text-align: center;
            border-radius: 13px;
            transition: 0.3s;
        }

        .category-box:hover {
            transform: translateY(-5px);
        }

        .category-icon {
            font-size: 35px;
            margin-bottom: 15px;
        }

        .category-box h3 {
            font-size: 16px;
            margin-bottom: 8px;
        }

        .category-box p {
            color: #788094;
            font-size: 12px;
        }

        /* Call to Action */

        .cta {
            margin: 75px 8%;
            padding: 60px 30px;
            text-align: center;
            border-radius: 20px;
            color: white;
            background: linear-gradient(120deg, #6046e8, #9277ff);
        }

        .cta h2 {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .cta p {
            font-size: 14px;
            margin-bottom: 25px;
            color: #eeeaff;
        }

        .cta a {
            display: inline-block;
            background: white;
            color: #6046e8;
            padding: 14px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
        }

        /* Footer */

        footer {
            background: #17182e;
            color: white;
            padding: 45px 8% 20px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            gap: 30px;
            flex-wrap: wrap;
            margin-bottom: 35px;
        }

        .footer-content h3 {
            margin-bottom: 15px;
        }

        .footer-content p {
            color: #aaaabd;
            font-size: 13px;
            line-height: 1.8;
        }

        .footer-content a {
            display: block;
            color: #aaaabd;
            text-decoration: none;
            margin-bottom: 10px;
            font-size: 13px;
        }

        .footer-content a:hover {
            color: white;
        }

        .copyright {
            border-top: 1px solid #34344b;
            padding-top: 20px;
            text-align: center;
            color: #aaaabd;
            font-size: 12px;
        }

        /* Responsive Design */

        @media (max-width: 900px) {
            .hero {
                flex-direction: column;
                align-items: flex-start;
            }

            .hero-image {
                width: 100%;
                min-height: 280px;
            }

            .event-container {
                grid-template-columns: repeat(2, 1fr);
            }

            .category-container {
                grid-template-columns: repeat(2, 1fr);
            }

            .hero h1 {
                font-size: 42px;
            }
        }

        @media (max-width: 600px) {
            header {
                flex-direction: column;
                gap: 20px;
                padding: 20px;
            }

            nav {
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
            }

            .hero {
                padding: 60px 6%;
            }

            .hero h1 {
                font-size: 35px;
            }

            .event-container {
                grid-template-columns: 1fr;
            }

            .category-container {
                grid-template-columns: 1fr 1fr;
            }

            .stats {
                gap: 30px;
            }

            .section-heading h2 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->

    <header>
        <div class="logo">CEMS<span>.</span></div>

        <nav>
            <a href="index.jsp">Home</a>
            <a href="#events">Events</a>
            <a href="#categories">Categories</a>
            <a href="#about">About</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp" class="nav-btn">Join Now</a>
        </nav>
    </header>


    <!-- Hero Section -->

    <section class="hero">

        <div class="hero-content">

            <div class="tag">WELCOME TO CAMPUS LIFE</div>

            <h1>
                Discover Events.<br>
                Create <span>Memories.</span>
            </h1>

            <p>
                Your campus, your community, your experiences.
                Explore exciting college events, connect with
                students and make every moment count.
            </p>

            <div class="hero-buttons">
                <a href="#events" class="primary-btn">Explore Events →</a>
                <a href="register.jsp" class="secondary-btn">Get Started</a>
            </div>

        </div>

        <div class="hero-image"></div>

    </section>


    <!-- Statistics -->

    <section class="stats">

        <div class="stat">
            <h2>20+</h2>
            <p>College Events</p>
        </div>

        <div class="stat">
            <h2>500+</h2>
            <p>Student Participants</p>
        </div>

        <div class="stat">
            <h2>10+</h2>
            <p>Event Categories</p>
        </div>

        <div class="stat">
            <h2>100%</h2>
            <p>Campus Excitement</p>
        </div>

    </section>


    <!-- Upcoming Events -->

    <section class="section" id="events">

        <div class="section-heading">
            <small>What's Happening</small>
            <h2>Explore Upcoming Events</h2>
            <p>Find something exciting and be part of the experience.</p>
        </div>

        <div class="event-container">

            <div class="event-card">

                <div class="event-image event-one"></div>

                <div class="event-details">
                    <span class="event-category">TECHNICAL</span>

                    <h3>Tech Fest 2026</h3>

                    <p>
                        Experience innovation, coding challenges,
                        technical competitions and exciting projects.
                    </p>

                    <a href="login.jsp" class="event-link">Register Now →</a>
                </div>

            </div>


            <div class="event-card">

                <div class="event-image event-two"></div>

                <div class="event-details">
                    <span class="event-category">CULTURAL</span>

                    <h3>Annual Cultural Fest</h3>

                    <p>
                        Celebrate creativity through music, dance,
                        performances and amazing student talent.
                    </p>

                    <a href="login.jsp" class="event-link">Register Now →</a>
                </div>

            </div>


            <div class="event-card">

                <div class="event-image event-three"></div>

                <div class="event-details">
                    <span class="event-category">ENTERTAINMENT</span>

                    <h3>Music & Talent Show</h3>

                    <p>
                        Show your talent, enjoy live performances
                        and create unforgettable campus memories.
                    </p>

                    <a href="login.jsp" class="event-link">Register Now →</a>
                </div>

            </div>

        </div>

    </section>


    <!-- Event Categories -->

    <section class="categories" id="categories">

        <div class="section-heading">
            <small>Find Your Interest</small>
            <h2>Explore Event Categories</h2>
            <p>There is something for every student.</p>
        </div>

        <div class="category-container">

            <div class="category-box">
                <div class="category-icon">💻</div>
                <h3>Technical</h3>
                <p>Hackathons, coding and workshops</p>
            </div>

            <div class="category-box">
                <div class="category-icon">🎭</div>
                <h3>Cultural</h3>
                <p>Dance, music and celebrations</p>
            </div>

            <div class="category-box">
                <div class="category-icon">🏆</div>
                <h3>Sports</h3>
                <p>Tournaments and competitions</p>
            </div>

            <div class="category-box">
                <div class="category-icon">🎤</div>
                <h3>Entertainment</h3>
                <p>Shows and student performances</p>
            </div>

        </div>

    </section>


    <!-- About Section -->

    <section class="section" id="about">

        <div class="section-heading">
            <small>About Our Platform</small>
            <h2>Making College Events Easier</h2>

            <p>
                CEMS is a College Event Management System designed
                to simplify event organization and student participation.
                Students can explore events and register, while
                administrators can manage events and registrations
                through a single platform.
            </p>
        </div>

    </section>


    <!-- Call To Action -->

    <section class="cta">

        <h2>Ready to Be Part of Something Exciting?</h2>

        <p>
            Join CEMS today and never miss an exciting campus event.
        </p>

        <a href="register.jsp">Create Your Account →</a>

    </section>


    <!-- Footer -->

    <footer>

        <div class="footer-content">

            <div>
                <h3>CEMS.</h3>
                <p>
                    College Event Management System<br>
                    Connecting students through campus events.
                </p>
            </div>

            <div>
                <h3>Quick Links</h3>
                <a href="index.html">Home</a>
                <a href="#events">Events</a>
                <a href="#about">About Us</a>
            </div>

            <div>
                <h3>Account</h3>
                <a href="login.jsp">Student Login</a>
                <a href="register.jsp">Student Registration</a>
                <a href="contactus.jsp">Contact Us</a>
            </div>

        </div>

        <div class="copyright">
            © 2026 CEMS - College Event Management System. All Rights Reserved.
        </div>

    </footer>

</body>
</html>
