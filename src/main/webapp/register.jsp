<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | RentC</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .main_div {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 350px;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        .title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }

        .input_box {
            margin-bottom: 20px;
        }

        .input_box input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: 0.3s;
            font-size: 14px;
        }

        .input_box input:focus {
            border-color: #74ebd5;
            outline: none;
            box-shadow: 0 0 5px rgba(116, 235, 213, 0.5);
        }

        .input_box.button input {
            background-color: #74ebd5;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }

        .input_box.button input:hover {
            background-color: #56c7ba;
        }

        .sign_up {
            text-align: center;
            margin-top: 10px;
        }

        .sign_up a {
            color: #3333cc;
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
    <div class="title">Create Account</div>

    <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
    %>
    <div class="error"><%= error %></div>
    <% } %>

    <form action="register" method="post">
        <div class="input_box">
            <input type="text" name="username" placeholder="Username" required>
        </div>
        <div class="input_box">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="input_box">
            <input type="text" name="phone" placeholder="Phone Number" required>
        </div>
        <div class="input_box button">
            <input type="submit" value="Register">
        </div>
        <div class="sign_up">
            Already a member? <a href="login.jsp">Login now</a>
        </div>
    </form>
</div>
</body>
</html>
