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
  <title>Update Password</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background: url('images/log.jpg') no-repeat center center fixed;
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
      padding: 40px 60px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
      text-align: center;
      width: 400px;
    }

    h2 {
      margin-bottom: 25px;
      color: #333;
    }

    input {
      width: 100%;
      padding: 10px;
      margin: 10px 0 20px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    button {
      padding: 12px 25px;
      background-color: #28a745;
      color: white;
      border: none;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
    }

    button:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
<div class="overlay">
  <div class="form-box">
    <h2>Update Your Password</h2>
    <form action="UpdatePasswordServlet" method="post">
      <input type="password" name="oldPassword" placeholder="Current Password" required>
      <input type="password" name="newPassword" placeholder="New Password" required>
      <input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
      <button type="submit">Update Password</button>
    </form>
  </div>
</div>
</body>
</html>
