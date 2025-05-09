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
  <title>My Account</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background: url('images/logWall.jpg') no-repeat center center fixed;
      background-size: cover;
    }

    .overlay {
      background-color: rgba(0, 0, 0, 0.7);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .account-box {
      background-color: white;
      padding: 40px 60px;
      border-radius: 15px;
      text-align: center;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      max-width: 500px;
      width: 100%;
    }

    h2 {
      color: #333;
      margin-bottom: 20px;
    }

    .info {
      font-size: 18px;
      margin-bottom: 30px;
    }

    .btn-group {
      display: flex;
      justify-content: space-around;
      gap: 20px;
    }

    .btn {
      padding: 12px 25px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s ease;
    }

    .btn-update {
      background-color: #007bff;
      color: white;
    }

    .btn-update:hover {
      background-color: #0056b3;
    }

    .btn-delete {
      background-color: #dc3545;
      color: white;
    }

    .btn-delete:hover {
      background-color: #b02a37;
    }
  </style>
</head>
<body>
<div class="overlay">
  <div class="account-box">
    <h2>Welcome, <%= username %> 👋</h2>
    <p class="info">Manage your account settings below:</p>
    <div class="btn-group">
      <form action="updatePassword.jsp" method="get">
        <button class="btn btn-update" type="submit">Update Password</button>
      </form>
      <form action="deleteAccount.jsp" method="get">
        <button class="btn btn-delete" type="submit">Delete Account</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
