<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Admin" %>
<%@ page import="com.example.vehiclerentalsystem.management.AdminManager" %>
<%@ page session="true" %>

<%
  String role = (String) session.getAttribute("role");
  if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
  }

  String usernameParam = request.getParameter("username");
  AdminManager adminManager = new AdminManager();
  Admin selectedAdmin = null;

  for (Admin a : adminManager.getAllAdmins()) {
    if (a.getUsername().equals(usernameParam)) {
      selectedAdmin = a;
      break;
    }
  }

  if (selectedAdmin == null) {
    response.sendRedirect("manageAdmins");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Admin | RentC</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f7f9fb;
      padding: 40px;
    }

    .form-container {
      max-width: 600px;
      margin: auto;
      padding: 30px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 0 12px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
    }

    .btn-update {
      width: 100%;
      background-color: #007bff;
      color: white;
      font-weight: bold;
    }

    .btn-update:hover {
      background-color: #0056b3;
    }

    .btn-back {
      margin-top: 15px;
      display: block;
      text-align: center;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Edit Admin</h2>
  <form method="post" action="manageAdmins">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="username" value="<%= selectedAdmin.getUsername() %>"/>

    <div class="mb-3">
      <label>Username</label>
      <input type="text" class="form-control" value="<%= selectedAdmin.getUsername() %>" disabled/>
    </div>

    <div class="mb-3">
      <label>New Password</label>
      <input type="text" name="password" value="<%= selectedAdmin.getPassword() %>" class="form-control" required/>
    </div>

    <div class="mb-3">
      <label>Phone</label>
      <input type="text" name="phone" value="<%= selectedAdmin.getPhone() %>" class="form-control" required/>
    </div>

    <div class="mb-3">
      <label>NIC</label>
      <input type="text" name="nic" value="<%= selectedAdmin.getNIC() %>" class="form-control" required/>
    </div>

    <button type="submit" class="btn btn-update">Update Admin</button>
  </form>

  <a href="manageAdmins" class="btn-back">← Back to Admin Management</a>
</div>

</body>
</html>
