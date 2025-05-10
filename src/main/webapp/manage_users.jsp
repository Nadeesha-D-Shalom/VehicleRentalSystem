<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vehiclerentalsystem.classes.User" %>

<%
  String role = (String) session.getAttribute("role");
  if (role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Users</title>
  <link rel="stylesheet" href="stylesUsers.css" />
</head>
<body>
<div class="sidebar">
  <h1>RentC</h1>
  <a href="adminDashboard.jsp">Dashboard</a>
  <a href="adminHomePage.jsp">Home</a>
  <a href="manageBookings">Manage Bookings</a>
  <a href="manageUsers">Manage Users</a>
  <a href="manage_cars.jsp">Manage Cars</a>
  <a href="index.html">Logout</a>
</div>

<div class="main">
  <div class="top-bar">
    <span class="admin-label">Manage Users</span>
    <button class="profile-btn" title="Profile">
      <svg viewBox="0 0 24 24">
        <path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/>
      </svg>
    </button>
  </div>

  <div class="button-group">
    <a href="adminDashboard.jsp"><button class="new-btn">🔙 Admin Dashboard</button></a>
  </div>

  <h2>Users Details</h2>

  <% if (users != null && !users.isEmpty()) { %>
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
    <% for (User u : users) { %>
    <tr>
      <td><%= u.getUsername() %></td>
      <td><%= u.getPassword() %></td>
      <td><%= u.getPhone() %></td>
      <td><%= u.getNIC() %></td>
      <td>
        <a href="editUser.jsp?username=<%= u.getUsername() %>" class="action-btn edit-btn">✏️ Edit</a>
        <form action="deleteUser" method="post" style="display:inline;">
          <input type="hidden" name="username" value="<%= u.getUsername() %>" />
          <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete <%= u.getUsername() %>?')">🗑️ Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } else { %>
  <div class="no-data">🚫 No users found.</div>
  <% } %>
</div>
</body>
</html>
