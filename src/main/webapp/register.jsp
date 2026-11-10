<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration | CEMS</title>

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
    padding: 30px 15px;
}

.register-container {
    width: 100%;
    max-width: 520px;
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 12px 40px rgba(60, 35, 120, 0.12);
}

.logo {
    text-align: center;
    color: #6741d9;
    font-size: 30px;
    font-weight: 800;
    margin-bottom: 8px;
}

.subtitle {
    text-align: center;
    color: #777;
    font-size: 14px;
    margin-bottom: 25px;
}

h2 {
    text-align: center;
    color: #25213a;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 17px;
}

label {
    display: block;
    margin-bottom: 7px;
    color: #333;
    font-size: 14px;
    font-weight: 600;
}

input {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #ddd;
    border-radius: 9px;
    outline: none;
    font-size: 14px;
}

input:focus {
    border-color: #7651e8;
    box-shadow: 0 0 0 3px rgba(118, 81, 232, 0.12);
}

.register-btn {
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
}

.register-btn:hover {
    background: #5030b5;
}

.extra-links {
    text-align: center;
    margin-top: 22px;
    font-size: 14px;
    color: #666;
}

a {
    color: #6741d9;
    text-decoration: none;
    font-weight: 600;
}

a:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="register-container">

    <div class="logo">CEMS</div>
    <p class="subtitle">College Event Management System</p>

    <h2>Create Your Account</h2>

    <form action="registerservlet" method="post">

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter your full name" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Create a password" required>
        </div>

        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" id="department" name="department"
                   placeholder="Enter your department">
        </div>

        <div class="form-group">
            <label for="mobile">Mobile Number</label>
            <input type="tel" id="mobile" name="mobile"
                   placeholder="Enter your mobile number"
                   pattern="[0-9]{10}" maxlength="10">
        </div>

        <button type="submit" class="register-btn">
            Create Account
        </button>

    </form>

    <div class="extra-links">
        Already have an account?
        <a href="login.jsp">Login Here</a>
    </div>

    <div class="extra-links">
        <a href="index.html">← Back to Home</a>
    </div>

</div>

</body>
</html>