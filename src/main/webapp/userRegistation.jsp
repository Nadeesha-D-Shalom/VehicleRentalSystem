<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Registration</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: url('images/logWall.jpg') no-repeat center center fixed;
      background-size: cover;
    }
    .form-container {
      max-width: 500px;
      margin: 60px auto;
      padding: 30px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }
    .form-container input {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    .form-container button {
      width: 100%;
      padding: 10px;
      background: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      margin-top: 12px;
    }
    .error {
      color: red;
      font-weight: bold;
      margin-bottom: 10px;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>Register as a User</h2>
  <%
    String error = (String) request.getAttribute("errorMessage");
    if (error != null) {
  %>
  <div class="error"><%= error %></div>
  <% } %>
  <form action="registerUser" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="phone" placeholder="Phone Number" required>
    <input type="text" name="nic" placeholder="NIC Number" required>
    <button type="submit">Register</button>
  </form>
</div>
</body>
</html>
