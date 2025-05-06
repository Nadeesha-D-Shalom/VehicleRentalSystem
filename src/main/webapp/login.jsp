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
            background: linear-gradient(-45deg, #667eea, #764ba2, #6b8dd6, #9f66cc);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            overflow: hidden;
            position: relative;
        }

        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        .cloud {
            position: absolute;
            font-size: 60px;
            opacity: 0.2;
            animation: driftCloud 40s linear infinite;
        }

        .cloud:nth-child(1) { top: 10%; left: -10%; animation-delay: 0s; }
        .cloud:nth-child(2) { top: 20%; left: -15%; animation-delay: 10s; }
        .cloud:nth-child(3) { top: 30%; left: -20%; animation-delay: 20s; }

        @keyframes driftCloud {
            0% { left: -25%; }
            100% { left: 110%; }
        }

        .plane {
            position: absolute;
            top: 12%;
            font-size: 40px;
            animation: flyPlane 18s linear infinite;
        }

        @keyframes flyPlane {
            0% { left: -10%; top: 12%; }
            50% { top: 10%; }
            100% { left: 110%; top: 12%; }
        }

        .main_div {
            position: relative;
            width: 380px;
            margin: auto;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.25);
            padding: 40px;
            z-index: 2;
            animation: fadeIn 1.2s ease;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-40px);}
            to {opacity: 1; transform: translateY(-50%);}
        }

        .title {
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }

        .input_box {
            margin-bottom: 20px;
        }

        .input_box input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border-radius: 8px;
            border: none;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
        }

        .input_box input:focus {
            outline: none;
            box-shadow: 0 0 5px #88e0ef;
        }

        .button input {
            background: #667eea;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .button input:hover {
            background: #4b5bd5;
        }

        .sign_up {
            text-align: center;
            font-size: 14px;
            color: #f0f0f0;
        }

        .sign_up a {
            color: #ffffff;
            font-weight: bold;
            text-decoration: none;
        }

        .sign_up a:hover {
            text-decoration: underline;
        }

        .error {
            color: #ff4c4c;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
            text-shadow: 0 1px 1px black;
        }
    </style>
</head>
<body>

<!-- Clouds & Airplane -->
<div class="cloud">☁️</div>
<div class="cloud">☁️</div>
<div class="cloud">☁️</div>
<div class="plane">✈️</div>

<div class="cloud">☁️</div>
<!-- Login Form -->
<div class="main_div">
    <div class="title">Login to RentC</div>

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
