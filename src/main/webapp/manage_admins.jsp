<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.Admin" %>
<%@ page session="true" %>

<%
  String role = (String) session.getAttribute("role");
  if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Admin> adminList = (List<Admin>) request.getAttribute("adminList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Admins</title>
  <link rel="stylesheet" href="stylesUsers.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background: #f5f9ff;
      font-family: 'Segoe UI', sans-serif;
      padding: 30px;
    }

    .sidebar {
      position: fixed;
      left: 0;
      top: 0;
      width: 200px;
      height: 100%;
      background: #002147;
      color: #fff;
      padding-top: 20px;
    }

    .sidebar h1 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .sidebar a {
      display: block;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
    }

    .sidebar a:hover {
      background-color: #003366;
    }

    .main {
      margin-left: 220px;
      padding: 20px;
    }

    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }

    .admin-label {
      font-size: 20px;
      font-weight: bold;
    }

    .form-section {
      max-width: 700px;
      margin: 0 auto 40px;
      padding: 30px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    .form-control {
      width: 100%;
      padding: 10px;
      font-size: 15px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    .btn-success {
      font-weight: bold;
      font-size: 16px;
      background: linear-gradient(135deg, #28a745, #218838);
      border: none;
    }

    .btn-success:hover {
      background: linear-gradient(135deg, #218838, #1e7e34);
    }

    .text-center {
      text-align: center;
    }

    .row {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .col {
      flex: 1;
      min-width: 45%;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    table th, table td {
      padding: 10px;
      text-align: center;
      border: 1px solid #ddd;
    }

    .action-btn {
      padding: 5px 10px;
      margin: 2px;
      border-radius: 6px;
      font-weight: bold;
      font-size: 14px;
      cursor: pointer;
      border: none;
    }

    .edit-btn {
      background-color: #007bff;
      color: white;
    }

    .delete-btn {
      background-color: #dc3545;
      color: white;
    }

    .no-data {
      text-align: center;
      color: #888;
      padding: 20px;
      font-size: 18px;
    }
  </style>
</head>
<body>

<div class="sidebar">
  <h1>RentC</h1>
  <a href="adminDashboard.jsp">Dashboard</a>
  <a href="adminHomePage.jsp">Home</a>
  <a href="manageBookings">Manage Bookings</a>
  <a href="manageUsers">Manage Users</a>
  <a href="manageCars">Manage Car</a>
  <a href="manageFeedback">Manage Feedback</a>
  <a href="manage_promotions.jsp">Manage Promotions</a>
  <a href="manageAdmins">Manage Admins</a>
  <a href="index.html" style="color: red;">🚪 Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Manage Admins</span>
  </div>

  <div class="form-section">
    <h3 style="margin-bottom: 15px;"> Add New Admin</h3>
    <form method="post" action="manageAdmins">
      <input type="hidden" name="action" value="add" />
      <div class="row mb-3">
        <div class="col">
          <input type="text" name="username" class="form-control" placeholder="Username" required />
        </div>
        <div class="col">
          <input type="password" name="password" class="form-control" placeholder="Password" required />
        </div>
      </div>
      <div class="row mb-3">
        <div class="col">
          <input type="text" name="phone" class="form-control" placeholder="Phone Number" required />
        </div>
        <div class="col">
          <input type="text" name="nic" class="form-control" placeholder="NIC" required />
        </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-success px-4 py-2">Add Admin</button>
      </div>
    </form>
  </div>

  <% if (adminList != null && !adminList.isEmpty()) { %>
  <table>
    <thead>
    <tr>
      <th>Username</th>
      <th>Password</th>
      <th>Phone</th>
      <th>NIC</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Admin a : adminList) { %>
    <tr>
      <td><%= a.getUsername() %></td>
      <td><input type="text" value="<%= a.getPassword() %>" disabled class="form-control" /></td>
      <td><input type="text" value="<%= a.getPhone() %>" disabled class="form-control" /></td>
      <td><input type="text" value="<%= a.getNIC() %>" disabled class="form-control" /></td>
      <td>
        <a href="edit_admin.jsp?username=<%= a.getUsername() %>" class="action-btn edit-btn">Update</a>
        <form method="post" action="manageAdmins" style="display:inline;">
          <input type="hidden" name="action" value="delete" />
          <input type="hidden" name="username" value="<%= a.getUsername() %>" />
          <button type="submit" class="action-btn delete-btn"
                  onclick="return confirm('Delete <%= a.getUsername() %>?')">Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>

  </table>
  <% } else { %>
  <div class="no-data">! No admins found.</div>
  <% } %>
</div>

</body>
</html>
