<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | RentC</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(to right, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main_div {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 350px;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .input_box {
            margin-bottom: 20px;
        }

        .input_box input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
        }

        .button input {
            background: #667eea;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .button input:hover {
            background: #4b5bd5;
        }

        .sign_up {
            text-align: center;
            font-size: 14px;
        }

        .sign_up a {
            color: #667eea;
            font-weight: bold;
            text-decoration: none;
        }

        .sign_up a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="main_div">
    <div class="title">Login Form</div>

    <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
    %>
    <div class="error"><%= error %></div>
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
