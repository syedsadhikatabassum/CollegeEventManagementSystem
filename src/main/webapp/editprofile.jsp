<%@ page import="com.model.Student" %>

<%
Student student = (Student) request.getAttribute("student");

if (student == null) {
    response.sendRedirect("login.jsp");
    return;
}

String status = (String) request.getAttribute("status");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit My Profile - CEMS</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f0fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 420px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #54258a;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            margin-top: 7px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 22px;
            background: #54258a;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #38165f;
        }

        .status {
            text-align: center;
            color: #54258a;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #54258a;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Edit My Profile</h2>

    <% if (status != null) { %>
        <p class="status"><%= status %></p>
    <% } %>

    <form action="editprofile" method="post">

        <label>Name</label>
        <input type="text" name="name"
               value="<%= student.getName() %>" required>

        <label>Email</label>
        <input type="email" name="email"
               value="<%= student.getEmail() %>" required>

        <label>Department</label>
        <input type="text" name="department"
               value="<%= student.getDepartment() == null ? "" : student.getDepartment() %>">

        <label>Mobile Number</label>
        <input type="text" name="mobile"
               value="<%= student.getMobile() == null ? "" : student.getMobile() %>">

        <button type="submit">Update Profile</button>

    </form>

    <a class="back" href="studentdashboard">Back to Dashboard</a>

</div>

</body>
</html>
