<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('images/logWall.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 400px;
            margin: 100px auto;
            background: rgba(137, 96, 220, 0.76);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #0073e6;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #005bb5;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>🔐 Login</h2>
    <form action="login" method="post">

        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <select name="role" required>
            <option value="">Select Role</option>
            <option value="admin">Admin</option>
            <option value="user">User</option>
        </select>
        <button type="submit">Login</button>
        <div style="margin-top: 15px; text-align: center;">
            <p>Not a member? <a href="userRegistation.jsp" style="color: #ffffff; text-decoration: none;">Sign up now</a></p>
            <p><a href="index.html" style="color: #ffffff; text-decoration: none;">← Back to Home Page</a></p>
        </div>

    </form>
</div>
</body>
</html>

