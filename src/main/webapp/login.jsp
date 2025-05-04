<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | RentC</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="main_div">
    <div class="title">Login Form</div>

    <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
    %>
    <div style="color:red; font-weight:bold; text-align:center; margin-bottom: 10px;"><%= error %></div>
    <% } %>

    <form action="login" method="post">
        <div class="input_box">
            <input type="text" name="username" placeholder="User Name" required>
        </div>
        <div class="input_box">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="input_box button">
            <input type="submit" value="Login">
        </div>
        <div class="sign_up">
            Not a member? <a href="register.jsp">Signup now</a>
        </div>
    </form>
</div>
</body>
</html>
