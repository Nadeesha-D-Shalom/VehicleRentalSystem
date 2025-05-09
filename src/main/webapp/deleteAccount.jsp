<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete My Account</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/logWall.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.65);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-box {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #c0392b;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            padding: 12px 25px;
            background-color: #e74c3c;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<div class="overlay">
    <div class="form-box">
        <h2>Delete Account</h2>
        <form action="DeleteUserServlet" method="post">
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Confirm Delete</button>
        </form>
    </div>
</div>
</body>
</html>
