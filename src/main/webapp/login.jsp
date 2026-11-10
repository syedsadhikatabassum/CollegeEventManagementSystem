<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Login | CEMS</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #eee9ff, #f8f7ff);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.login-container {
    width: 100%;
    max-width: 430px;
    background: #fff;
    padding: 40px 35px;
    border-radius: 18px;
    box-shadow: 0 12px 40px rgba(60, 35, 120, 0.12);
}

.logo {
    text-align: center;
    font-size: 30px;
    font-weight: 800;
    color: #6741d9;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 30px;
    font-size: 14px;
}

h2 {
    text-align: center;
    color: #25213a;
    margin-bottom: 25px;
    font-size: 25px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-weight: 600;
    font-size: 14px;
}

input {
    width: 100%;
    padding: 13px 14px;
    border: 1px solid #ddd;
    border-radius: 9px;
    outline: none;
    font-size: 15px;
    transition: 0.3s;
}

input:focus {
    border-color: #7651e8;
    box-shadow: 0 0 0 3px rgba(118, 81, 232, 0.12);
}

.login-btn {
    width: 100%;
    padding: 14px;
    background: #6741d9;
    color: white;
    border: none;
    border-radius: 9px;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    margin-top: 8px;
    transition: 0.3s;
}

.login-btn:hover {
    background: #5030b5;
    transform: translateY(-2px);
}

.extra-links {
    text-align: center;
    margin-top: 22px;
    font-size: 14px;
    color: #666;
    line-height: 2;
}

a {
    color: #6741d9;
    text-decoration: none;
    font-weight: 600;
}

a:hover {
    text-decoration: underline;
}

.home-link {
    display: block;
    text-align: center;
    margin-top: 18px;
    color: #777;
    font-size: 14px;
}
</style>
</head>

<body>

<div class="login-container">

    <div class="logo">CEMS</div>
    <p class="subtitle">College Event Management System</p>

    <h2>Welcome Back!</h2>

    <% 
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
        <p style="color:red; text-align:center; margin-bottom:15px;">
            Invalid email or password. Please try again.
        </p>
    <% } %>

    <form action="loginservlet" method="post">

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Enter your password" required>
        </div>

        <button type="submit" class="login-btn">Login</button>

    </form>

    <div class="extra-links">
        Don't have an account?
        <a href="register.jsp">Register Now</a>
    </div>

    <a href="index.jsp" class="home-link">← Back to Home</a>

</div>

</body>
</html>
